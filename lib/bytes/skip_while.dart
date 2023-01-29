import '../parser_builder.dart';

class SkipWhile0 extends ParserBuilder<String, Object?> {
  final Func<bool> f;

  const SkipWhile0(this.f);

  @override
  String get template => '''
{
  final source = state.source;
  while (state.pos < source.length) {
    final pos = state.pos;
    final c = source.readRune(state);
    final v = {{f}}(c);
    if (!v) {
      state.pos = pos;
      break;
    }
  }
  return const Result(null);
}''';

  @override
  Map<String, Object?> get values => {
        'f': f,
      };
}

class SkipWhile1 extends ParserBuilder<String, Object?> {
  final Func<bool> f;

  const SkipWhile1(this.f);

  @override
  String get template => '''
{
  final source = state.source;
  final start = state.pos;
  if (start >= source.length) {
    final error = ErrorUnexpectedEof(start);
    return state.fail(error);
  }
  while (state.pos < source.length) {
    final pos = state.pos;
    final c = source.readRune(state);
    final ok = {{f}}(c);
    if (!ok) {
      state.pos = pos;
      break;
    }
  }
  if (state.pos == start) {
    final error = ErrorUnexpectedChar(start, source);
    return state.fail(error);
  }
  return const Result(null);
}''';

  @override
  Map<String, Object?> get values => {
        'f': f,
      };
}
