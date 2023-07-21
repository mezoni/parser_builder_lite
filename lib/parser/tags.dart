import '../helper.dart';
import '../parser_builder.dart';
import 'switch_tags.dart';

class Tags extends ParserBuilder<String, String> {
  final List<String> tags;

  const Tags(this.tags);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    return SwitchTags<String>(
      {for (final tag in tags) tag: escapeString(tag)},
      ['const ErrorExpectedTags([${tags.map(escapeString).join(', ')}])'],
    ).buildBody(context, hasResult);
  }

  @override
  String toString() {
    return '$runtimeType(${tags.map(getAsCode).join(', ')})';
  }
}
