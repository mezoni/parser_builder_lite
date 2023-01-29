import '../parser_builder.dart';

class AnyChar extends ParserBuilder<String, int> {
  @override
  String get template => '''
{
  final pos = state.pos;
  final source = state.source;
  if (pos >= source.length) {
    return fail(ParseError.unexpectedEof);
  }
  throw null;
}''';
}
