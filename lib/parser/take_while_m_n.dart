import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

class TakeWhileMN extends ParserBuilder<String, String> {
  static const _template = '''
final @input = state.input;
final @pos = state.pos;
var @count = 0;
while (@count < @n && state.pos < @input.length) {
  final c = @input.@read(state.pos);
  final v = @predicate;
  if (!v) {
    break;
  }
  state.pos += @size;
  @count++;
}
if (state.ok = @count >= @m) {
  @r = state.pos != @pos ?
      @input.substring(@pos, state.pos)
      : '';
} else {
  final failPos = state.pos;
  state.pos = @pos;
  state.failAt(failPos, const ErrorUnexpectedChar());
}''';

  static const _templateNoResult = '''
final @input = state.input;
final @pos = state.pos;
var @count = 0;
while (@count < @n && state.pos < @input.length) {
  final c = @input.@read(state.pos);
  final v = @predicate;
  if (!v) {
    break;
  }
  state.pos += @size;
  @count++;
}
if (!(state.ok = @count >= @m)) {
  final failPos = state.pos;
  state.pos = @pos;
  state.failAt(failPos, const ErrorUnexpectedChar());
}''';

  static const _template0 = '''
final @input = state.input;
final @pos = state.pos;
var @count = 0;
while (@count < @n && state.pos < @input.length) {
  final c = @input.@read(state.pos);
  final v = @predicate;
  if (!v) {
    break;
  }
  state.pos += @size;
  @count++;
}
if (state.ok = true) {
  @r = state.pos != @pos ?
      @input.substring(@pos, state.pos)
      : '';
}''';

  static const _template0NoResult = '''
final @input = state.input;
var @count = 0;
while (@count < @n && state.pos < @input.length) {
  final c = @input.@read(state.pos);
  final v = @predicate;
  if (!v) {
    break;
  }
  state.pos += @size;
  @count++;
}
state.ok = true;''';

  final int m;

  final int n;

  final Calculable<bool> predicate;

  const TakeWhileMN(this.m, this.n, this.predicate);

  @override
  bool get isOptional => m == 0 ? true : false;

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    RangeError.checkNotNegative(m, 'm');
    if (n < m) {
      throw ArgumentError.value(n, 'n', 'Must be greater than or equal to $m');
    }

    final reader = getCharReader(is16BitPredicate(predicate), 'c');
    final template = m == 0 ? _template0 : _template;
    final templateNoResult = m == 0 ? _template0NoResult : _templateNoResult;
    return renderBody(
      this,
      context,
      hasResult,
      template,
      templateNoResult,
      {
        'm': getAsCode(m),
        'n': getAsCode(n),
        'predicate': predicate.calculate(context, ['c']),
        'read': reader.name,
        'size': reader.size,
      },
    );
  }
}
