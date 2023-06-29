import '../helper.dart' as helper;
import '../parser_builder.dart';

class Tags extends ParserBuilder<String, String> {
  final List<String> tags;

  const Tags(this.tags);

  @override
  String getTemplate(BuildContext context) => '''
const tags = {{tags}};
final source = state.source;
final pos = state.pos;
for (var i = 0; i < {{length}}; i++) {
  final tag = tags[i];
  if (source.startsWith(tag, pos)) {
    state.pos += tag.length;
    return Result(tag);
  }
}
return state.fail(pos, const ErrorExpectedTags(tags));''';

  @override
  Map<String, Object?> getValues(BuildContext context) => {
        'length': helper.getAsCode(tags.length),
        'tags': helper.getAsCode(tags),
      };
}
