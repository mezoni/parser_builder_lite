import '../helper.dart' as helper;
import '../parser_builder.dart';

class Tag extends ParserBuilder<String, String> {
  final String tag;

  const Tag(this.tag);

  @override
  String get template => '''
{
  const tag = {{tag}};
  if (!state.source.startsWith(tag, state.pos)) {
    final error = ErrorExpectedTags(state.pos, const [tag]);
    return state.fail(error);
  }
  state.pos += {{length}};
  return const Result(tag);
}''';

  @override
  Map<String, Object?> get values => {
        'length': tag.length,
        'tag': helper.escapeString(tag),
      };
}
