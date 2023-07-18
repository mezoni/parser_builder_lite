import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';
import '../parser_mixins.dart';
import 'skip16_while1.dart';

class SkipWhile1 extends ParserBuilder<String, Object?>
    with SatisfyMixin<String, Object?> {
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
    const Result(null)
    : state.pos != input.length ?
        state.fail(const ErrorUnexpectedChar())
       : state.fail(const ErrorUnexpectedEof());''';

  @override
  final Calculable<bool> predicate;

  const SkipWhile1(this.predicate);

  @override
  String buildBody(BuildContext context) {
    if (is16BitPredicate(predicate)) {
      return Skip16While1(predicate).buildBody(context);
    }

    return render(_template, {
      'predicate': predicate.calculate(context, ['c']),
    });
  }
}
