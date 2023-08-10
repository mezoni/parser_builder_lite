import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

class Not<I> extends ParserBuilder<I, Object?> {
  static const _template = '''
final @pos = state.pos;
@p1
state.ok = !state.ok;
if (!state.ok) {
  final length = state.pos - @pos;
  state.pos = @pos;
  state.fail(ErrorUnexpectedInput(length));
}''';

  static const _templateWithHandler = '''
final @pos = state.pos;
@p1
state.ok = !state.ok;
if (!state.ok) {
  final end = state.pos;
  state.pos = @pos;
  final errors = @handle;
  state.failAll(errors);
}''';

  final Calculable<List<Object>>? handle;

  final ParserBuilder<I, Object?> p;

  const Not(this.p, [this.handle]);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    return renderBody(
      this,
      context,
      hasResult,
      handle == null ? _template : _templateWithHandler,
      handle == null ? _template : _templateWithHandler,
      {
        if (handle != null)
          'handle': handle!.calculate(context, ['state.pos', 'end'])
      },
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
