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
if (pos >= source.length) {
  return state.fail(pos, const ErrorExpectedTags(tags));
}
final c = source.codeUnitAt(pos);
for (var i = 0; i < {{length}}; i++) {
  final tag = tags[i];
  if (c == tag.codeUnitAt(0)) {
    final ok = tag.length == 1 ? true : source.startsWith(tag, pos);
    if (ok) {
      state.pos += tag.length;
      return Result(tag); 
    }
  }  
}
return state.fail(pos, const ErrorExpectedTags(tags));''';

  @override
  Map<String, Object?> getValues(BuildContext context) {
    if (tags.where((e) => e.isEmpty).isNotEmpty) {
      throw StateError('The list of tags must not contain empty tags');
    }

    return {
      'length': helper.getAsCode(tags.length),
      'tags': helper.getAsCode(tags),
    };
  }
}
