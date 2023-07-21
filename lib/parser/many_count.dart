import '../helper.dart';
import '../parser_builder.dart';

class ManyCount<I> extends ParserBuilder<I, int> {
  static const _template = '''
var @count = 0;
while (true) {
  @p1
  if (!state.ok) {
    break;
  }
  @count++;
}
if (state.ok = true) {
  @r = @count;
}''';

  static const _templateNoResult = '''
while (true) {
  @p1
  if (!state.ok) {
    break;
  }
}
state.ok = true;''';

  final ParserBuilder<I, Object?> p;

  const ManyCount(this.p);

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
      const {},
    );
  }

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return [(p, false)];
  }
}
