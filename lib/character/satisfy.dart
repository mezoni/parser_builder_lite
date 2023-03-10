import '../parser_builder.dart';

class Satisfy extends ParserBuilder<String, int> {
  static const satisfyTemplate = '''
{
  final pos = state.pos;
  final source = state.source;
  if (pos >= source.length) {
    final error = ErrorUnexpectedEof(pos);
    return state.fail(error);
  }
  final c = source.readRune(state);
  final ok = {{f}}(c);
  if (ok) {
    return Result(c);
  }
  state.pos = pos;
  final error = ErrorUnexpectedChar(pos, source);
  return state.fail(error);
}''';

  final Func<bool> f;

  const Satisfy(this.f);

  @override
  String get template => satisfyTemplate;

  @override
  Map<String, Object?> get values => {
        'f': f,
      };
}
