import '../helper.dart';
import '../parser_builder.dart';
import 'switch_tags.dart';

class Tags extends ParserBuilder<String, String> {
  final List<String> tags;

  const Tags(this.tags);

  @override
  String buildBody(BuildContext context) {
    return SwitchTags<String>(
      {for (final tag in tags) tag: 'const Result(${escapeString(tag)})'},
      ['const ErrorExpectedTags([${tags.map(escapeString).join(', ')}])'],
    ).buildBody(context);
  }
}
