import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';
import '../parser_mixins.dart';

class FastSatisfy16 extends ParserBuilder<String, Object?>
    with SatisfyMixin<String, Object?> {
  static const _template = '''
if (state.pos < state.input.length) {
  final c = state.input.codeUnitAt(state.pos);
  final ok = {{predicate}};
  if (ok) {
    state.pos++;
    return const Result(null);
  }
  return state.fail(const ErrorUnexpectedChar());
}
return state.fail(const ErrorUnexpectedEof());''';

  @override
  final Calculable<bool> predicate;

  const FastSatisfy16(this.predicate);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'predicate': predicate.calculate(context, ['c']),
    });
  }
}
