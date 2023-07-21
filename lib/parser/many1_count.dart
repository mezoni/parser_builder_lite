import '../helper.dart';
import '../parser_builder.dart';

class Many1Count<I> extends ParserBuilder<I, int> {
  static const _template = '''
var @count = 0;
while (true) {
  @p1
  if (!state.ok) {
    break;
  }
  @count++;
}
if (state.ok = @count != 0) {
  @r = @count;
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

  final ParserBuilder<I, Object?> p;

  const Many1Count(this.p);

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
