void main() {
  final r = parse('{"rocket": "🚀 flies to the stars"}');
  print(r);
}

Object? parse(String source) {
  final state = State(source);
  final result = json(state);
  if (result == null) {
    final message = _errorMessage(source, state.failPos, state.errors);
    throw message;
  }
  return result.value;
}

bool _$g0(int a) => a == 9 || a == 10 || a == 13 || a == 32;

Result<Object?>? _ws(State<String> state) {
  final source = state.source;
  while (state.pos < source.length) {
    final c = source.codeUnitAt(state.pos);
    final v = _$g0(c);
    if (!v) {
      break;
    }
    state.pos++;
  }
  return const Result(null);
}

Result<String>? _$g1(State<String> state) {
  const tag = '"';
  if (state.pos >= state.source.length ||
      state.source.codeUnitAt(state.pos) != 34) {
    return state.fail(state.pos, const ErrorExpectedTags([tag]));
  }
  state.pos++;
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
    return state.fail(start, const ErrorUnexpectedEof());
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
    return state.fail(start, const ErrorUnexpectedChar());
  }
  return Result(source.substring(start, state.pos));
}

Result<String>? _$g6(State<String> state) {
  const tag = '\\';
  if (state.pos >= state.source.length ||
      state.source.codeUnitAt(state.pos) != 92) {
    return state.fail(state.pos, const ErrorExpectedTags([tag]));
  }
  state.pos++;
  return const Result(tag);
}

Result<String>? _escapeChar(State<String> state) {
  final pos = state.pos;
  final source = state.source;
  if (pos < source.length) {
    final c = source.codeUnitAt(pos);
    if (c == 34) {
      state.pos += 1;
      return const Result('"');
    } else if (c == 47) {
      state.pos += 1;
      return const Result('/');
    } else if (c == 92) {
      state.pos += 1;
      return const Result('\\');
    } else if (c == 98) {
      state.pos += 1;
      return const Result('\b');
    } else if (c == 102) {
      state.pos += 1;
      return const Result('\f');
    } else if (c == 110) {
      state.pos += 1;
      return const Result('\n');
    } else if (c == 114) {
      state.pos += 1;
      return const Result('\r');
    } else if (c == 116) {
      state.pos += 1;
      return const Result('\t');
    }
  }
  return state.fail(pos, const ErrorUnexpectedChar());
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
    return state.fail(state.pos, const ErrorExpectedTags([tag]));
  }
  state.pos += 2;
  return const Result(tag);
}

Object? _$g8(int start, int end) {
  return ErrorMessage(end - start, 'Expected 4 digit hexadecimal number');
}

String _$g9(String a) => String.fromCharCode(_toHexValue(a));

bool _$g11(int a) =>
    (a >= 48 && a <= 57) || (a >= 65 && a <= 70) || (a >= 97 && a <= 102);

Result<String>? _$g10(State<String> state) {
  final source = state.source;
  final start = state.pos;
  var count = 0;
  while (count < 4 && state.pos < source.length) {
    final c = source.codeUnitAt(state.pos);
    final ok = _$g11(c);
    if (!ok) {
      break;
    }
    state.pos++;
    count++;
  }
  if (count >= 4) {
    final v = source.substring(start, state.pos);
    return Result(v);
  }
  final end = state.pos;
  state.pos = start;
  if (end < source.length) {
    return state.fail(end, const ErrorUnexpectedChar());
  }
  return state.fail(end, const ErrorUnexpectedEof());
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
  final pos = state.pos;
  final failPos = state.failPos;
  final errors = state.errors;
  state.errors = [];
  state.failPos = -1;
  final r1 = _hexValue(state);
  var failPos2 = state.failPos;
  if (failPos2 < failPos) {
    state.failPos = failPos;
    state.errors = errors;
  } else if (failPos2 == failPos) {
    state.errors.addAll(errors);
  }

  if (r1 != null) {
    return r1;
  }

  if (failPos2 < pos) {
    failPos2 = pos;
  }

  final error = _$g8(pos, failPos2) as ParseError;
  return state.fail(failPos2, error);
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

Result<String>? _doubleQuote(State<String> state) {
  final pos = state.pos;
  final r1 = _$g1(state);
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

num _$g12(String a) => num.parse(a);

Result<String>? _$g15(State<String> state) {
  const tag = '-';
  if (state.pos >= state.source.length ||
      state.source.codeUnitAt(state.pos) != 45) {
    return state.fail(state.pos, const ErrorExpectedTags([tag]));
  }
  state.pos++;
  return const Result(tag);
}

Result<String?>? _minus(State<String> state) {
  final r1 = _$g15(state);
  if (r1 == null) {
    return const Result(null);
  }
  return Result(r1.value);
}

Result<String>? _$g16(State<String> state) {
  const tag = '0';
  if (state.pos >= state.source.length ||
      state.source.codeUnitAt(state.pos) != 48) {
    return state.fail(state.pos, const ErrorExpectedTags([tag]));
  }
  state.pos++;
  return const Result(tag);
}

bool _$g19(int a) => a >= 49 && a <= 57;

Result<int>? _$g18(State<String> state) {
  final pos = state.pos;
  if (pos >= state.source.length) {
    return state.fail(pos, const ErrorUnexpectedEof());
  }
  final c = state.source.readRune(state);
  final ok = _$g19(c);
  if (ok) {
    return Result(c);
  }
  state.pos = pos;
  return state.fail(pos, const ErrorUnexpectedChar());
}

bool _$g20(int a) => a >= 48 && a <= 57;

Result<Object?>? _digit0(State<String> state) {
  final source = state.source;
  while (state.pos < source.length) {
    final c = source.codeUnitAt(state.pos);
    final v = _$g20(c);
    if (!v) {
      break;
    }
    state.pos++;
  }
  return const Result(null);
}

Result<Object?>? _$g17(State<String> state) {
  final pos = state.pos;
  final r1 = _$g18(state);
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
  final r1 = _$g16(state);
  if (r1 != null) {
    return r1;
  }
  final r2 = _$g17(state);
  if (r2 != null) {
    return r2;
  }
  return null;
}

Result<String>? _$g22(State<String> state) {
  const tag = '.';
  if (state.pos >= state.source.length ||
      state.source.codeUnitAt(state.pos) != 46) {
    return state.fail(state.pos, const ErrorExpectedTags([tag]));
  }
  state.pos++;
  return const Result(tag);
}

Result<Object?>? _digit1(State<String> state) {
  final source = state.source;
  final start = state.pos;
  if (start >= source.length) {
    return state.fail(start, const ErrorUnexpectedEof());
  }
  while (state.pos < source.length) {
    final c = source.codeUnitAt(state.pos);
    final v = _$g20(c);
    if (!v) {
      break;
    }
    state.pos++;
  }
  if (state.pos == start) {
    return state.fail(start, const ErrorUnexpectedChar());
  }
  return const Result(null);
}

Result<Object?>? _$g21(State<String> state) {
  final pos = state.pos;
  final r1 = _$g22(state);
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
  final r1 = _$g21(state);
  if (r1 == null) {
    return const Result(null);
  }
  return Result(r1.value);
}

Result<String>? _$g24(State<String> state) {
  final pos = state.pos;
  final source = state.source;
  if (pos < source.length) {
    final c = source.codeUnitAt(pos);
    if (c == 101) {
      state.pos += 1;
      return const Result('e');
    } else if (c == 69) {
      state.pos += 1;
      return const Result('E');
    }
  }
  return state.fail(pos, const ErrorExpectedTags(['e', 'E']));
}

Result<String>? _$g26(State<String> state) {
  final pos = state.pos;
  final source = state.source;
  if (pos < source.length) {
    final c = source.codeUnitAt(pos);
    if (c == 43) {
      state.pos += 1;
      return const Result('+');
    } else if (c == 45) {
      state.pos += 1;
      return const Result('-');
    }
  }
  return state.fail(pos, const ErrorExpectedTags(['+', '-']));
}

Result<Object?>? _$g25(State<String> state) {
  final r1 = _$g26(state);
  if (r1 == null) {
    return const Result(null);
  }
  return Result(r1.value);
}

Result<Object?>? _$g23(State<String> state) {
  final pos = state.pos;
  final r1 = _$g24(state);
  if (r1 != null) {
    final r2 = _$g25(state);
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
  final r1 = _$g23(state);
  if (r1 == null) {
    return const Result(null);
  }
  return Result(r1.value);
}

Result<Object?>? _$g14(State<String> state) {
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

Result<String>? _$g13(State<String> state) {
  final start = state.pos;
  final r1 = _$g14(state);
  if (r1 == null) {
    return null;
  }
  if (state.pos == start) {
    return const Result('');
  }
  return Result(state.source.substring(start, state.pos));
}

Result<num>? _num(State<String> state) {
  final r1 = _$g13(state);
  if (r1 == null) {
    return null;
  }
  final v = _$g12(r1.value);
  return Result(v);
}

Result<num>? _number(State<String> state) {
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

Result<String>? _$g28(State<String> state) {
  const tag = 'true';
  if (!state.source.startsWith(tag, state.pos)) {
    return state.fail(state.pos, const ErrorExpectedTags([tag]));
  }
  state.pos += 4;
  return const Result(tag);
}

Result<Object?>? _$g27(State<String> state) {
  final pos = state.pos;
  final r1 = _$g28(state);
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
  final r1 = _$g27(state);
  if (r1 != null) {
    return Result(true);
  }
  return null;
}

Result<String>? _$g30(State<String> state) {
  const tag = 'false';
  if (!state.source.startsWith(tag, state.pos)) {
    return state.fail(state.pos, const ErrorExpectedTags([tag]));
  }
  state.pos += 5;
  return const Result(tag);
}

Result<Object?>? _$g29(State<String> state) {
  final pos = state.pos;
  final r1 = _$g30(state);
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
  final r1 = _$g29(state);
  if (r1 != null) {
    return Result(false);
  }
  return null;
}

Result<String>? _$g32(State<String> state) {
  const tag = 'null';
  if (!state.source.startsWith(tag, state.pos)) {
    return state.fail(state.pos, const ErrorExpectedTags([tag]));
  }
  state.pos += 4;
  return const Result(tag);
}

Result<Object?>? _$g31(State<String> state) {
  final pos = state.pos;
  final r1 = _$g32(state);
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
  final r1 = _$g31(state);
  if (r1 != null) {
    return Result(null);
  }
  return null;
}

Result<String>? _$g33(State<String> state) {
  const tag = '[';
  if (state.pos >= state.source.length ||
      state.source.codeUnitAt(state.pos) != 91) {
    return state.fail(state.pos, const ErrorExpectedTags([tag]));
  }
  state.pos++;
  return const Result(tag);
}

Result<String>? _openBracket(State<String> state) {
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

Result<String>? _$g34(State<String> state) {
  const tag = ',';
  if (state.pos >= state.source.length ||
      state.source.codeUnitAt(state.pos) != 44) {
    return state.fail(state.pos, const ErrorExpectedTags([tag]));
  }
  state.pos++;
  return const Result(tag);
}

Result<String>? _comma(State<String> state) {
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

Result<String>? _$g35(State<String> state) {
  const tag = ']';
  if (state.pos >= state.source.length ||
      state.source.codeUnitAt(state.pos) != 93) {
    return state.fail(state.pos, const ErrorExpectedTags([tag]));
  }
  state.pos++;
  return const Result(tag);
}

Result<String>? _closeBracket(State<String> state) {
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

Map<String, Object?> _$g36(
        (Object?, List<MapEntry<String, Object?>>, Object?) e) =>
    Map.fromEntries(e.$2);

Result<String>? _$g37(State<String> state) {
  const tag = '{';
  if (state.pos >= state.source.length ||
      state.source.codeUnitAt(state.pos) != 123) {
    return state.fail(state.pos, const ErrorExpectedTags([tag]));
  }
  state.pos++;
  return const Result(tag);
}

Result<String>? _openBrace(State<String> state) {
  final pos = state.pos;
  final r1 = _$g37(state);
  if (r1 != null) {
    final r2 = _ws(state);
    if (r2 != null) {
      return r1;
    }
    state.pos = pos;
  }
  return null;
}

MapEntry<String, Object?> _$g38((String, Object?, Object?) kv) =>
    MapEntry(kv.$1, kv.$3);

Result<String>? _$g39(State<String> state) {
  const tag = ':';
  if (state.pos >= state.source.length ||
      state.source.codeUnitAt(state.pos) != 58) {
    return state.fail(state.pos, const ErrorExpectedTags([tag]));
  }
  state.pos++;
  return const Result(tag);
}

Result<String>? _semicolon(State<String> state) {
  final pos = state.pos;
  final r1 = _$g39(state);
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
        final v = _$g38((r1.value, r2.value, r3.value));
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

Result<String>? _$g40(State<String> state) {
  const tag = '}';
  if (state.pos >= state.source.length ||
      state.source.codeUnitAt(state.pos) != 125) {
    return state.fail(state.pos, const ErrorExpectedTags([tag]));
  }
  state.pos++;
  return const Result(tag);
}

Result<String>? _closeBrace(State<String> state) {
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

Result<Map<String, Object?>>? _object(State<String> state) {
  final pos = state.pos;
  final r1 = _openBrace(state);
  if (r1 != null) {
    final r2 = _keyValues(state);
    if (r2 != null) {
      final r3 = _closeBrace(state);
      if (r3 != null) {
        final v = _$g36((r1.value, r2.value, r3.value));
        return Result(v);
      }
    }
    state.pos = pos;
  }
  return null;
}

Result<Object?>? _value(State<String> state) {
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

Result<Object?>? _$g41(State<String> state) {
  if (state.pos >= state.source.length) {
    return const Result(null);
  }
  return state.fail(state.pos, const ErrorExpectedEof());
}

Result<Object?>? json(State<String> state) {
  final pos = state.pos;
  final r1 = _ws(state);
  if (r1 != null) {
    final r2 = _value(state);
    if (r2 != null) {
      final r3 = _$g41(state);
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

String _errorMessage(String source, int offset, List<ParseError> errors) {
  final sb = StringBuffer();
  final errorList = errors.toList();
  final expectedTags = errorList.whereType<ErrorExpectedTags>().toList();
  if (expectedTags.isNotEmpty) {
    errorList.removeWhere((e) => e is ErrorExpectedTags);
    final tags = <String>[];
    for (final error in expectedTags) {
      tags.addAll(error.tags);
    }
    final error = ErrorExpectedTags(tags);
    errorList.add(error);
  }

  final errorInfoList = errorList
      .map((e) => (
            message: e.getMessage(offset: offset, source: source),
            start: offset - e.length,
          ))
      .toSet()
      .toList();
  for (var i = 0; i < errorInfoList.length; i++) {
    if (sb.isNotEmpty) {
      sb.writeln();
      sb.writeln();
    }
    final errorInfo = errorInfoList[i];
    final message = errorInfo.message;
    final end = offset;
    final start = errorInfo.start;
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
    sb.writeln('line $row, column $column: $message');
    sb.writeln(text);
    sb.write(' ' * leftLen + '^' * indicatorLen);
  }
  return sb.toString();
}

class ErrorExpectedChar extends ParseError {
  final int char;

  const ErrorExpectedChar(this.char);

  @override
  String getMessage({
    required int offset,
    required Object source,
  }) {
    if (source is String) {
      final value = escape(char);
      return 'Expected character $value';
    } else {
      return 'Expected character';
    }
  }
}

class ErrorExpectedEof extends ParseError {
  const ErrorExpectedEof();

  @override
  String getMessage({
    required int offset,
    required Object source,
  }) {
    return 'Expected end of file';
  }
}

class ErrorExpectedTags extends ParseError {
  final List<String> tags;

  const ErrorExpectedTags(this.tags);

  @override
  String getMessage({
    required int offset,
    required Object source,
  }) {
    final value = tags.map(escape).join(', ');
    return 'Expected $value';
  }
}

class ErrorMessage extends ParseError {
  @override
  final int length;

  final String message;

  const ErrorMessage(this.length, this.message);

  @override
  String getMessage({
    required int offset,
    required Object source,
  }) {
    return message;
  }
}

class ErrorUnexpectedChar extends ParseError {
  const ErrorUnexpectedChar();

  @override
  String getMessage({
    required int offset,
    required Object source,
  }) {
    if (source is String) {
      final char = source.runeAt(offset);
      final value = escape(char);
      return 'Unexpected character $value';
    } else {
      return 'Unexpected character';
    }
  }
}

class ErrorUnexpectedEof extends ParseError {
  const ErrorUnexpectedEof();

  @override
  String getMessage({
    required int offset,
    required Object source,
  }) {
    return 'Unexpected end of file';
  }
}

class ErrorUnexpectedInput extends ParseError {
  final int start;

  const ErrorUnexpectedInput(this.start);

  @override
  String getMessage({
    required int offset,
    required Object source,
  }) {
    return 'Unexpected input';
  }
}

abstract class ParseError {
  const ParseError();

  int get length => 0;

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

  String getMessage({
    required int offset,
    required Object source,
  });
}

class Result<T> {
  final T value;

  const Result(this.value);

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(other) => other is Result<T> && value == other.value;

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

  @pragma('vm:prefer-inline')
  Result<R>? fail<R>(int offset, ParseError error) {
    if (offset < failPos) {
      return null;
    } else if (failPos < offset) {
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
