import '../helper.dart' as helper;
import '../parser_builder.dart';

class Tags extends ParserBuilder<String, String> {
  final List<String> tags;

  const Tags(this.tags);

  @override
  String get template => '''
{
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
  final error = ErrorExpectedTags(pos, tags);
  return state.fail(error);
}''';

  @override
  Map<String, Object?> get values => {
        'length': helper.getAsCode(tags.length),
        'tags': helper.getAsCode(tags),
      };
}
