import '../calculable.dart';
import '../helper.dart' as helper;
import '../helper.dart';
import '../parser_builder.dart';

class TakeWhileMN extends ParserBuilder<String, String> {
  static const _template = '''
final source = state.source;
final pos = state.pos;
var count = 0;
while (count < {{n}} && state.pos < source.length) {
  final c = source.runeAt(state.pos);
  final ok = {{predicate}};
  if (!ok) {
    break;
  }
  state.pos += c <= 0xffff ? 1 : 2;
  count++;
}
if (count >= {{m}}) {
  return state.pos != pos ?
      Result(source.substring(pos, state.pos))
      : const Result('');
}
final end = state.pos;
state.pos = pos;
return end < source.length ?
    state.failAt(end, const ErrorUnexpectedChar())
    : state.failAt(end, const ErrorUnexpectedEof());''';

  static const _template0 = '''
final source = state.source;
final pos = state.pos;
var count = 0;
while (count < {{n}} && state.pos < source.length) {
  final c = source.runeAt(state.pos);
  final ok = {{predicate}};
  if (!ok) {
    break;
  }
  state.pos += c <= 0xffff ? 1 : 2;
  count++;
}
return state.pos != pos ?
    Result(source.substring(pos, state.pos))
    : const Result('');''';

  final int m;

  final int n;

  final Calculable<bool> predicate;

  const TakeWhileMN(this.m, this.n, this.predicate);

  @override
  String buildBody(BuildContext context) {
    RangeError.checkNotNegative(m, 'm');
    if (n < m) {
      throw ArgumentError.value(n, 'n', 'Must be greater than or equal to $m');
    }

    return render(m == 0 ? _template0 : _template, {
      'm': helper.getAsCode(m),
      'n': helper.getAsCode(n),
      'predicate': predicate.calculate(context, ['c']),
    });
  }
}
