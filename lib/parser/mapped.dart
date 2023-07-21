import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

class Mapped<I, O1, O2> extends ParserBuilder<I, O2> {
  static const _template = '''
@p1
if (state.ok) {
  final v = @rv1;
  @r = @map;
}''';

  static const _templateNoResult = '''
@p1''';

  final Calculable<O2> map;

  final ParserBuilder<I, O1> p;

  const Mapped(this.p, this.map);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    return renderBody(
      this,
      context,
      hasResult,
      _template,
      _templateNoResult,
      {
        'map': map.calculate(context, ['v'])
      },
    );
  }

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return [(p, null)];
  }
}
