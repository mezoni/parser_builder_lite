import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';
import '../parser_mixins.dart';
import 'fast_satisfy16.dart';

class FastSatisfy extends ParserBuilder<String, Object?>
    with SatisfyMixin<String, Object?> {
  static const _template = '''
if (state.pos < state.input.length) {
  final c = state.input.runeAt(state.pos);
  final ok = {{predicate}};
  if (ok) {
    state.pos += c < 0xffff ? 1 : 2;
    return const Result(null);
  }
  return state.fail(const ErrorUnexpectedChar());
}
return state.fail(const ErrorUnexpectedEof());''';

  @override
  final Calculable<bool> predicate;

  const FastSatisfy(this.predicate);

  @override
  String buildBody(BuildContext context) {
    if (is16BitPredicate(predicate)) {
      return FastSatisfy16(predicate).buildBody(context);
    }

    return render(_template, {
      'predicate': predicate.calculate(context, ['c']),
    });
  }
}
