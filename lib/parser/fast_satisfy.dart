import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

class FastSatisfy extends ParserBuilder<String, Object?> {
  static const _template = '''
if (state.pos < state.source.length) {
  final c = state.source.runeAt(state.pos);
  final ok = {{predicate}};
  if (ok) {
    state.pos += c < 0xffff ? 1 : 2;
    return const Result(null);
  }
  return state.fail(const ErrorUnexpectedChar());
}
return state.fail(const ErrorUnexpectedEof());''';

  final Calculable<bool> predicate;

  const FastSatisfy(this.predicate);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'predicate': predicate.calculate(context, ['c']),
    });
  }
}
