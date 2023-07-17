import '../helper.dart';
import '../parser_builder.dart';

class Tag extends ParserBuilder<String, String> {
  static const _template = '''
const tag = {{tag}};
if (state.pos < state.input.length) {
  if (state.input.startsWith(tag, state.pos)) {
    state.pos += {{length}};
    return const Result(tag);
  }
  return state.fail(const ErrorExpectedTags([tag]));
}
return state.fail(const ErrorUnexpectedEof());''';

  static const _templateShort = '''
const tag = {{tag}};
if (state.pos < state.input.length) {
  if ({{test}}) {
    state.pos += {{length}};
    return const Result(tag);
  }
  return state.fail(const ErrorExpectedTags([tag]));
}
return state.fail(const ErrorUnexpectedEof());''';

  final String tag;

  const Tag(this.tag);

  @override
  String buildBody(BuildContext context) {
    if (tag.isEmpty) {
      throw ArgumentError.value(tag, 'tag', 'Must not be empty');
    }

    final length = tag.length;
    if (length < 7) {
      final test = List.generate(
          length,
          (i) => i == 0
              ? 'state.input.codeUnitAt(state.pos) == ${tag.codeUnitAt(i)}'
              : 'state.input.codeUnitAt(state.pos + $i) == ${tag.codeUnitAt(i)}');
      return render(_templateShort, {
        'length': getAsCode(tag.length),
        'tag': escapeString(tag),
        'test': test.join(' && '),
      });
    }

    return render(_template, {
      'char': getAsCode(tag.codeUnitAt(0)),
      'length': getAsCode(tag.length),
      'tag': escapeString(tag),
    });
  }

  @override
  List<String> getStartErrors(BuildContext context) {
    return ['const ErrorExpectedTags([${escapeString(tag)}])'];
  }

  @override
  List<(int, int)> getStartCharacters(BuildContext context) {
    if (tag.isEmpty) {
      return const [];
    }

    final rune = tag.runes.first;
    return [(rune, rune)];
  }
}
