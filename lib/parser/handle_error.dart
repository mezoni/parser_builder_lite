import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

class HandleError<I, O> extends ParserBuilder<I, O> {
  static const _template = r'''
final @failPos = state.failPos;
final @errorCount = state.errorCount;
@p1
if (state.ok) {
  @r = @r1;
} else if (state.failPos >= @failPos) {
  final (bool, List<ParseError>?) v;
  v = @handle;
  if (v.$1) {
    state.errorCount = state.failPos > @failPos ? 0 : @errorCount;
  }
  if (v.$2 != null) {
    final list = v.$2!;
    for (var i = 0; i < list.length; i++) {
      state.errors[state.errorCount++] = list[i];
    }
  }
}''';

  static const _templateNoResult = r'''
final @failPos = state.failPos;
final @errorCount = state.errorCount;
@p1
if (!state.ok && state.failPos >= @failPos) {
  final (bool, List<ParseError>?) v;
  v = @handle;
  if (v.$1) {
    state.errorCount = state.failPos > @failPos ? 0 : @errorCount;
  }
  if (v.$2 != null) {
    final list = v.$2!;
    for (var i = 0; i < list.length; i++) {
      state.errors[state.errorCount++] = list[i];
    }
  }
}''';

  final Calculable<(bool, List<Object>?)> handle;

  final ParserBuilder<I, O> p;

  const HandleError(this.p, this.handle);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    checkIsNotOptional(p);
    return renderBody(
      this,
      context,
      hasResult,
      _template,
      _templateNoResult,
      {
        'handle': handle
            .calculate(context, ['state.pos', 'state.failPos', 'newErrors']),
      },
    );
  }

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return [(p, null)];
  }
}
