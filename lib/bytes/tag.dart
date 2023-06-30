import '../helper.dart' as helper;
import '../parser_builder.dart';

class Tag extends ParserBuilder<String, String> {
  static const _template = '''
const tag = {{tag}};
if (!state.source.startsWith(tag, state.pos)) {
  return state.fail(state.pos, const ErrorExpectedTags([tag]));
}
state.pos += {{length}};
return const Result(tag);''';

  static const _template16 = '''
const tag = {{tag}};
if (state.pos >= state.source.length || state.source.codeUnitAt(state.pos) != {{char}}) {
  return state.fail(state.pos, const ErrorExpectedTags([tag]));
}
state.pos++;
return const Result(tag);''';

  final String tag;

  const Tag(this.tag);

  @override
  String getTemplate(BuildContext context) {
    if (tag.length == 1) {
      return _template16;
    }

    return _template;
  }

  @override
  Map<String, String> getValues(BuildContext context) => {
        'char': tag.isNotEmpty
            ? helper.getAsCode(tag.codeUnitAt(0))
            : throw StateError('The tag must not be empty'),
        'length': helper.getAsCode(tag.length),
        'tag': helper.escapeString(tag),
      };
}
