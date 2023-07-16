import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';
import 'satisfy_mixin.dart';

class Satisfy16 extends ParserBuilder<String, int> with SatisfyMixin {
  static const _template = '''
if (state.pos < state.input.length) {
  final c = state.input.codeUnitAt(state.pos);
  final ok = {{predicate}};
  if (ok) {
    state.pos++;
    return Result(c);
  }
  return state.fail(const ErrorUnexpectedChar());
}
return state.fail(const ErrorUnexpectedEof());''';

  @override
  final Calculable<bool> predicate;

  const Satisfy16(this.predicate);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'predicate': predicate.calculate(context, ['c']),
    });
  }
}
