import '../helper.dart' as helper;
import '../parser_builder.dart';

class Take16While0 extends ParserBuilder<String, String> {
  static const take16While0Template = '''
final source = state.source;
final start = state.pos;
while (state.pos < source.length) {
  final c = source.codeUnitAt(state.pos);
  final v = {{f}}(c);
  if (!v) {
    break;
  }
  state.pos++;
}
if (state.pos == start) {
  return const Result('');
}
return Result(source.substring(start, state.pos));''';

  final FunctionBuilder<bool> f;

  const Take16While0(this.f);

  @override
  String getTemplate(BuildContext context) => take16While0Template;

  @override
  Map<String, String> getValues(BuildContext context) => {
        'f': f.build(context).name,
      };
}

class Take16While1 extends ParserBuilder<String, String> {
  static const take16While1Template = '''
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
return Result(source.substring(start, state.pos));''';

  final FunctionBuilder<bool> f;

  const Take16While1(this.f);

  @override
  String getTemplate(BuildContext context) => take16While1Template;

  @override
  Map<String, String> getValues(BuildContext context) => {
        'f': f.build(context).name,
      };
}

class Take16WhileMN extends ParserBuilder<String, String> {
  static const take16WhileMNTemplate = '''
final source = state.source;
final start = state.pos;
var count = 0;
while (count < {{n}} && state.pos < source.length) {
  final c = source.codeUnitAt(state.pos);
  final ok = {{f}}(c);
  if (!ok) {
    break;
  }
  state.pos++;
  count++;
}
if (count >= {{m}}) {
  final v = source.substring(start, state.pos);
  return Result(v);
}
final end = state.pos;
state.pos = start;
if (end < source.length) {
  return state.failAt(end, const ErrorUnexpectedChar());
}
return state.failAt(end, const ErrorUnexpectedEof());''';

  final FunctionBuilder<bool> f;

  final int m;

  final int n;

  const Take16WhileMN(this.m, this.n, this.f);

  @override
  String getTemplate(BuildContext context) => take16WhileMNTemplate;

  @override
  Map<String, String> getValues(BuildContext context) => {
        'f': f.build(context).name,
        'm': helper.getAsCode(m),
        'n': helper.getAsCode(n),
      };
}

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

  final FunctionBuilder<bool> f;

  const TakeWhile0(this.f);

  @override
  String getTemplate(BuildContext context) => takeWhile0Template;

  @override
  Map<String, String> getValues(BuildContext context) => {
        'f': f.build(context).name,
      };
}

class TakeWhile1 extends ParserBuilder<String, String> {
  static const takeWhile1Template = '''
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
return Result(source.substring(start, state.pos));''';

  final FunctionBuilder<bool> f;

  const TakeWhile1(this.f);

  @override
  String getTemplate(BuildContext context) => takeWhile1Template;

  @override
  Map<String, String> getValues(BuildContext context) => {
        'f': f.build(context).name,
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
final end = state.pos;
state.pos = start;
if (end < source.length) {
  return state.failAt(end, const ErrorUnexpectedChar());
}
return state.failAt(end, const ErrorUnexpectedEof());''';

  final FunctionBuilder<bool> f;

  final int m;

  final int n;

  const TakeWhileMN(this.m, this.n, this.f);

  @override
  String getTemplate(BuildContext context) => takeWhileMNTemplate;

  @override
  Map<String, String> getValues(BuildContext context) => {
        'f': f.build(context).name,
        'm': helper.getAsCode(m),
        'n': helper.getAsCode(n),
      };
}
