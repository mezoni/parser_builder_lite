import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

class TakeWhile extends ParserBuilder<String, String> {
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
if (state.ok = true) {
  @r = state.pos != @pos ?
      @input.substring(@pos, state.pos)
      : '';
}''';

  static const _templateNoResult = '''
final @input = state.input;
while (state.pos < @input.length) {
  final c = @input.@read(state.pos);
  final v = @predicate;
  if (!v) {
    break;
  }
  state.pos += @size;
}
state.ok = true;''';

  final Calculable<bool> predicate;

  const TakeWhile(this.predicate);

  @override
  bool get isOptional => true;

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
