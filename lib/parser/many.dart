import '../helper.dart';
import '../parser_builder.dart';

class Many<I, O> extends ParserBuilder<I, List<O>> {
  static const _template = '''
final @list = <@O>[];
while (true) {
  @p1
  if (!state.ok) {
    break;
  }
  @list.add(@rv1);
}
if (state.ok = true) {
  @r = @list;
}''';

  static const _templateNoResult = '''
while (true) {
  @p1
  if (!state.ok) {
    break;
  }
}
state.ok = true;''';

  final ParserBuilder<I, O> p;

  const Many(this.p);

  @override
  bool get isOptional => true;

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    checkIsNotOptional(p);
    return renderBody(
      this,
      context,
      hasResult,
      _template,
      _templateNoResult,
      {'O': '$O'},
    );
  }

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return [(p, null)];
  }
}
