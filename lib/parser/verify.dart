import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

class Verify<I, O> extends ParserBuilder<I, O> {
  static const _template = '''
@p1
if (state.ok) {
  final v = @rv1;
  state.ok = @verify;
  if (state.ok) {
    @r = @r1;
  }
}''';

  static const _templateNoResult = '''
@p1
if (state.ok) {
  final v = @rv1;
  state.ok = @predicate;
}''';

  final ParserBuilder<I, O> p;

  final Calculable<bool> predicate;

  const Verify(this.p, this.predicate);

  @override
  bool get isOptional => true;

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    return renderBody(
      this,
      context,
      hasResult,
      _template,
      _templateNoResult,
      {
        'predicate': predicate.calculate(context, ['v'])
      },
    );
  }

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return [(p, true)];
  }
}
