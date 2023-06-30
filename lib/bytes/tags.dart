import '../helper.dart' as helper;
import '../parser_builder.dart';
import 'switch_tags.dart';

class Tags extends ParserBuilder<String, String> {
  final List<String> tags;

  const Tags(this.tags);

  @override
  String getTemplate(BuildContext context) {
    final switchTags = _getSwitchTags();
    return switchTags.getTemplate(context);
  }

  @override
  Map<String, String> getValues(BuildContext context) {
    final switchTags = _getSwitchTags();
    return switchTags.getValues(context);
  }

  SwitchTags<String> _getSwitchTags() {
    final errors = tags.map(helper.escapeString).join(', ');
    return SwitchTags({
      for (final tag in tags) tag: 'const Result(${helper.escapeString(tag)})'
    }, 'const ErrorExpectedTags([$errors])');
  }
}
