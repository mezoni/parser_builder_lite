import '../parser_builder.dart';

class AnyChar extends ParserBuilder<String, int> {
  @override
  String getTemplate(BuildContext context) => '''
if (state.pos >= state.source.length) {
  return fail(state.pos, const ErrorUnexpectedEof());
}
final c = state.source.readRune(state);
return Result(c);''';
}
