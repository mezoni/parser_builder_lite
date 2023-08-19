import '../helper.dart';
import '../parser_builder.dart';

class Malformed<I, O> extends ParserBuilder<I, O> {
  static const _template = r'''
final @failPos = state.failPos;
final @errorCount = state.errorCount;
@p1
if (state.ok) {
  @r = @r1;
} else {
  if (state.canHandleError(@failPos, @errorCount)) {
    if (state.pos != state.failPos) {
      state.clearErrors(@failPos, @errorCount);
      state.failAt(state.failPos, ErrorMessage(state.pos - state.failPos, @message));
    }
  }
}''';

  static const _templateNoResult = r'''
final @failPos = state.failPos;
final @errorCount = state.errorCount;
@p1
if (!state.ok) {
  if (state.canHandleError(@failPos, @errorCount)) {
    if (state.pos != state.failPos) {
      state.clearErrors(@failPos, @errorCount);
      state.failAt(state.failPos, ErrorMessage(state.pos - state.failPos, @message));
    }
  }
}''';

  final String message;

  final ParserBuilder<I, O> p;

  const Malformed(this.p, this.message);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    return renderBody(
      this,
      context,
      hasResult,
      _template,
      _templateNoResult,
      {
        'message': escapeString(message),
      },
    );
  }

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return [(p, null)];
  }
}
