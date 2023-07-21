import '../helper.dart';
import '../parser_builder.dart';

class PeekChar extends ParserBuilder<String, int> {
  static const _template = '''
if (state.ok = state.pos < state.input.length) {
  @r = state.input.runeAt(state.pos);
} else {
  state.fail(const ErrorUnexpectedEof());
}''';

  static const _templateNoResult = '''
if (!(state.ok = state.pos < state.input.length)) {
  state.fail(const ErrorUnexpectedEof());
}''';

  const PeekChar();

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    return renderBody(
      this,
      context,
      hasResult,
      _template,
      _templateNoResult,
      const {},
    );
  }
}
