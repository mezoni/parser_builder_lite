void main() {
  final r = parse('{"rocket": "🚀 flies to the stars"}');
  print(r);
}

Object? parse(String source) {
  final state = State(source);
  final result = json(state);
  if (result == null) {
    final message = _errorMessage(source, state.errors);
    throw message;
  }
  return result.value;
}

bool _$g0(int a) => a == 9 || a == 10 || a == 13 || a == 32;

Result<Object?>? _ws(State<String> state) {
  final source = state.source;
  while (state.pos < source.length) {
    final pos = state.pos;
    final c = source.readRune(state);
    final v = _$g0(c);
    if (!v) {
      state.pos = pos;
      break;
    }
  }
  return const Result(null);
}

Result<String>? _$g1(State<String> state) {
  const tag = '"';
  if (!state.source.startsWith(tag, state.pos)) {
    final error = ErrorExpectedTags(state.pos, const [tag]);
    return state.fail(error);
  }
  state.pos += 1;
  return const Result(tag);
}

String _$g3(List<String> a) => a.join();

bool _$g5(int a) => a <= 91
    ? a <= 33
        ? a >= 32
        : a >= 35
    : a <= 1114111 && a >= 93;

Result<String>? _normalChars(State<String> state) {
  final source = state.source;
  final start = state.pos;
  if (start >= source.length) {
    final error = ErrorUnexpectedEof(start);
    return state.fail(error);
  }
  while (state.pos < source.length) {
    final pos = state.pos;
    final c = source.readRune(state);
    final ok = _$g5(c);
    if (!ok) {
      state.pos = pos;
      break;
    }
  }
  if (state.pos == start) {
    final error = ErrorUnexpectedChar(start, source);
    return state.fail(error);
  }
  return Result(source.substring(start, state.pos));
}

Result<String>? _$g6(State<String> state) {
  const tag = '\\';
  if (!state.source.startsWith(tag, state.pos)) {
    final error = ErrorExpectedTags(state.pos, const [tag]);
    return state.fail(error);
  }
  state.pos += 1;
  return const Result(tag);
}

Result<String>? _escapeChar(State<String> state) {
  final source = state.source;
  final pos = state.pos;
  if (pos >= source.length) {
    final error = ErrorUnexpectedEof(pos);
    return state.fail(error);
  }
  final c = source.readRune(state);
  switch (c) {
    case 34:
      return const Result('"');
    case 47:
      return const Result('/');
    case 92:
      return const Result('\\');
    case 98:
      return const Result('\b');
    case 102:
      return const Result('\f');
    case 110:
      return const Result('\n');
    case 114:
      return const Result('\r');
    case 116:
      return const Result('\t');
  }
  state.pos = pos;
  final error = ErrorUnexpectedChar(pos, source);
  return state.fail(error);
}

Result<String>? _escape(State<String> state) {
  final pos = state.pos;
  final r1 = _$g6(state);
  if (r1 != null) {
    final r2 = _escapeChar(state);
    if (r2 != null) {
      return r2;
    }
    state.pos = pos;
  }
  return null;
}

Result<String>? _$g7(State<String> state) {
  const tag = '\\u';
  if (!state.source.startsWith(tag, state.pos)) {
    final error = ErrorExpectedTags(state.pos, const [tag]);
    return state.fail(error);
  }
  state.pos += 2;
  return const Result(tag);
}

Object? _$g8(State<String> a) {
  final error = ErrorMessage(a.failPos, 'Expected 4 digit hexadecimal number');
  error.start = a.pos;
  //a.errors = [];
  return error;
}

String _$g9(String a) => String.fromCharCode(_toHexValue(a));

bool _$g11(int a) =>
    (a >= 48 && a <= 57) || (a >= 65 && a <= 70) || (a >= 97 && a <= 102);

Result<String>? _$g10(State<String> state) {
  final source = state.source;
  final start = state.pos;
  var count = 0;
  while (count < 4 && state.pos < source.length) {
    final pos = state.pos;
    final c = source.readRune(state);
    final ok = _$g11(c);
    if (!ok) {
      state.pos = pos;
      break;
    }
    count++;
  }
  if (count >= 4) {
    final v = source.substring(start, state.pos);
    return Result(v);
  }
  final ParseError error;
  if (state.pos < source.length) {
    error = ErrorUnexpectedChar(state.pos, source);
  } else {
    error = ErrorUnexpectedEof(state.pos);
  }
  state.pos = start;
  return state.fail(error);
}

Result<String>? _hexValue(State<String> state) {
  final r1 = _$g10(state);
  if (r1 == null) {
    return null;
  }
  final v = _$g9(r1.value);
  return Result(v);
}

Result<String>? _hexValueChecked(State<String> state) {
  final failPos = state.failPos;
  final errors = state.errors;
  state.errors = [];
  state.failPos = -1;
  final r1 = _hexValue(state);
  if (r1 != null) {
    return r1;
  }
  if (state.failPos >= failPos) {
    final error = _$g8(state) as ParseError;
    if (state.failPos == failPos) {
      state.errors.addAll(errors);
    }
    return state.fail(error);
  } else {
    state.failPos = failPos;
    state.errors = [];
    state.errors.addAll(errors);
  }
  return null;
}

Result<String>? _hexChar(State<String> state) {
  final pos = state.pos;
  final r1 = _$g7(state);
  if (r1 != null) {
    final r2 = _hexValueChecked(state);
    if (r2 != null) {
      return r2;
    }
    state.pos = pos;
  }
  return null;
}

Result<String>? _$g4(State<String> state) {
  final r1 = _normalChars(state);
  if (r1 != null) {
    return r1;
  }
  final r2 = _escape(state);
  if (r2 != null) {
    return r2;
  }
  final r3 = _hexChar(state);
  if (r3 != null) {
    return r3;
  }
  return null;
}

Result<List<String>>? _stringChars(State<String> state) {
  final list = <String>[];
  while (true) {
    final r1 = _$g4(state);
    if (r1 == null) {
      break;
    }
    list.add(r1.value);
  }
  return Result(list);
}

Result<String>? _$g2(State<String> state) {
  final r1 = _stringChars(state);
  if (r1 == null) {
    return null;
  }
  final v = _$g3(r1.value);
  return Result(v);
}

Result<String>? _$g12(State<String> state) {
  const tag = '"';
  if (!state.source.startsWith(tag, state.pos)) {
    final error = ErrorExpectedTags(state.pos, const [tag]);
    return state.fail(error);
  }
  state.pos += 1;
  return const Result(tag);
}

Result<String>? _doubleQuote(State<String> state) {
  final pos = state.pos;
  final r1 = _$g12(state);
  if (r1 != null) {
    final r2 = _ws(state);
    if (r2 != null) {
      return r1;
    }
    state.pos = pos;
  }
  return null;
}

Result<String>? _string(State<String> state) {
  final pos = state.pos;
  final r1 = _$g1(state);
  if (r1 != null) {
    final r2 = _$g2(state);
    if (r2 != null) {
      final r3 = _doubleQuote(state);
      if (r3 != null) {
        return Result(r2.value);
      }
    }
    state.pos = pos;
  }
  return null;
}

dynamic _$g13(String a) => num.parse(a);

Result<String>? _$g16(State<String> state) {
  const tag = '-';
  if (!state.source.startsWith(tag, state.pos)) {
    final error = ErrorExpectedTags(state.pos, const [tag]);
    return state.fail(error);
  }
  state.pos += 1;
  return const Result(tag);
}

Result<String?>? _minus(State<String> state) {
  final r1 = _$g16(state);
  if (r1 == null) {
    return const Result(null);
  }
  return Result(r1.value);
}

Result<String>? _$g17(State<String> state) {
  const tag = '0';
  if (!state.source.startsWith(tag, state.pos)) {
    final error = ErrorExpectedTags(state.pos, const [tag]);
    return state.fail(error);
  }
  state.pos += 1;
  return const Result(tag);
}

bool _$g20(int a) => a >= 49 && a <= 57;

Result<int>? _$g19(State<String> state) {
  final pos = state.pos;
  final source = state.source;
  if (pos >= source.length) {
    final error = ErrorUnexpectedEof(pos);
    return state.fail(error);
  }
  final c = source.readRune(state);
  final ok = _$g20(c);
  if (ok) {
    return Result(c);
  }
  state.pos = pos;
  final error = ErrorUnexpectedChar(pos, source);
  return state.fail(error);
}

bool _$g21(int a) => a >= 48 && a <= 57;

Result<Object?>? _digit0(State<String> state) {
  final source = state.source;
  while (state.pos < source.length) {
    final pos = state.pos;
    final c = source.readRune(state);
    final v = _$g21(c);
    if (!v) {
      state.pos = pos;
      break;
    }
  }
  return const Result(null);
}

Result<Object?>? _$g18(State<String> state) {
  final pos = state.pos;
  final r1 = _$g19(state);
  if (r1 != null) {
    final r2 = _digit0(state);
    if (r2 != null) {
      return const Result(null);
    }
    state.pos = pos;
  }
  return null;
}

Result<Object?>? _integer(State<String> state) {
  final r1 = _$g17(state);
  if (r1 != null) {
    return r1;
  }
  final r2 = _$g18(state);
  if (r2 != null) {
    return r2;
  }
  return null;
}

Result<String>? _$g23(State<String> state) {
  const tag = '.';
  if (!state.source.startsWith(tag, state.pos)) {
    final error = ErrorExpectedTags(state.pos, const [tag]);
    return state.fail(error);
  }
  state.pos += 1;
  return const Result(tag);
}

Result<Object?>? _digit1(State<String> state) {
  final source = state.source;
  final start = state.pos;
  if (start >= source.length) {
    final error = ErrorUnexpectedEof(start);
    return state.fail(error);
  }
  while (state.pos < source.length) {
    final pos = state.pos;
    final c = source.readRune(state);
    final ok = _$g21(c);
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
}

Result<Object?>? _$g22(State<String> state) {
  final pos = state.pos;
  final r1 = _$g23(state);
  if (r1 != null) {
    final r2 = _digit1(state);
    if (r2 != null) {
      return const Result(null);
    }
    state.pos = pos;
  }
  return null;
}

Result<Object?>? _frac(State<String> state) {
  final r1 = _$g22(state);
  if (r1 == null) {
    return const Result(null);
  }
  return Result(r1.value);
}

Result<String>? _$g25(State<String> state) {
  const tags = ['e', 'E'];
  final source = state.source;
  final pos = state.pos;
  for (var i = 0; i < 2; i++) {
    final tag = tags[i];
    if (source.startsWith(tag, pos)) {
      state.pos += tag.length;
      return Result(tag);
    }
  }
  final error = ErrorExpectedTags(pos, tags);
  return state.fail(error);
}

Result<String>? _$g27(State<String> state) {
  const tags = ['+', '-'];
  final source = state.source;
  final pos = state.pos;
  for (var i = 0; i < 2; i++) {
    final tag = tags[i];
    if (source.startsWith(tag, pos)) {
      state.pos += tag.length;
      return Result(tag);
    }
  }
  final error = ErrorExpectedTags(pos, tags);
  return state.fail(error);
}

Result<Object?>? _$g26(State<String> state) {
  final r1 = _$g27(state);
  if (r1 == null) {
    return const Result(null);
  }
  return Result(r1.value);
}

Result<Object?>? _$g24(State<String> state) {
  final pos = state.pos;
  final r1 = _$g25(state);
  if (r1 != null) {
    final r2 = _$g26(state);
    if (r2 != null) {
      final r3 = _digit1(state);
      if (r3 != null) {
        return const Result(null);
      }
    }
    state.pos = pos;
  }
  return null;
}

Result<Object?>? _exp(State<String> state) {
  final r1 = _$g24(state);
  if (r1 == null) {
    return const Result(null);
  }
  return Result(r1.value);
}

Result<Object?>? _$g15(State<String> state) {
  final pos = state.pos;
  final r1 = _minus(state);
  if (r1 != null) {
    final r2 = _integer(state);
    if (r2 != null) {
      final r3 = _frac(state);
      if (r3 != null) {
        final r4 = _exp(state);
        if (r4 != null) {
          return const Result(null);
        }
      }
    }
    state.pos = pos;
  }
  return null;
}

Result<String>? _$g14(State<String> state) {
  final start = state.pos;
  final r1 = _$g15(state);
  if (r1 == null) {
    return null;
  }
  if (state.pos == start) {
    return const Result('');
  }
  return Result(state.source.substring(start, state.pos));
}

Result<dynamic>? _num(State<String> state) {
  final r1 = _$g14(state);
  if (r1 == null) {
    return null;
  }
  final v = _$g13(r1.value);
  return Result(v);
}

Result<dynamic>? _number(State<String> state) {
  final pos = state.pos;
  final r1 = _num(state);
  if (r1 != null) {
    final r2 = _ws(state);
    if (r2 != null) {
      return r1;
    }
    state.pos = pos;
  }
  return null;
}

Result<String>? _$g29(State<String> state) {
  const tag = 'true';
  if (!state.source.startsWith(tag, state.pos)) {
    final error = ErrorExpectedTags(state.pos, const [tag]);
    return state.fail(error);
  }
  state.pos += 4;
  return const Result(tag);
}

Result<Object?>? _$g28(State<String> state) {
  final pos = state.pos;
  final r1 = _$g29(state);
  if (r1 != null) {
    final r2 = _ws(state);
    if (r2 != null) {
      return r1;
    }
    state.pos = pos;
  }
  return null;
}

Result<bool>? _true(State<String> state) {
  final r1 = _$g28(state);
  if (r1 != null) {
    return Result(true);
  }
  return null;
}

Result<String>? _$g31(State<String> state) {
  const tag = 'false';
  if (!state.source.startsWith(tag, state.pos)) {
    final error = ErrorExpectedTags(state.pos, const [tag]);
    return state.fail(error);
  }
  state.pos += 5;
  return const Result(tag);
}

Result<Object?>? _$g30(State<String> state) {
  final pos = state.pos;
  final r1 = _$g31(state);
  if (r1 != null) {
    final r2 = _ws(state);
    if (r2 != null) {
      return r1;
    }
    state.pos = pos;
  }
  return null;
}

Result<bool>? _false(State<String> state) {
  final r1 = _$g30(state);
  if (r1 != null) {
    return Result(false);
  }
  return null;
}

Result<String>? _$g33(State<String> state) {
  const tag = 'null';
  if (!state.source.startsWith(tag, state.pos)) {
    final error = ErrorExpectedTags(state.pos, const [tag]);
    return state.fail(error);
  }
  state.pos += 4;
  return const Result(tag);
}

Result<Object?>? _$g32(State<String> state) {
  final pos = state.pos;
  final r1 = _$g33(state);
  if (r1 != null) {
    final r2 = _ws(state);
    if (r2 != null) {
      return r1;
    }
    state.pos = pos;
  }
  return null;
}

Result<Object?>? _null(State<String> state) {
  final r1 = _$g32(state);
  if (r1 != null) {
    return Result(null);
  }
  return null;
}

Result<String>? _$g34(State<String> state) {
  const tag = '[';
  if (!state.source.startsWith(tag, state.pos)) {
    final error = ErrorExpectedTags(state.pos, const [tag]);
    return state.fail(error);
  }
  state.pos += 1;
  return const Result(tag);
}

Result<String>? _openBracket(State<String> state) {
  final pos = state.pos;
  final r1 = _$g34(state);
  if (r1 != null) {
    final r2 = _ws(state);
    if (r2 != null) {
      return r1;
    }
    state.pos = pos;
  }
  return null;
}

Result<String>? _$g35(State<String> state) {
  const tag = ',';
  if (!state.source.startsWith(tag, state.pos)) {
    final error = ErrorExpectedTags(state.pos, const [tag]);
    return state.fail(error);
  }
  state.pos += 1;
  return const Result(tag);
}

Result<String>? _comma(State<String> state) {
  final pos = state.pos;
  final r1 = _$g35(state);
  if (r1 != null) {
    final r2 = _ws(state);
    if (r2 != null) {
      return r1;
    }
    state.pos = pos;
  }
  return null;
}

Result<List<Object?>>? _values(State<String> state) {
  var pos = state.pos;
  final list = <Object?>[];
  while (true) {
    final r1 = _value(state);
    if (r1 == null) {
      state.pos = pos;
      break;
    }
    list.add(r1.value);
    pos = state.pos;
    final r2 = _comma(state);
    if (r2 == null) {
      break;
    }
  }
  return Result(list);
}

Result<String>? _$g36(State<String> state) {
  const tag = ']';
  if (!state.source.startsWith(tag, state.pos)) {
    final error = ErrorExpectedTags(state.pos, const [tag]);
    return state.fail(error);
  }
  state.pos += 1;
  return const Result(tag);
}

Result<String>? _closeBracket(State<String> state) {
  final pos = state.pos;
  final r1 = _$g36(state);
  if (r1 != null) {
    final r2 = _ws(state);
    if (r2 != null) {
      return r1;
    }
    state.pos = pos;
  }
  return null;
}

Result<List<Object?>>? _array(State<String> state) {
  final pos = state.pos;
  final r1 = _openBracket(state);
  if (r1 != null) {
    final r2 = _values(state);
    if (r2 != null) {
      final r3 = _closeBracket(state);
      if (r3 != null) {
        return Result(r2.value);
      }
    }
    state.pos = pos;
  }
  return null;
}

Map<String, Object?> _$g37(a, List<MapEntry<String, Object?>> b, c) =>
    Map.fromEntries(b);

Result<String>? _$g38(State<String> state) {
  const tag = '{';
  if (!state.source.startsWith(tag, state.pos)) {
    final error = ErrorExpectedTags(state.pos, const [tag]);
    return state.fail(error);
  }
  state.pos += 1;
  return const Result(tag);
}

Result<String>? _openBrace(State<String> state) {
  final pos = state.pos;
  final r1 = _$g38(state);
  if (r1 != null) {
    final r2 = _ws(state);
    if (r2 != null) {
      return r1;
    }
    state.pos = pos;
  }
  return null;
}

MapEntry<String, Object?> _$g39(String a, b, Object? c) =>
    MapEntry<String, Object?>(a, c);

Result<String>? _$g40(State<String> state) {
  const tag = ':';
  if (!state.source.startsWith(tag, state.pos)) {
    final error = ErrorExpectedTags(state.pos, const [tag]);
    return state.fail(error);
  }
  state.pos += 1;
  return const Result(tag);
}

Result<String>? _semicolon(State<String> state) {
  final pos = state.pos;
  final r1 = _$g40(state);
  if (r1 != null) {
    final r2 = _ws(state);
    if (r2 != null) {
      return r1;
    }
    state.pos = pos;
  }
  return null;
}

Result<MapEntry<String, Object?>>? _keyValue(State<String> state) {
  final pos = state.pos;
  final r1 = _string(state);
  if (r1 != null) {
    final r2 = _semicolon(state);
    if (r2 != null) {
      final r3 = _value(state);
      if (r3 != null) {
        final v = _$g39(r1.value, r2.value, r3.value);
        return Result(v);
      }
    }
    state.pos = pos;
  }
  return null;
}

Result<List<MapEntry<String, Object?>>>? _keyValues(State<String> state) {
  var pos = state.pos;
  final list = <MapEntry<String, Object?>>[];
  while (true) {
    final r1 = _keyValue(state);
    if (r1 == null) {
      state.pos = pos;
      break;
    }
    list.add(r1.value);
    pos = state.pos;
    final r2 = _comma(state);
    if (r2 == null) {
      break;
    }
  }
  return Result(list);
}

Result<String>? _$g41(State<String> state) {
  const tag = '}';
  if (!state.source.startsWith(tag, state.pos)) {
    final error = ErrorExpectedTags(state.pos, const [tag]);
    return state.fail(error);
  }
  state.pos += 1;
  return const Result(tag);
}

Result<String>? _closeBrace(State<String> state) {
  final pos = state.pos;
  final r1 = _$g41(state);
  if (r1 != null) {
    final r2 = _ws(state);
    if (r2 != null) {
      return r1;
    }
    state.pos = pos;
  }
  return null;
}

Result<Map<String, Object?>>? _object(State<String> state) {
  final pos = state.pos;
  final r1 = _openBrace(state);
  if (r1 != null) {
    final r2 = _keyValues(state);
    if (r2 != null) {
      final r3 = _closeBrace(state);
      if (r3 != null) {
        final v = _$g37(r1.value, r2.value, r3.value);
        return Result(v);
      }
    }
    state.pos = pos;
  }
  return null;
}

Result<dynamic>? _value(State<String> state) {
  final r1 = _string(state);
  if (r1 != null) {
    return r1;
  }
  final r2 = _number(state);
  if (r2 != null) {
    return r2;
  }
  final r3 = _true(state);
  if (r3 != null) {
    return r3;
  }
  final r4 = _false(state);
  if (r4 != null) {
    return r4;
  }
  final r5 = _null(state);
  if (r5 != null) {
    return r5;
  }
  final r6 = _array(state);
  if (r6 != null) {
    return r6;
  }
  final r7 = _object(state);
  if (r7 != null) {
    return r7;
  }
  return null;
}

Result<Object?>? _$g42(State<String> state) {
  if (state.pos >= state.source.length) {
    return const Result(null);
  }
  final error = ErrorExpectedEof(state.pos);
  return state.fail(error);
}

Result<dynamic>? json(State<String> state) {
  final pos = state.pos;
  final r1 = _ws(state);
  if (r1 != null) {
    final r2 = _value(state);
    if (r2 != null) {
      final r3 = _$g42(state);
      if (r3 != null) {
        return Result(r2.value);
      }
    }
    state.pos = pos;
  }
  return null;
}

@pragma('vm:prefer-inline')
int _toHexValue(String s) {
  var r = 0;
  for (var i = s.length - 1, j = 0; i >= 0; i--, j += 4) {
    final c = s.codeUnitAt(i);
    final int v;
    if (c >= 0x30 && c <= 0x39) {
      v = c - 0x30;
    } else if (c >= 0x41 && c <= 0x46) {
      v = c - 0x41 + 10;
    } else if (c >= 0x61 && c <= 0x66) {
      v = c - 0x61 + 10;
    } else {
      throw StateError('Internal error');
    }

    r += v * (1 << j);
  }

  return r;
}

// ignore: unused_element
String _errorMessage(String source, List<ParseError> errors) {
  final sb = StringBuffer();
  final maxOffset = errors.map((e) => e.offset).reduce((v, e) => v > e ? v : e);
  final newErrors = errors.where((e) => e.offset == maxOffset).toSet().toList();
  final mapByStart = <int, List<ParseError>>{};
  for (final error in newErrors) {
    final start = error.start ?? maxOffset;
    (mapByStart[start] ??= []).add(error);
  }

  final expectedTags = newErrors.whereType<ErrorExpectedTags>();
  if (expectedTags.isNotEmpty) {
    final map = <int, Set<String>>{};
    newErrors.removeWhere((e) => e is ErrorExpectedTags);
    for (final error in expectedTags) {
      final start = error.start ?? maxOffset;
      (map[start] ??= {}).addAll(error.tags);
    }

    for (final start in map.keys) {
      final tags = map[start]!;
      final error = ErrorExpectedTags(maxOffset, tags.toList());
      error.start = start;
      newErrors.add(error);
    }
  }

  for (var i = 0; i < newErrors.length; i++) {
    if (sb.isNotEmpty) {
      sb.writeln();
      sb.writeln();
    }

    final error = newErrors[i];
    final end = error.offset;
    final start = error.start ?? end;
    RangeError.checkValidRange(start, end, source.length);
    var row = 1;
    var lineStart = 0, next = 0, pos = 0;
    while (pos < source.length) {
      final c = source.codeUnitAt(pos++);
      if (c == 0xa || c == 0xd) {
        next = c == 0xa ? 0xd : 0xa;
        if (pos < source.length && source.codeUnitAt(pos) == next) {
          pos++;
        }

        if (pos - 1 >= start) {
          break;
        }

        row++;
        lineStart = pos;
      }
    }

    int max(int x, int y) => x > y ? x : y;
    int min(int x, int y) => x < y ? x : y;
    final sourceLen = source.length;
    final lineLimit = min(80, sourceLen);
    final start2 = start;
    final end2 = min(start2 + lineLimit, end);
    final errorLen = end2 - start;
    final extraLen = lineLimit - errorLen;
    final rightLen = min(sourceLen - end2, extraLen - (extraLen >> 1));
    final leftLen = min(start, max(0, lineLimit - errorLen - rightLen));
    final list = <int>[];
    final iterator = RuneIterator.at(source, start2);
    for (var i = 0; i < leftLen; i++) {
      if (!iterator.movePrevious()) {
        break;
      }

      list.add(iterator.current);
    }

    final column = start - lineStart + 1;
    final left = String.fromCharCodes(list.reversed);
    final end3 = min(sourceLen, start2 + (lineLimit - leftLen));
    final indicatorLen = max(1, errorLen);
    final right = source.substring(start2, end3);
    var text = left + right;
    text = text.replaceAll('\n', ' ');
    text = text.replaceAll('\r', ' ');
    text = text.replaceAll('\t', ' ');
    sb.writeln('line $row, column $column: $error');
    sb.writeln(text);
    sb.write(' ' * leftLen + '^' * indicatorLen);
  }

  return sb.toString();
}

class ErrorExpectedChar extends ParseError {
  final int char;

  ErrorExpectedChar(super.offset, this.char);

  @override
  int get hashCode => super.hashCode ^ char.hashCode;

  @override
  bool operator ==(other) {
    return other is ErrorExpectedChar && other.char == char && super == other;
  }

  @override
  String toString() {
    final value = escape(char);
    return 'Expected character $value';
  }
}

class ErrorExpectedEof extends ParseError {
  ErrorExpectedEof(super.offset);

  @override
  // ignore: hash_and_equals
  bool operator ==(other) {
    return other is ErrorExpectedEof && super == other;
  }

  @override
  String toString() {
    return 'Expected end of file';
  }
}

class ErrorExpectedTags extends ParseError {
  final List<String> tags;

  ErrorExpectedTags(super.offset, this.tags);

  @override
  int get hashCode {
    var result = super.hashCode;
    for (var i = 0; i < tags.length; i++) {
      final tag = tags[i];
      result ^= tag.hashCode;
    }

    return result;
  }

  @override
  bool operator ==(other) {
    if (other is ErrorExpectedTags) {
      final otherTags = other.tags;
      if (otherTags.length == tags.length) {
        for (var i = 0; i < tags.length; i++) {
          final tag = tags[i];
          final otherTag = otherTags[i];
          if (tag != otherTag) {
            return false;
          }
        }
      }

      return super == other;
    }

    return false;
  }

  @override
  String toString() {
    final value = tags.map(escape).join(', ');
    return 'Expected $value';
  }
}

class ErrorMessage extends ParseError {
  final String message;

  ErrorMessage(super.offset, this.message);

  @override
  int get hashCode => super.hashCode ^ message.hashCode;

  @override
  bool operator ==(other) {
    return other is ErrorMessage && other.message == message && super == other;
  }

  @override
  String toString() {
    return message;
  }
}

class ErrorUnexpectedChar extends ParseError {
  final String source;

  ErrorUnexpectedChar(super.offset, this.source);

  @override
  int get hashCode => super.hashCode ^ source.hashCode;

  @override
  bool operator ==(other) {
    return other is ErrorUnexpectedChar &&
        other.source == source &&
        super == other;
  }

  @override
  String toString() {
    final char = source.runeAt(offset);
    final value = escape(char);
    return 'Unexpected character $value';
  }
}

class ErrorUnexpectedEof extends ParseError {
  ErrorUnexpectedEof(super.offset);

  @override
  // ignore: hash_and_equals
  bool operator ==(other) {
    return other is ErrorUnexpectedEof && super == other;
  }

  @override
  String toString() {
    return 'Unexpected end of file';
  }
}

class ErrorUnexpectedInput extends ParseError {
  ErrorUnexpectedInput(super.offset);

  @override
  // ignore: hash_and_equals
  bool operator ==(other) {
    return other is ErrorUnexpectedInput && super == other;
  }

  @override
  String toString() {
    return 'Unexpected input';
  }
}

abstract class ParseError {
  int offset;

  int? start;

  ParseError(this.offset);

  @override
  int get hashCode => offset.hashCode ^ start.hashCode;

  @override
  bool operator ==(Object? other) {
    return other is ParseError &&
        other.offset == offset &&
        other.start == start;
  }

  String escape(Object? value, [bool quote = true]) {
    if (value is int) {
      if (value >= 0 && value <= 0xd7ff ||
          value >= 0xe000 && value <= 0x10ffff) {
        value = String.fromCharCode(value);
      } else {
        return value.toString();
      }
    } else if (value is! String) {
      return value.toString();
    }

    final map = {
      '\b': '\\b',
      '\f': '\\f',
      '\n': '\\n',
      '\r': '\\r',
      '\t': '\\t',
      '\v': '\\v',
    };
    var result = value.toString();
    for (final key in map.keys) {
      result = result.replaceAll(key, map[key]!);
    }

    if (quote) {
      result = "'$result'";
    }

    return result;
  }
}

class Result<T> {
  final T value;

  const Result(this.value);

  @override
  String toString() {
    return '$value';
  }
}

class State<T> {
  List<ParseError> errors = [];

  int failPos = -1;

  int pos = 0;

  final T source;

  State(this.source);

  Result<R>? fail<R>(ParseError error) {
    final offset = error.offset;
    if (offset < failPos) {
      return null;
    }

    if (failPos < offset) {
      failPos = offset;
      errors = [];
    }

    errors.add(error);
    return null;
  }

  @override
  String toString() {
    if (source is String) {
      final s = source as String;
      if (pos >= s.length) {
        return '$pos:';
      }

      var length = s.length - pos;
      length = length > 40 ? 40 : length;
      final string = s.substring(pos, pos + length);
      return '$pos:$string';
    } else {
      return super.toString();
    }
  }
}

extension on String {
  @pragma('vm:prefer-inline')
  // ignore: unused_element
  int readRune(State<String> state) {
    final w1 = codeUnitAt(state.pos++);
    if (w1 > 0xd7ff && w1 < 0xe000) {
      if (state.pos < length) {
        final w2 = codeUnitAt(state.pos++);
        if ((w2 & 0xfc00) == 0xdc00) {
          return 0x10000 + ((w1 & 0x3ff) << 10) + (w2 & 0x3ff);
        }

        state.pos--;
      }

      throw FormatException('Invalid UTF-16 character', this, state.pos - 1);
    }

    return w1;
  }

  @pragma('vm:prefer-inline')
  // ignore: unused_element
  int runeAt(int index) {
    final w1 = codeUnitAt(index++);
    if (w1 > 0xd7ff && w1 < 0xe000) {
      if (index < length) {
        final w2 = codeUnitAt(index);
        if ((w2 & 0xfc00) == 0xdc00) {
          return 0x10000 + ((w1 & 0x3ff) << 10) + (w2 & 0x3ff);
        }
      }

      throw FormatException('Invalid UTF-16 character', this, index - 1);
    }

    return w1;
  }
}
