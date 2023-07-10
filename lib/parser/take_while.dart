import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

class TakeWhile extends ParserBuilder<String, String> {
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
    Result(source.substring(start, state.pos))
    :  const Result('');''';

  final Calculable<bool> predicate;

  const TakeWhile(this.predicate);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'predicate': predicate.calculate(context, ['c']),
    });
  }
}
