import '../parser_builder.dart';

class Eof extends ParserBuilder<String, Object?> {
  const Eof();

  @override
  String getTemplate(BuildContext context) => '''
if (state.pos >= state.source.length) {
  return const Result(null);
}
return state.fail(const ErrorExpectedEof());''';
}
