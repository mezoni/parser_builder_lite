import '../parser_builder.dart';

class Char extends ParserBuilder<String, int> {
  final int char;

  const Char(this.char);

  @override
  String get template => '''
{
  final source = state.source;
  final pos = state.pos;
  if (state.pos >= source.length) {
    final error = UnexpectedEof(source.length);
    return state.fail(error);
  }
  final c = source.readRune(state);
  if (c == {{char}}) {
    return const Result({{char}});
  }
  final error = ErrorExpectedChar(pos, source)
  return state.fail(error);
}''';

  @override
  Map<String, Object?> get values => {
        'char': char,
      };
}
