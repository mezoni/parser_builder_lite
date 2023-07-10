import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

class Take16While1 extends ParserBuilder<String, String> {
  static const _template = '''
final source = state.source;
final start = state.pos;
while (state.pos < source.length) {
  final c = source.runeAt(state.pos);
  final v = {{predicate}};
  if (!v) {
    break;
  }
  state.pos += c <= 0xffff ? 1 : 2;
}
if (state.pos != start) {
  return Result(source.substring(start, state.pos));
}
if (state.pos != source.length) {
  return state.fail(const ErrorUnexpectedChar());
}
return state.fail(const ErrorUnexpectedEof());''';

  final Calculable<bool> predicate;

  const Take16While1(this.predicate);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'predicate': predicate.calculate(context, ['c']),
    });
  }
}
