import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

class FastSatisfy16 extends ParserBuilder<String, Object?> {
  static const _template = '''
if (state.pos < state.source.length) {
  final c = state.source.codeUnitAt(state.pos);
  final ok = {{predicate}};
  if (ok) {
    state.pos++;
    return const Result(null);
  }
  return state.fail(const ErrorUnexpectedChar());
}
return state.fail(const ErrorUnexpectedEof());''';

  final Calculable<bool> predicate;

  const FastSatisfy16(this.predicate);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'predicate': predicate.calculate(context, ['c']),
    });
  }
}
