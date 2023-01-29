import '../parser_builder.dart';

class Eof extends ParserBuilder<String, Object?> {
  const Eof();

  @override
  String get template => '''
{
  if (state.pos >= state.source.length) {
    return const Result(null);
  }
  final error = ErrorExpectedEof(state.pos);
  return state.fail(error);
}''';
}
