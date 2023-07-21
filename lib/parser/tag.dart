import '../helper.dart';
import '../parser_builder.dart';

class Tag extends ParserBuilder<String, String> {
  static const _template = '''
const @tag = @text;
final @input = state.input;
if (state.ok = state.pos < @input.length &&
    @input.codeUnitAt(state.pos) == @char &&
    @input.startsWith(@tag, state.pos)) {
  state.pos += @length;
  @r = @tag;
} else {
  state.fail(const ErrorExpectedTags([@tag]));
}''';

  static const _templateNoResult = '''
const @tag = @text;
final @input = state.input;
if (state.ok = state.pos < @input.length &&
    @input.codeUnitAt(state.pos) == @char &&
    @input.startsWith(@tag, state.pos)) {
  state.pos += @length;
} else {
  state.fail(const ErrorExpectedTags([@tag]));
}''';

  static const _templateShort = '''
const @tag = @text;
if (state.ok = state.pos + @length <= state.input.length && @test) {
  state.pos += @length;
  @r = @tag;
} else {
  state.fail(const ErrorExpectedTags([@tag]));
}''';

  static const _templateShortNoResult = '''
const @tag = @text;
if (state.ok = state.pos + @length <= state.input.length && @test) {
  state.pos += @length;
} else {
  state.fail(const ErrorExpectedTags([@tag]));
}''';

  final String tag;

  const Tag(this.tag);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    if (tag.isEmpty) {
      throw ArgumentError.value(tag, 'tag', 'Must not be empty');
    }

    final length = tag.length;
    if (length <= 6) {
      final test = List.generate(
          length,
          (i) => i == 0
              ? 'state.input.codeUnitAt(state.pos) == ${tag.codeUnitAt(i)}'
              : 'state.input.codeUnitAt(state.pos + $i) == ${tag.codeUnitAt(i)}');
      return renderBody(
        this,
        context,
        hasResult,
        _templateShort,
        _templateShortNoResult,
        {
          'length': getAsCode(tag.length),
          'text': escapeString(tag),
          'test': test.join(' && '),
        },
      );
    }

    return renderBody(
      this,
      context,
      hasResult,
      _template,
      _templateNoResult,
      {
        'char': getAsCode(tag.codeUnitAt(0)),
        'length': getAsCode(tag.length),
        'text': escapeString(tag),
      },
    );
  }

  @override
  List<(int, int)> getStartingCharacters() {
    if (tag.isEmpty) {
      return const [];
    }

    final rune = tag.runes.first;
    return [(rune, rune)];
  }

  @override
  List<String> getStartingErrors() {
    return ['const ErrorExpectedTags([${escapeString(tag)}])'];
  }

  @override
  String toString() {
    return '$runtimeType(${getAsCode(tag)})';
  }
}
