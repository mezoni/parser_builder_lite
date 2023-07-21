import '../helper.dart';
import '../parser_builder.dart';

class And<I> extends ParserBuilder<I, Object?> {
  static const _template = '''
final @pos = state.pos;
@p1
if (state.ok) {
  state.pos = @pos;
}''';

  final ParserBuilder<I, Object?> p;

  const And(this.p);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    return renderBody(
      this,
      context,
      hasResult,
      _template,
      _template,
      const {},
    );
  }

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return [(p, false)];
  }

  @override
  Iterable<(int, int)> getStartingCharacters() {
    return const [];
  }

  @override
  Iterable<String> getStartingErrors() {
    return const [];
  }
}
