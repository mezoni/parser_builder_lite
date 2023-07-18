import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

class Skip16While extends ParserBuilder<String, Object?> {
  static const _template = '''
final input = state.input;
while (state.pos < input.length) {
  final c = input.codeUnitAt(state.pos);
  final v = {{predicate}};
  if (!v) {
    break;
  }
  state.pos++;
}
return const Result(null);''';

  final Calculable<bool> predicate;

  const Skip16While(this.predicate);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'predicate': predicate.calculate(context, ['c']),
    });
  }

  @override
  bool getIsOptional(BuildContext context) {
    return true;
  }
}
