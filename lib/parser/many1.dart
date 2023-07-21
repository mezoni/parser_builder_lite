import '../helper.dart';
import '../parser_builder.dart';

class Many1<I, O> extends ParserBuilder<I, List<O>> {
  static const _template = '''
final @list = <@O>[];
while (true) {
  @p1
  if (!state.ok) {
    break;
  }
  @list.add(@rv1);
}
if (state.ok = @list.isNotEmpty) {
  @r = @list;
}''';

  static const _templateNoResult = '''
var @count = 0;
while (true) {
  @p1
  if (!state.ok) {
    break;
  }
  @count++;
}
state.ok = @count != 0;''';

  final ParserBuilder<I, O> p;

  const Many1(this.p);

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
