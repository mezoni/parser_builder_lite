import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

class SkipSatisfy extends ParserBuilder<String, Object?> {
  static const _template = '''
if (state.pos < state.input.length) {
  final c = state.input.runeAt(state.pos);
  final ok = {{predicate}};
  if (ok) {
    state.pos += c <= 0xffff ? 1 : 2;
    return const Result(null);
  }
  return state.fail(const ErrorUnexpectedChar());
}
return state.fail(const ErrorUnexpectedEof());''';

  final Calculable<bool> predicate;

  const SkipSatisfy(this.predicate);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'predicate': predicate.calculate(context, ['c']),
    });
  }
}
