void main() {
  final r = parse('{"rocket": "🚀 flies to the stars"}');
  print(r);
}

Object? parse(String input) {
  final state = State(input);
  final result = json(state);
  if (result == null) {
    final message = _errorMessage(input, state.failPos, state.errors);
    throw message;
  }
  return result.value;
}

Result<Object?>? _ws(State<String> state) {
  final input = state.input;
  while (state.pos < input.length) {
    final c = input.codeUnitAt(state.pos);
    final v = c == 9 || c == 10 || c == 13 || c == 32;
    if (!v) {
      break;
    }
    state.pos++;
  }
  return const Result(null);
}

Result<String>? _p$1(State<String> state) {
  const tag = '{';
  if (state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 123) {
    state.pos++;
    return const Result(tag);
  }
  return state.fail(const ErrorExpectedTags([tag]));
}

Result<String>? _openBrace(State<String> state) {
  final pos = state.pos;
  final r1 = _p$1(state);
  if (r1 != null) {
    final r2 = _ws(state);
    if (r2 != null) {
      return r1;
    }
  }
  state.pos = pos;
  return null;
}

Result<String>? _p$3(State<String> state) {
  const tag = '"';
  if (state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 34) {
    state.pos++;
    return const Result(tag);
  }
  return state.fail(const ErrorExpectedTags([tag]));
}

Result<String>? _escapeChar(State<String> state) {
  final pos = state.pos;
  final input = state.input;
  if (pos < input.length) {
    final c = input.codeUnitAt(pos);
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
  return state
      .fail(const ErrorExpectedTags(['"', '/', '\\', 'b', 'f', 'n', 'r', 't']));
}

Result<String>? _p$5(State<String> state) {
  const tag = 'u';
  if (state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 117) {
    state.pos++;
    return const Result(tag);
  }
  return state.fail(const ErrorExpectedTags([tag]));
}

Result<String>? _p$6(State<String> state) {
  final input = state.input;
  final pos = state.pos;
  var count = 0;
  while (count < 4 && state.pos < input.length) {
    final c = input.codeUnitAt(state.pos);
    final ok =
        (c >= 48 && c <= 57) || (c >= 65 && c <= 70) || (c >= 97 && c <= 102);
    if (!ok) {
      break;
    }
    state.pos++;
    count++;
  }
  if (count >= 4) {
    return state.pos != pos
        ? Result(input.substring(pos, state.pos))
        : const Result('');
  }
  final end = state.pos;
  state.pos = pos;
  return end < input.length
      ? state.failAt(end, const ErrorUnexpectedChar())
      : state.failAt(end, const ErrorUnexpectedEof());
}

Result<String>? _hexValue(State<String> state) {
  final r1 = _p$6(state);
  if (r1 != null) {
    final v = String.fromCharCode(_toHexValue(r1.value));
    return Result(v);
  }
  return null;
}

Result<String>? _hexValueChecked(State<String> state) {
  final errors = state.errors.toList();
  final failPos = state.failPos;
  state.errors = [];
  state.failPos = 0;
  final r1 = _hexValue(state);
  final failPos2 = state.failPos;
  if (failPos2 < failPos) {
    state.errors = errors;
    state.failPos = failPos;
  }
  if (r1 != null) {
    if (failPos2 == failPos) {
      state.errors.addAll(errors);
    }
    return r1;
  }
  if (failPos2 < failPos) {
    return null;
  }
  final v = (
    true,
    ErrorMessage(failPos2 - state.pos, 'Expected 4 digit hexadecimal number')
  );
  if (failPos2 == failPos) {
    if (v.$1) {
      state.errors = errors;
    } else {
      state.errors.addAll(errors);
    }
  } else {
    if (v.$1) {
      state.errors = [];
    }
  }
  final error = v.$2 as ParseError?;
  if (error != null) {
    return state.failAt(state.failPos, error);
  }
  return null;
}

Result<String>? _escapeHex(State<String> state) {
  final pos = state.pos;
  final r1 = _p$5(state);
  if (r1 != null) {
    final r2 = _hexValueChecked(state);
    if (r2 != null) {
      return r2;
    }
  }
  state.pos = pos;
  return null;
}

Result<String>? _p$4(State<String> state) {
  final r1 = _escapeChar(state);
  if (r1 != null) {
    return r1;
  }
  final r2 = _escapeHex(state);
  if (r2 != null) {
    return r2;
  }

  return null;
}

Result<String>? _stringChars(State<String> state) {
  final input = state.input;
  final list = <String>[];
  var str = '';
  while (state.pos < input.length) {
    final pos = state.pos;
    var c = 0;
    while (state.pos < input.length) {
      c = input.runeAt(state.pos);
      final ok = c <= 91
          ? c <= 33
              ? c >= 32
              : c >= 35
          : c <= 1114111 && c >= 93;
      if (!ok) {
        break;
      }
      state.pos += c < 0xffff ? 1 : 2;
    }
    str = state.pos != pos ? input.substring(pos, state.pos) : '';
    if (str != '' && list.isNotEmpty) {
      list.add(str);
    }
    if (c != 92) {
      break;
    }
    state.pos += 1;
    final r1 = _p$4(state);
    if (r1 == null) {
      state.pos = pos;
      break;
    }
    if (list.isEmpty && str != '') {
      list.add(str);
    }
    list.add(r1.value);
  }
  if (list.isEmpty) {
    return Result(str);
  } else {
    return Result(list.join());
  }
}

Result<String>? _doubleQuote(State<String> state) {
  final pos = state.pos;
  final r1 = _p$3(state);
  if (r1 != null) {
    final r2 = _ws(state);
    if (r2 != null) {
      return r1;
    }
  }
  state.pos = pos;
  return null;
}

Result<String>? _string(State<String> state) {
  final pos = state.pos;
  final r1 = _p$3(state);
  if (r1 != null) {
    final r2 = _stringChars(state);
    if (r2 != null) {
      final r3 = _doubleQuote(state);
      if (r3 != null) {
        return r2;
      }
    }
  }
  state.pos = pos;
  return null;
}

Result<String>? _p$8(State<String> state) {
  const tag = ':';
  if (state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 58) {
    state.pos++;
    return const Result(tag);
  }
  return state.fail(const ErrorExpectedTags([tag]));
}

Result<String>? _semicolon(State<String> state) {
  final pos = state.pos;
  final r1 = _p$8(state);
  if (r1 != null) {
    final r2 = _ws(state);
    if (r2 != null) {
      return r1;
    }
  }
  state.pos = pos;
  return null;
}

Result<(String, String, Object?)>? _p$2(State<String> state) {
  final pos = state.pos;
  final r1 = _string(state);
  if (r1 != null) {
    final r2 = _semicolon(state);
    if (r2 != null) {
      final r3 = _value(state);
      if (r3 != null) {
        return Result((r1.value, r2.value, r3.value));
      }
    }
  }
  state.pos = pos;
  return null;
}

Result<MapEntry<String, Object?>>? _keyValue(State<String> state) {
  final r1 = _p$2(state);
  if (r1 != null) {
    final v = MapEntry(r1.value.$1, r1.value.$3);
    return Result(v);
  }
  return null;
}

Result<String>? _p$9(State<String> state) {
  const tag = ',';
  if (state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 44) {
    state.pos++;
    return const Result(tag);
  }
  return state.fail(const ErrorExpectedTags([tag]));
}

Result<String>? _comma(State<String> state) {
  final pos = state.pos;
  final r1 = _p$9(state);
  if (r1 != null) {
    final r2 = _ws(state);
    if (r2 != null) {
      return r1;
    }
  }
  state.pos = pos;
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

Result<String>? _p$10(State<String> state) {
  const tag = '}';
  if (state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 125) {
    state.pos++;
    return const Result(tag);
  }
  return state.fail(const ErrorExpectedTags([tag]));
}

Result<String>? _closeBrace(State<String> state) {
  final pos = state.pos;
  final r1 = _p$10(state);
  if (r1 != null) {
    final r2 = _ws(state);
    if (r2 != null) {
      return r1;
    }
  }
  state.pos = pos;
  return null;
}

Result<(String, List<MapEntry<String, Object?>>, String)>? _p$0(
    State<String> state) {
  final pos = state.pos;
  final r1 = _openBrace(state);
  if (r1 != null) {
    final r2 = _keyValues(state);
    if (r2 != null) {
      final r3 = _closeBrace(state);
      if (r3 != null) {
        return Result((r1.value, r2.value, r3.value));
      }
    }
  }
  state.pos = pos;
  return null;
}

Result<Map<String, Object?>>? _object(State<String> state) {
  final r1 = _p$0(state);
  if (r1 != null) {
    final v = Map.fromEntries(r1.value.$2);
    return Result(v);
  }
  return null;
}

Result<String>? _p$11(State<String> state) {
  const tag = '[';
  if (state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 91) {
    state.pos++;
    return const Result(tag);
  }
  return state.fail(const ErrorExpectedTags([tag]));
}

Result<String>? _openBracket(State<String> state) {
  final pos = state.pos;
  final r1 = _p$11(state);
  if (r1 != null) {
    final r2 = _ws(state);
    if (r2 != null) {
      return r1;
    }
  }
  state.pos = pos;
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

Result<String>? _p$13(State<String> state) {
  const tag = ']';
  if (state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 93) {
    state.pos++;
    return const Result(tag);
  }
  return state.fail(const ErrorExpectedTags([tag]));
}

Result<String>? _closeBracket(State<String> state) {
  final pos = state.pos;
  final r1 = _p$13(state);
  if (r1 != null) {
    final r2 = _ws(state);
    if (r2 != null) {
      return r1;
    }
  }
  state.pos = pos;
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
        return r2;
      }
    }
  }
  state.pos = pos;
  return null;
}

Result<String>? _p$21(State<String> state) {
  const tag = '-';
  if (state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 45) {
    state.pos++;
    return const Result(tag);
  }
  return state.fail(const ErrorExpectedTags([tag]));
}

Result<String?>? _minus(State<String> state) {
  final r1 = _p$21(state);
  if (r1 != null) {
    return r1;
  }
  return const Result<String?>(null);
}

Result<String>? _p$22(State<String> state) {
  const tag = '0';
  if (state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 48) {
    state.pos++;
    return const Result(tag);
  }
  return state.fail(const ErrorExpectedTags([tag]));
}

Result<Object?>? _p$24(State<String> state) {
  if (state.pos < state.input.length) {
    final c = state.input.codeUnitAt(state.pos);
    final ok = c >= 49 && c <= 57;
    if (ok) {
      state.pos++;
      return const Result(null);
    }
    return state.fail(const ErrorUnexpectedChar());
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<Object?>? _digit0(State<String> state) {
  final input = state.input;
  while (state.pos < input.length) {
    final c = input.codeUnitAt(state.pos);
    final v = c >= 48 && c <= 57;
    if (!v) {
      break;
    }
    state.pos++;
  }
  return const Result(null);
}

Result<Object?>? _p$23(State<String> state) {
  final pos = state.pos;
  final r1 = _p$24(state);
  if (r1 != null) {
    final r2 = _digit0(state);
    if (r2 != null) {
      return Result<Object?>(null);
    }
  }
  state.pos = pos;
  return null;
}

Result<Object?>? _integer(State<String> state) {
  final r1 = _p$22(state);
  if (r1 != null) {
    return r1;
  }
  final r2 = _p$23(state);
  if (r2 != null) {
    return r2;
  }

  return null;
}

Result<String>? _p$26(State<String> state) {
  const tag = '.';
  if (state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 46) {
    state.pos++;
    return const Result(tag);
  }
  return state.fail(const ErrorExpectedTags([tag]));
}

Result<Object?>? _digit1(State<String> state) {
  final input = state.input;
  final start = state.pos;
  while (state.pos < input.length) {
    final c = input.codeUnitAt(state.pos);
    final v = c >= 48 && c <= 57;
    if (!v) {
      break;
    }
    state.pos++;
  }
  return state.pos != start
      ? const Result(null)
      : state.pos != input.length
          ? state.fail(const ErrorUnexpectedChar())
          : state.fail(const ErrorUnexpectedEof());
}

Result<Object?>? _p$25(State<String> state) {
  final pos = state.pos;
  final r1 = _p$26(state);
  if (r1 != null) {
    final r2 = _digit1(state);
    if (r2 != null) {
      return Result<Object?>(null);
    }
  }
  state.pos = pos;
  return null;
}

Result<Object?>? _frac(State<String> state) {
  final r1 = _p$25(state);
  if (r1 != null) {
    return r1;
  }
  return const Result<Object?>(null);
}

Result<String>? _p$28(State<String> state) {
  final pos = state.pos;
  final input = state.input;
  if (pos < input.length) {
    final c = input.codeUnitAt(pos);
    if (c == 101) {
      state.pos += 1;
      return const Result('e');
    } else if (c == 69) {
      state.pos += 1;
      return const Result('E');
    }
  }
  return state.fail(const ErrorExpectedTags(['e', 'E']));
}

Result<String>? _p$30(State<String> state) {
  final pos = state.pos;
  final input = state.input;
  if (pos < input.length) {
    final c = input.codeUnitAt(pos);
    if (c == 43) {
      state.pos += 1;
      return const Result('+');
    } else if (c == 45) {
      state.pos += 1;
      return const Result('-');
    }
  }
  return state.fail(const ErrorExpectedTags(['+', '-']));
}

Result<Object?>? _p$29(State<String> state) {
  final r1 = _p$30(state);
  if (r1 != null) {
    return r1;
  }
  return const Result<Object?>(null);
}

Result<Object?>? _p$27(State<String> state) {
  final pos = state.pos;
  final r1 = _p$28(state);
  if (r1 != null) {
    final r2 = _p$29(state);
    if (r2 != null) {
      final r3 = _digit1(state);
      if (r3 != null) {
        return Result<Object?>(null);
      }
    }
  }
  state.pos = pos;
  return null;
}

Result<Object?>? _exp(State<String> state) {
  final r1 = _p$27(state);
  if (r1 != null) {
    return r1;
  }
  return const Result<Object?>(null);
}

Result<Object?>? _p$20(State<String> state) {
  final pos = state.pos;
  final r1 = _minus(state);
  if (r1 != null) {
    final r2 = _integer(state);
    if (r2 != null) {
      final r3 = _frac(state);
      if (r3 != null) {
        final r4 = _exp(state);
        if (r4 != null) {
          return Result<Object?>(null);
        }
      }
    }
  }
  state.pos = pos;
  return null;
}

Result<String>? _p$19(State<String> state) {
  final pos = state.pos;
  final r1 = _p$20(state);
  if (r1 != null) {
    return state.pos != pos
        ? Result(state.input.substring(pos, state.pos))
        : const Result('');
  }
  return null;
}

Result<num>? _num(State<String> state) {
  final r1 = _p$19(state);
  if (r1 != null) {
    final v = num.parse(r1.value);
    return Result(v);
  }
  return null;
}

Result<num>? _number(State<String> state) {
  final pos = state.pos;
  final r1 = _num(state);
  if (r1 != null) {
    final r2 = _ws(state);
    if (r2 != null) {
      return r1;
    }
  }
  state.pos = pos;
  return null;
}

Result<String>? _p$32(State<String> state) {
  const tag = 'true';
  if (state.input.startsWith(tag, state.pos)) {
    state.pos += 4;
    return const Result(tag);
  }
  return state.fail(const ErrorExpectedTags([tag]));
}

Result<Object?>? _p$31(State<String> state) {
  final pos = state.pos;
  final r1 = _p$32(state);
  if (r1 != null) {
    final r2 = _ws(state);
    if (r2 != null) {
      return r1;
    }
  }
  state.pos = pos;
  return null;
}

Result<bool>? _true(State<String> state) {
  final r1 = _p$31(state);
  if (r1 != null) {
    return Result(true);
  }
  return null;
}

Result<String>? _p$34(State<String> state) {
  const tag = 'false';
  if (state.input.startsWith(tag, state.pos)) {
    state.pos += 5;
    return const Result(tag);
  }
  return state.fail(const ErrorExpectedTags([tag]));
}

Result<Object?>? _p$33(State<String> state) {
  final pos = state.pos;
  final r1 = _p$34(state);
  if (r1 != null) {
    final r2 = _ws(state);
    if (r2 != null) {
      return r1;
    }
  }
  state.pos = pos;
  return null;
}

Result<bool>? _false(State<String> state) {
  final r1 = _p$33(state);
  if (r1 != null) {
    return Result(false);
  }
  return null;
}

Result<String>? _p$36(State<String> state) {
  const tag = 'null';
  if (state.input.startsWith(tag, state.pos)) {
    state.pos += 4;
    return const Result(tag);
  }
  return state.fail(const ErrorExpectedTags([tag]));
}

Result<Object?>? _p$35(State<String> state) {
  final pos = state.pos;
  final r1 = _p$36(state);
  if (r1 != null) {
    final r2 = _ws(state);
    if (r2 != null) {
      return r1;
    }
  }
  state.pos = pos;
  return null;
}

Result<Object?>? _null(State<String> state) {
  final r1 = _p$35(state);
  if (r1 != null) {
    return Result(null);
  }
  return null;
}

Result<Object?>? _value(State<String> state) {
  final r1 = _object(state);
  if (r1 != null) {
    return r1;
  }
  final r2 = _array(state);
  if (r2 != null) {
    return r2;
  }
  final r3 = _string(state);
  if (r3 != null) {
    return r3;
  }
  final r4 = _number(state);
  if (r4 != null) {
    return r4;
  }
  final r5 = _true(state);
  if (r5 != null) {
    return r5;
  }
  final r6 = _false(state);
  if (r6 != null) {
    return r6;
  }
  final r7 = _null(state);
  if (r7 != null) {
    return r7;
  }

  return null;
}

Result<Object?>? _p$37(State<String> state) {
  if (state.pos >= state.input.length) {
    return const Result(null);
  }
  return state.fail(const ErrorExpectedEof());
}

Result<Object?>? json(State<String> state) {
  final pos = state.pos;
  final r1 = _ws(state);
  if (r1 != null) {
    final r2 = _value(state);
    if (r2 != null) {
      final r3 = _p$37(state);
      if (r3 != null) {
        return r2;
      }
    }
  }
  state.pos = pos;
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

String _errorMessage(String input, int offset, List<ParseError> errors) {
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
            message: e.getMessage(offset: offset, input: input),
            start: offset - e.length,
          ))
      .toSet()
      .toList();
  for (var i = 0; i < errorInfoList.length; i++) {
    int max(int x, int y) => x > y ? x : y;
    int min(int x, int y) => x < y ? x : y;
    if (sb.isNotEmpty) {
      sb.writeln();
      sb.writeln();
    }
    final errorInfo = errorInfoList[i];
    final message = errorInfo.message;
    final start = min(errorInfo.start, offset);
    final end = max(errorInfo.start, offset);
    var row = 1;
    var lineStart = 0, next = 0, pos = 0;
    while (pos < input.length) {
      final c = input.codeUnitAt(pos++);
      if (c == 0xa || c == 0xd) {
        next = c == 0xa ? 0xd : 0xa;
        if (pos < input.length && input.codeUnitAt(pos) == next) {
          pos++;
        }
        if (pos - 1 >= start) {
          break;
        }
        row++;
        lineStart = pos;
      }
    }
    final inputLen = input.length;
    final lineLimit = min(80, inputLen);
    final start2 = start;
    final end2 = min(start2 + lineLimit, end);
    final errorLen = end2 - start;
    final extraLen = lineLimit - errorLen;
    final rightLen = min(inputLen - end2, extraLen - (extraLen >> 1));
    final leftLen = min(start, max(0, lineLimit - errorLen - rightLen));
    final list = <int>[];
    final iterator = RuneIterator.at(input, start2);
    for (var i = 0; i < leftLen; i++) {
      if (!iterator.movePrevious()) {
        break;
      }
      list.add(iterator.current);
    }
    final column = start - lineStart + 1;
    final left = String.fromCharCodes(list.reversed);
    final end3 = min(inputLen, start2 + (lineLimit - leftLen));
    final indicatorLen = max(1, errorLen);
    final right = input.substring(start2, end3);
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
    required Object input,
    required int offset,
  }) {
    if (input is String) {
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
    required Object input,
    required int offset,
  }) {
    return 'Expected end of file';
  }
}

class ErrorExpectedInt extends ParseError {
  final int size;

  final int value;

  const ErrorExpectedInt(this.size, this.value);

  @override
  String getMessage({
    required Object input,
    required int offset,
  }) {
    var string = value.toRadixString(16);
    if (const [8, 16, 24, 32, 40, 48, 56, 64].contains(size)) {
      string = string.padLeft(size >> 2, '0');
    }
    if (value >= 0 && value <= 0x10ffff) {
      string = '$string (${escape(value)})';
    }
    return 'Expected 0x$string';
  }
}

class ErrorExpectedTags extends ParseError {
  final List<String> tags;

  const ErrorExpectedTags(this.tags);

  @override
  String getMessage({
    required Object input,
    required int offset,
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
    required Object input,
    required int offset,
  }) {
    return message;
  }
}

class ErrorUnexpectedChar extends ParseError {
  const ErrorUnexpectedChar();

  @override
  String getMessage({
    required Object input,
    required int offset,
  }) {
    if (input is String) {
      final char = input.runeAt(offset);
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
    required Object input,
    required int offset,
  }) {
    return 'Unexpected end of file';
  }
}

class ErrorUnexpectedInput extends ParseError {
  @override
  final int length;

  const ErrorUnexpectedInput(this.length);

  @override
  String getMessage({
    required Object input,
    required int offset,
  }) {
    return 'Unexpected input';
  }
}

class ErrorUnknown extends ParseError {
  const ErrorUnknown();

  @override
  String getMessage({
    required Object input,
    required int offset,
  }) {
    return 'Unknown error';
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
    required Object input,
    required int offset,
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

  int failPos = 0;

  final T input;

  int pos = 0;

  State(this.input);

  @pragma('vm:prefer-inline')
  Result<R>? fail<R>(ParseError error) {
    if (pos < failPos) {
      return null;
    } else if (failPos < pos) {
      failPos = pos;
      errors = [];
    }
    errors.add(error);
    return null;
  }

  @pragma('vm:prefer-inline')
  Result<R>? failAt<R>(int offset, ParseError error) {
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
    if (input is String) {
      final s = input as String;
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
