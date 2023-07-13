import '../helper.dart';
import '../parser_builder.dart';

class Tag extends ParserBuilder<String, String> {
  static const _template16 = '''
const tag = {{tag}};
if (state.pos < state.input.length) {
  if (state.input.codeUnitAt(state.pos) == {{char}}) {
    state.pos++;
    return const Result(tag);
  }
  return state.fail(const ErrorExpectedTags([tag]));
}
return state.fail(const ErrorUnexpectedEof());''';

  static const _template32 = '''
const tag = {{tag}};
if (state.pos < state.input.length) {
  if (state.input.startsWith(tag, state.pos)) {
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

    final template = tag.length == 1 ? _template16 : _template32;
    return render(template, {
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
