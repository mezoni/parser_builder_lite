import '../helper.dart';
import '../parser_builder.dart';

class Recognize extends ParserBuilder<String, String> {
  static const _template = '''
final @pos = state.pos;
@p1
if (state.ok) {
  @r = state.pos != @pos ?
      state.input.substring(@pos, state.pos)
      : '';
}''';

  static const _templateNoResult = '''
@p1''';

  final ParserBuilder<String, Object?> p;

  const Recognize(this.p);

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
  Iterable<(ParserBuilder<String, Object?>, bool?)> getCombinedParsers() {
    return [(p, false)];
  }
}
