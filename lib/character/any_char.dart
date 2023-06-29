import '../parser_builder.dart';

class AnyChar extends ParserBuilder<String, int> {
  @override
  String getTemplate(BuildContext context) => '''
final pos = state.pos;
final source = state.source;
if (pos >= source.length) {
  return fail(pos, const ErrorUnexpectedEof());
}
final c = source.readRune(state);
return Result(c);''';
}
