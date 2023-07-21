import '../helper.dart';
import '../parser_builder.dart';

class AnyChar extends ParserBuilder<String, int> {
  static const _template = '''
if (state.ok = state.pos < state.input.length) {
  final c = state.input.runeAt(state.pos);
  state.pos += c <= 0xffff ? 1 : 2;
  @r = c;
} else {
  state.fail(const ErrorUnexpectedEof());
}''';

  static const _templateNoResult = '''
if (state.ok = state.pos < state.input.length) {
  final c = state.input.runeAt(state.pos);
  state.pos += c <= 0xffff ? 1 : 2;
} else {
  state.fail(const ErrorUnexpectedEof());
}''';

  const AnyChar();

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
