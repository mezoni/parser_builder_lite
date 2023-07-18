import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

class Take16WhileMN extends ParserBuilder<String, String> {
  static const _template = '''
final input = state.input;
final pos = state.pos;
var count = 0;
while (count < {{n}} && state.pos < input.length) {
  final c = input.codeUnitAt(state.pos);
  final ok = {{predicate}};
  if (!ok) {
    break;
  }
  state.pos++;
  count++;
}
if (count >= {{m}}) {
  return state.pos != pos ?
      Result(input.substring(pos, state.pos))
      : const Result('');
}
final end = state.pos;
state.pos = pos;
return end < input.length ?
    state.failAt(end, const ErrorUnexpectedChar())
    : state.failAt(end, const ErrorUnexpectedEof());''';

  static const _template0 = '''
final input = state.input;
final pos = state.pos;
var count = 0;
while (count < {{n}} && state.pos < input.length) {
  final c = input.codeUnitAt(state.pos);
  final ok = {{predicate}};
  if (!ok) {
    break;
  }
  state.pos++;
  count++;
}
return state.pos != pos ?
    Result(input.substring(pos, state.pos))
    : const Result('');''';

  final int m;

  final int n;

  final Calculable<bool> predicate;

  const Take16WhileMN(this.m, this.n, this.predicate);

  @override
  String buildBody(BuildContext context) {
    RangeError.checkNotNegative(m, 'm');
    if (n < m) {
      throw ArgumentError.value(n, 'n', 'Must be greater than or equal to $m');
    }

    return render(m == 0 ? _template0 : _template, {
      'm': getAsCode(m),
      'n': getAsCode(n),
      'predicate': predicate.calculate(context, ['c']),
    });
  }

  @override
  bool isOptional(BuildContext context) {
    return m == 0 ? true : false;
  }
}
