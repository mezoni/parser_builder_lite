import '../helper.dart';
import '../parser_builder.dart';

class Not<I, O> extends ParserBuilder<I, O> {
  static const _template = '''
final @pos = state.pos;
@p1
state.ok = !state.ok;
if (!state.ok) {
  final length = state.pos - @pos;
  state.pos = @pos;
  state.fail(ErrorUnexpectedInput(length));
}''';

  final ParserBuilder<I, O> p;

  const Not(this.p);

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
