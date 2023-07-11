import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

class Skip16While1 extends ParserBuilder<String, Object?> {
  final Calculable<bool> predicate;

  const Skip16While1(this.predicate);

  static const _template = '''
final input = state.input;
final start = state.pos;
while (state.pos < input.length) {
  final c = input.codeUnitAt(state.pos);
  final v = {{predicate}};
  if (!v) {
    break;
  }
  state.pos++;
}
return state.pos != start ?
    const Result(null)
    : state.pos != input.length ?
        state.fail(const ErrorUnexpectedChar())
       : state.fail(const ErrorUnexpectedEof());''';

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'predicate': predicate.calculate(context, ['c']),
    });
  }
}
