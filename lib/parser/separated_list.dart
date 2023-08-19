import '../helper.dart';
import '../parser_builder.dart';

class SeparatedList<I, O1, O2> extends ParserBuilder<I, List<O1>> {
  static const _template = '''
var @pos = state.pos;
final @list = <@O1>[];
while (true) {
  @p1
  if (!state.ok) {
    state.pos = @pos;
    break;
  }
  @list.add(@rv1);
  @pos = state.pos;
  @p2
  if (!state.ok) {
    break;
  }
}
if (state.ok = true) {
  @r = @list;
}''';

  static const _templateNoResult = '''
var @pos = state.pos;
while (true) {
  @p1
  if (!state.ok) {
    state.pos = @pos;
    break;
  }
  @pos = state.pos;
  @p2
  if (!state.ok) {
    break;
  }
}
state.ok = true;''';

  final ParserBuilder<I, O1> p;

  final ParserBuilder<I, O2> sep;

  const SeparatedList(this.p, this.sep);

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
      {'O1': '$O1'},
    );
  }

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return [
      (p, null),
      (sep, false),
    ];
  }
}
