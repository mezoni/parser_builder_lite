import '../parser_builder.dart';

class Satisfy extends ParserBuilder<String, int> {
  // TODO: Add 16 bit version
  static const satisfyTemplate = '''
final pos = state.pos;
final source = state.source;
if (pos >= source.length) {
  return state.fail(pos, const ErrorUnexpectedEof());
}
final c = source.readRune(state);
final ok = {{f}}(c);
if (ok) {
  return Result(c);
}
state.pos = pos;
return state.fail(pos, const ErrorUnexpectedChar());''';

  final FunctionBuilder<bool> f;

  const Satisfy(this.f);

  @override
  String getTemplate(BuildContext context) => satisfyTemplate;

  @override
  Map<String, Object?> getValues(BuildContext context) => {
        'f': f,
      };
}
