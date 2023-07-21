import '../helper.dart';
import '../parser_builder.dart';

class Opt<I, O> extends ParserBuilder<I, O?> {
  static const _template = '''
@p1
if (state.ok) {
  @r = @r1;
} else {
  state.ok = true;
}''';

  static const _templateNoResult = '''
@p1
if (!state.ok) {
  state.ok = true;
}''';

  final ParserBuilder<I, O> p;

  const Opt(this.p);

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
      const {},
    );
  }

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return [(p, null)];
  }
}
