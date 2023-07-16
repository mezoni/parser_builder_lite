import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';
import 'satisfy_mixin.dart';

class TakeWhile1 extends ParserBuilder<String, String> with SatisfyMixin {
  static const _template = '''
final input = state.input;
final start = state.pos;
while (state.pos < input.length) {
  final c = input.runeAt(state.pos);
  final v = {{predicate}};
  if (!v) {
    break;
  }
  state.pos += c <= 0xffff ? 1 : 2;
}
if (state.pos != start) {
  return Result(input.substring(start, state.pos));
}
if (state.pos != input.length) {
  return state.fail(const ErrorUnexpectedChar());
}
return state.fail(const ErrorUnexpectedEof());''';

  @override
  final Calculable<bool> predicate;

  const TakeWhile1(this.predicate);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'predicate': predicate.calculate(context, ['c']),
    });
  }
}
