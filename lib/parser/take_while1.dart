import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';
import '../parser_mixins.dart';

class TakeWhile1 extends ParserBuilder<String, String>
    with SatisfyMixin<String> {
  static const _template = '''
final @input = state.input;
final @pos = state.pos;
while (state.pos < @input.length) {
  final c = @input.@read(state.pos);
  final v = @predicate;
  if (!v) {
    break;
  }
  state.pos += @size;
}
if (state.ok = state.pos != @pos) {
  @r = @input.substring(@pos, state.pos);
} else {
  final failPos = state.pos;
  state.pos = @pos;
  state.failAt(failPos, const ErrorUnexpectedChar());
}''';

  static const _templateNoResult = '''
final @input = state.input;
final @pos = state.pos;
while (state.pos < @input.length) {
  final c = @input.@read(state.pos);
  final v = @predicate;
  if (!v) {
    break;
  }
  state.pos += @size;
}
if (!(state.ok = state.pos != @pos)) {
  final failPos = state.pos;
  state.pos = @pos;
  state.failAt(failPos, const ErrorUnexpectedChar());
}''';

  @override
  final Calculable<bool> predicate;

  const TakeWhile1(this.predicate);

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
