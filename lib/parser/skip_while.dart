import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

class SkipWhile extends ParserBuilder<String, Object?> {
  final Calculable<bool> predicate;

  const SkipWhile(this.predicate);

  static const _template = '''
final input = state.input;
while (state.pos < input.length) {
  final c = input.runeAt(state.pos);
  final v = {{predicate}};
  if (!v) {
    break;
  }
  state.pos += c <= 0xffff ? 1 : 2;
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
