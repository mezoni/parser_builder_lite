import '../parser_builder.dart';

class _IdentifierExpression extends ParserBuilder<String, String> {
  final FunctionBuilder<bool> identCont;

  final FunctionBuilder<bool> identStart;

  final List<String> reservedWords;

  const _IdentifierExpression(
      this.reservedWords, this.identStart, this.identCont);

  @override
  String getTemplate(BuildContext context) => '''
final pos = state.pos;
final source = state.source;
if (state.pos >= source.length) {
  return state.failt(const ErrorUnexpectedEof());
}
final c = source.readRune(state);
var ok = {{identStart}}(c);
if (ok) {
  while (state.pos < source.length) {
    final pos = state.pos;
    final c = source.readRune(state);
    ok = {{identCont}}(c);
    if (!ok) {
      state.pos = pos;
      break;
    }
  }
  final word = source.substring(pos, state.pos);
  const words = <String>{{words}};
  ok = words.isEmpty || !words.contains(word);
  if (ok) {
    return const Result(word);
  }
}
if (!ok) {
  state.pos = pos;
  state.failAt(pos, const ErrorExpectedTags(pos, ['identifier']));
}''';
}
