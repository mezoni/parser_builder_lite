import '../parser_builder.dart';

class Skip16While0 extends _SkipWhile {
  const Skip16While0(super.f);

  @override
  String getTemplate(BuildContext context) => '''
final source = state.source;
while (state.pos < source.length) {
  final c = source.codeUnitAt(state.pos);
  final v = {{f}}(c);
  if (!v) {
    break;
  }
  state.pos++;
}
return const Result(null);''';
}

class Skip16While1 extends _SkipWhile {
  const Skip16While1(super.f);

  @override
  String getTemplate(BuildContext context) => '''
final source = state.source;
final start = state.pos;
if (start >= source.length) {
  return state.fail(const ErrorUnexpectedEof());
}
while (state.pos < source.length) {
  final c = source.codeUnitAt(state.pos);
  final v = {{f}}(c);
  if (!v) {
    break;
  }
  state.pos++;
}
if (state.pos == start) {
  return state.fail(const ErrorUnexpectedChar());
}
return const Result(null);''';
}

class SkipWhile0 extends _SkipWhile {
  const SkipWhile0(super.f);

  @override
  String getTemplate(BuildContext context) => '''
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
return const Result(null);''';
}

class SkipWhile1 extends _SkipWhile {
  const SkipWhile1(super.f);

  @override
  String getTemplate(BuildContext context) => '''
final source = state.source;
final start = state.pos;
if (start >= source.length) {
  return state.fail(const ErrorUnexpectedEof());
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
  return state.fail(const ErrorUnexpectedChar());
}
return const Result(null);''';
}

abstract class _SkipWhile extends ParserBuilder<String, Object?> {
  final FunctionBuilder<bool> f;

  const _SkipWhile(this.f);

  @override
  Map<String, String> getValues(BuildContext context) => {
        'f': f.build(context).name,
      };
}
