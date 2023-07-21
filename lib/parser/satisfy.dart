import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';
import '../parser_mixins.dart';

class Satisfy extends ParserBuilder<String, int> with SatisfyMixin<int> {
  static const _template = '''
if (state.ok = state.pos < state.input.length) {
  final c = state.input.@read(state.pos);
  state.ok = @predicate;
  if (state.ok) {
    state.pos += @size;
    @r = c;
  }
}
if (!state.ok) {
  state.fail(const ErrorUnexpectedChar());
}''';

  static const _templateNoResult = '''
if (state.ok = state.pos < state.input.length) {
  final c = state.input.@read(state.pos);
  state.ok = @predicate;
  if (state.ok) {
    state.pos += @size;
  }
}
if (!state.ok) {
  state.fail(const ErrorUnexpectedChar());
}''';

  @override
  final Calculable<bool> predicate;

  const Satisfy(this.predicate);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    final reader = getCharReader(is16BitPredicate(predicate), 'c');
    return renderBody(
      this,
      context,
      hasResult,
      _template,
      _templateNoResult,
      {
        'predicate': predicate.calculate(context, ['c']),
        'read': reader.name,
        'size': reader.size,
      },
    );
  }
}
