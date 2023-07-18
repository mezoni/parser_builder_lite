import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

class Skip16While extends ParserBuilder<String, Object?> {
  final Calculable<bool> predicate;

  const Skip16While(this.predicate);

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

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'predicate': predicate.calculate(context, ['c']),
    });
  }

  @override
  bool isOptional(BuildContext context) {
    return true;
  }
}
