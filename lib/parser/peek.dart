import '../helper.dart';
import '../parser_builder.dart';

class Peek<I, O> extends ParserBuilder<I, O> {
  static const _template = '''
final @pos = state.pos;
@p1
if (state.ok) {
  state.pos = pos;
  @r = @r1;
}''';

  static const _templateNoResult = '''
final @pos = state.pos;
@p1;
if (state.ok) {
  state.pos = pos;
}''';

  final ParserBuilder<I, O> p;

  const Peek(this.p);

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
