import '../helper.dart';
import '../parser_builder.dart';

class Tag extends ParserBuilder<String, String> {
  static const _template16 = '''
const tag = {{tag}};
if (state.pos < state.input.length && state.input.codeUnitAt(state.pos) == {{char}}) {
  state.pos++;
  return const Result(tag);
}
return state.fail( const ErrorExpectedTags([tag]));''';

  static const _template32 = '''
const tag = {{tag}};
if (state.input.startsWith(tag, state.pos)) {
  state.pos += {{length}};
  return const Result(tag);
}
return state.fail( const ErrorExpectedTags([tag]));''';

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
}
