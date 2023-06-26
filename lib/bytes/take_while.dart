import '../parser_builder.dart';

class TakeWhile0 extends ParserBuilder<String, String> {
  static const takeWhile0Template = '''
final source = state.source;
final start = state.pos;
while (state.pos < source.length) {
  final pos = state.pos;
  final c = source.readRune(state);
  final v = {{f}}(c);
  if (!v) {
    state.pos = pos;
    break;
  }
}
if (state.pos == start) {
  return const Result('');
}
return Result(source.substring(start, state.pos));''';

  final Func<bool> f;

  const TakeWhile0(this.f);

  @override
  String get template => takeWhile0Template;

  @override
  Map<String, Object?> get values => {
        'f': f,
      };
}

class TakeWhile1 extends ParserBuilder<String, String> {
  static const takeWhile1Template = '''
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
return Result(source.substring(start, state.pos));''';

  final Func<bool> f;

  const TakeWhile1(this.f);

  @override
  String get template => takeWhile1Template;

  @override
  Map<String, Object?> get values => {
        'f': f,
      };
}

class TakeWhileMN extends ParserBuilder<String, String> {
  static const takeWhileMNTemplate = '''
final source = state.source;
final start = state.pos;
var count = 0;
while (count < {{n}} && state.pos < source.length) {
  final pos = state.pos;
  final c = source.readRune(state);
  final ok = {{f}}(c);
  if (!ok) {
    state.pos = pos;
    break;
  }
  count++;
}
if (count >= {{m}}) {
  final v = source.substring(start, state.pos);
  return Result(v);
}
final ParseError error;
final end = state.pos;
if (state.pos < source.length) {
  error = const ErrorUnexpectedChar();
} else {
  error = const ErrorUnexpectedEof();
}
state.pos = start;
return state.fail(end, error);''';

  final Func<bool> f;

  final int m;

  final int n;

  const TakeWhileMN(this.m, this.n, this.f);

  @override
  String get template => takeWhileMNTemplate;

  @override
  Map<String, Object?> get values => {
        'f': f,
        'm': m,
        'n': n,
      };
}
