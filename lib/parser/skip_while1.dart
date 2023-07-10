import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

class Skip16While1 extends ParserBuilder<String, Object?> {
  final Calculable<bool> predicate;

  const Skip16While1(this.predicate);

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
return state.pos != start ?
    const Result(null)
    : state.pos != source.length ?
        state.fail(const ErrorUnexpectedChar())
       : state.fail(const ErrorUnexpectedEof());''';

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'predicate': predicate.calculate(context, ['c']),
    });
  }
}
