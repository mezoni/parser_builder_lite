import '../parser_builder.dart';

class SkipWhile0 extends ParserBuilder<String, Object?> {
  final Func<bool> f;

  const SkipWhile0(this.f);

  @override
  String get template => '''
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

  @override
  Map<String, Object?> get values => {
        'f': f,
      };
}

class Skip16While0 extends ParserBuilder<String, Object?> {
  final Func<bool> f;

  const Skip16While0(this.f);

  @override
  String get template => '''
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
final source = state.source;
final start = state.pos;
if (start >= source.length) {
  return state.fail(start, const ErrorUnexpectedEof());
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
  return state.fail(start, const ErrorUnexpectedChar());
}
return const Result(null);''';

  @override
  Map<String, Object?> get values => {
        'f': f,
      };
}

class Skip16While1 extends ParserBuilder<String, Object?> {
  final Func<bool> f;

  const Skip16While1(this.f);

  @override
  String get template => '''
final source = state.source;
final start = state.pos;
if (start >= source.length) {
  return state.fail(start, const ErrorUnexpectedEof());
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
  return state.fail(start, const ErrorUnexpectedChar());
}
return const Result(null);''';

  @override
  Map<String, Object?> get values => {
        'f': f,
      };
}
