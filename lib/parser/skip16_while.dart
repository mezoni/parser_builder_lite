import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

class Skip16While extends ParserBuilder<String, Object?> {
  final Calculable<bool> predicate;

  const Skip16While(this.predicate);

  static const _template = '''
final source = state.source;
while (state.pos < source.length) {
  final c = source.codeUnitAt(state.pos);
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
}