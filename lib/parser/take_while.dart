import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';
import 'take16_while.dart';

class TakeWhile extends ParserBuilder<String, String> {
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
return state.pos != start ?
    Result(input.substring(start, state.pos))
    :  const Result('');''';

  final Calculable<bool> predicate;

  const TakeWhile(this.predicate);

  @override
  String buildBody(BuildContext context) {
    if (is16BitPredicate(predicate)) {
      return Take16While(predicate).buildBody(context);
    }

    return render(_template, {
      'predicate': predicate.calculate(context, ['c']),
    });
  }

  @override
  bool getIsOptional(BuildContext context) {
    return true;
  }
}
