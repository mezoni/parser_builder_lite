import '../helper.dart';
import '../parser_builder.dart';

class Eof extends ParserBuilder<String, Object?> {
  static const _template = '''
if (!(state.ok = state.pos >= state.input.length)) {
  state.fail(const ErrorExpectedEof());
}''';

  const Eof();

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    return renderBody(
      this,
      context,
      hasResult,
      _template,
      _template,
      const {},
    );
  }
}
