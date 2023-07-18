import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';
import '../parser_mixins.dart';
import 'satisfy16.dart';

class Satisfy extends ParserBuilder<String, int>
    with SatisfyMixin<String, int> {
  static const _template = '''
if (state.pos < state.input.length) {
  final c = state.input.runeAt(state.pos);
  final ok = {{predicate}};
  if (ok) {
    state.pos += c <= 0xffff ? 1 : 2;
    return Result(c);
  }
  return state.fail(const ErrorUnexpectedChar());
}
return state.fail(const ErrorUnexpectedEof());''';

  @override
  final Calculable<bool> predicate;

  const Satisfy(this.predicate);

  @override
  String buildBody(BuildContext context) {
    if (is16BitPredicate(predicate)) {
      return Satisfy16(predicate).buildBody(context);
    }

    return render(_template, {
      'predicate': predicate.calculate(context, ['c']),
    });
  }
}
