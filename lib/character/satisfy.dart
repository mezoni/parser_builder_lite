import '../parser_builder.dart';

class Satisfy extends _Satisfy {
  static const satisfyTemplate = '''
final pos = state.pos;
if (pos >= state.source.length) {
  return state.fail(const ErrorUnexpectedEof());
}
final c = state.source.readRune(state);
final ok = {{f}}(c);
if (ok) {
  return Result(c);
}
state.pos = pos;
return state.fail(const ErrorUnexpectedChar());''';

  const Satisfy(super.f);

  @override
  String getTemplate(BuildContext context) => satisfyTemplate;
}

class Satisfy16 extends _Satisfy {
  static const satisfy16Template = '''
if (state.pos >= state.source.length) {
  return state.fail(const ErrorUnexpectedEof());
}
final c = state.source.codeUnitAt(state.pos);
final ok = {{f}}(c);
if (ok) {
  state.pos++;
  return Result(c);
}
return state.fail(const ErrorUnexpectedChar());''';

  const Satisfy16(super.f);

  @override
  String getTemplate(BuildContext context) => satisfy16Template;
}

abstract class _Satisfy extends ParserBuilder<String, int> {
  final FunctionBuilder<bool> f;

  const _Satisfy(this.f);

  @override
  Map<String, String> getValues(BuildContext context) => {
        'f': f.build(context).name,
      };
}
