import '../helper.dart';
import '../parser_builder.dart';

class TakeUntil extends ParserBuilder<String, String> {
  static const _template = '''
const @tag = @text;
final @index = state.input.indexOf(@tag);
if (state.ok = @index >= 0) {
  final pos = state.pos;
  state.pos = @index;
  @r = pos < @index ? state.input.substring(pos, @index) : '';
} else {
  state.fail(const ErrorExpectedTags([@tag]));
}''';

  static const _templateNoResult = '''
const @tag = @text;
final @index = state.input.indexOf(@tag);
if (state.ok = @index >= 0) {
  state.pos = @index;
} else {
  state.fail(const ErrorExpectedTags([@tag]));
}''';

  final String tag;

  const TakeUntil(this.tag);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    if (tag.isEmpty) {
      throw ArgumentError.value(tag, 'tag', 'Must not be empty');
    }

    return renderBody(
      this,
      context,
      hasResult,
      _template,
      _templateNoResult,
      {
        'text': getAsCode(tag),
      },
    );
  }
}
