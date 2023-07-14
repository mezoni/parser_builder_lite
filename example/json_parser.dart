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
    final v = c >= 9 && c <= 10 || c == 13 || c == 32;
    if (!v) {
      break;
    }
    state.pos++;
  }
  return const Result(null);
}

Result<String>? _p$1(State<String> state) {
  const tag = '{';
  if (state.pos < state.input.length) {
    if (state.input.codeUnitAt(state.pos) == 123) {
      state.pos++;
      return const Result(tag);
    }
    return state.fail(const ErrorExpectedTags([tag]));
  }
  return state.fail(const ErrorUnexpectedEof());
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
  if (state.pos < state.input.length) {
    if (state.input.codeUnitAt(state.pos) == 34) {
      state.pos++;
      return const Result(tag);
    }
    return state.fail(const ErrorExpectedTags([tag]));
  }
  return state.fail(const ErrorUnexpectedEof());
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
    return state.failAll([
      const ErrorExpectedTags(['"', '/', '\\', 'b', 'f', 'n', 'r', 't'])
    ]);
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<String>? _p$5(State<String> state) {
  const tag = 'u';
  if (state.pos < state.input.length) {
    if (state.input.codeUnitAt(state.pos) == 117) {
      state.pos++;
      return const Result(tag);
    }
    return state.fail(const ErrorExpectedTags([tag]));
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<String>? _p$6(State<String> state) {
  final input = state.input;
  final pos = state.pos;
  var count = 0;
  while (count < 4 && state.pos < input.length) {
    final c = input.codeUnitAt(state.pos);
    final ok = c >= 48 && c <= 57 || c >= 65 && c <= 70 || c >= 97 && c <= 102;
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
  final previous = state.failPos;
  state.errors = [];
  state.failPos = 0;
  final r1 = _hexValue(state);
  final current = state.failPos;
  if (current < previous) {
    state.errors = errors;
    state.failPos = previous;
  }
  if (r1 != null) {
    if (current == previous) {
      state.errors.addAll(errors);
    }
    return r1;
  }
  if (current < previous) {
    return null;
  }
  final (bool, List<ParseError>)? v;
  v = (
    true,
    [ErrorMessage(current - state.pos, 'Expected 4 digit hexadecimal number')]
  );
  if (current == previous) {
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
  state.errors.addAll(v.$2);
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
  int? c;
  if (state.pos < state.input.length) {
    c = state.input.codeUnitAt(state.pos);
  }
  var flag = 0x0;
  switch (c) {
    case 34: // '"'
      flag = 0x1;
      break;
    case 47: // '/'
      flag = 0x1;
      break;
    case 92: // '\\'
      flag = 0x1;
      break;
    case 98: // 'b'
      flag = 0x1;
      break;
    case 102: // 'f'
      flag = 0x1;
      break;
    case 110: // 'n'
      flag = 0x1;
      break;
    case 114: // 'r'
      flag = 0x1;
      break;
    case 116: // 't'
      flag = 0x1;
      break;
    case 117: // 'u'
      flag = 0x2;
      break;
  }
  if (flag & 0x1 != 0) {
    final r1 = _escapeChar(state);
    if (r1 != null) {
      return r1;
    }
  }
  if (flag & 0x2 != 0) {
    final r1 = _escapeHex(state);
    if (r1 != null) {
      return r1;
    }
  }
  if (state.pos >= state.input.length) {
    state.fail<String>(const ErrorUnexpectedEof());
  }
  return state.failAll([
    const ErrorExpectedTags(['"', '/', '\\', 'b', 'f', 'n', 'r', 't']),
    const ErrorExpectedTags(['u'])
  ]);
}

Result<String>? _stringChars(State<String> state) {
  final input = state.input;
  final list = <String>[];
  var str = '';
  while (state.pos < input.length) {
    final pos = state.pos;
    str = '';
    var c = -1;
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
    if (state.pos != pos) {
      str = input.substring(pos, state.pos);
      if (list.isNotEmpty) {
        list.add(str);
      }
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

Result<String>? _p$7(State<String> state) {
  const tag = ':';
  if (state.pos < state.input.length) {
    if (state.input.codeUnitAt(state.pos) == 58) {
      state.pos++;
      return const Result(tag);
    }
    return state.fail(const ErrorExpectedTags([tag]));
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<String>? _semicolon(State<String> state) {
  final pos = state.pos;
  final r1 = _p$7(state);
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

Result<String>? _p$8(State<String> state) {
  const tag = ',';
  if (state.pos < state.input.length) {
    if (state.input.codeUnitAt(state.pos) == 44) {
      state.pos++;
      return const Result(tag);
    }
    return state.fail(const ErrorExpectedTags([tag]));
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<String>? _comma(State<String> state) {
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

Result<String>? _p$9(State<String> state) {
  const tag = '}';
  if (state.pos < state.input.length) {
    if (state.input.codeUnitAt(state.pos) == 125) {
      state.pos++;
      return const Result(tag);
    }
    return state.fail(const ErrorExpectedTags([tag]));
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<String>? _closeBrace(State<String> state) {
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

Result<String>? _p$10(State<String> state) {
  const tag = '[';
  if (state.pos < state.input.length) {
    if (state.input.codeUnitAt(state.pos) == 91) {
      state.pos++;
      return const Result(tag);
    }
    return state.fail(const ErrorExpectedTags([tag]));
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<String>? _openBracket(State<String> state) {
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

Result<String>? _p$11(State<String> state) {
  const tag = ']';
  if (state.pos < state.input.length) {
    if (state.input.codeUnitAt(state.pos) == 93) {
      state.pos++;
      return const Result(tag);
    }
    return state.fail(const ErrorExpectedTags([tag]));
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<String>? _closeBracket(State<String> state) {
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

Result<String>? _p$13(State<String> state) {
  const tag = 'null';
  if (state.pos < state.input.length) {
    if (state.input.startsWith(tag, state.pos)) {
      state.pos += 4;
      return const Result(tag);
    }
    return state.fail(const ErrorExpectedTags([tag]));
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<Object?>? _p$12(State<String> state) {
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

Result<Object?>? _null(State<String> state) {
  final r1 = _p$12(state);
  if (r1 != null) {
    return Result(null);
  }
  return null;
}

Result<String>? _p$15(State<String> state) {
  const tag = 'false';
  if (state.pos < state.input.length) {
    if (state.input.startsWith(tag, state.pos)) {
      state.pos += 5;
      return const Result(tag);
    }
    return state.fail(const ErrorExpectedTags([tag]));
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<Object?>? _p$14(State<String> state) {
  final pos = state.pos;
  final r1 = _p$15(state);
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
  final r1 = _p$14(state);
  if (r1 != null) {
    return Result(false);
  }
  return null;
}

Result<String>? _p$17(State<String> state) {
  const tag = 'true';
  if (state.pos < state.input.length) {
    if (state.input.startsWith(tag, state.pos)) {
      state.pos += 4;
      return const Result(tag);
    }
    return state.fail(const ErrorExpectedTags([tag]));
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<Object?>? _p$16(State<String> state) {
  final pos = state.pos;
  final r1 = _p$17(state);
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
  final r1 = _p$16(state);
  if (r1 != null) {
    return Result(true);
  }
  return null;
}

Result<num>? _p$18(State<String> state) {
  final start = state.pos;
  final input = state.input;
  num? v;
  while (true) {
    //  '-'?('0'|[1-9][0-9]*)('.'[0-9]+)?([eE][+-]?[0-9]+)?
    const eof = 0x110000;
    const mask = 0x30;
    const powersOfTen = [
      1.0,
      1e1,
      1e2,
      1e3,
      1e4,
      1e5,
      1e6,
      1e7,
      1e8,
      1e9,
      1e10,
      1e11,
      1e12,
      1e13,
      1e14,
      1e15,
      1e16,
      1e17,
      1e18,
      1e19,
      1e20,
      1e21,
      1e22,
    ];
    final length = input.length;
    var pos = state.pos;
    var c = eof;
    if (pos < length) {
      c = input.codeUnitAt(pos);
    } else {
      c = eof;
    }
    var hasSign = false;
    if (c == 0x2d) {
      pos++;
      if (pos < length) {
        c = input.codeUnitAt(pos);
      } else {
        c = eof;
      }
      hasSign = true;
    }
    var digit = c ^ mask;
    if (digit > 9) {
      v = null;
      state.pos = pos;
      break;
    }
    final intPartPos = pos;
    var intPartLen = 0;
    intPartLen = 1;
    var intValue = 0;
    if (digit == 0) {
      pos++;
      if (pos < length) {
        c = input.codeUnitAt(pos);
      } else {
        c = eof;
      }
    } else {
      pos++;
      if (pos < length) {
        c = input.codeUnitAt(pos);
      } else {
        c = eof;
      }
      intValue = digit;
      while (true) {
        digit = c ^ mask;
        if (digit > 9) {
          break;
        }
        pos++;
        if (pos < length) {
          c = input.codeUnitAt(pos);
        } else {
          c = eof;
        }
        if (intPartLen++ < 18) {
          intValue = intValue * 10 + digit;
        }
      }
    }
    var hasDot = false;
    var decPartLen = 0;
    var decValue = 0;
    if (c == 0x2e) {
      pos++;
      if (pos < length) {
        c = input.codeUnitAt(pos);
      } else {
        c = eof;
      }
      hasDot = true;
      digit = c ^ mask;
      if (digit > 9) {
        v = null;
        state.pos = pos;
        break;
      }
      pos++;
      if (pos < length) {
        c = input.codeUnitAt(pos);
      } else {
        c = eof;
      }
      decPartLen = 1;
      decValue = digit;
      while (true) {
        digit = c ^ mask;
        if (digit > 9) {
          break;
        }
        pos++;
        if (pos < length) {
          c = input.codeUnitAt(pos);
        } else {
          c = eof;
        }
        if (decPartLen++ < 18) {
          decValue = decValue * 10 + digit;
        }
      }
    }
    var hasExp = false;
    var hasExpSign = false;
    var expPartLen = 0;
    var exp = 0;
    if (c == 0x45 || c == 0x65) {
      pos++;
      if (pos < length) {
        c = input.codeUnitAt(pos);
      } else {
        c = eof;
      }
      hasExp = true;
      switch (c) {
        case 0x2b:
          pos++;
          if (pos < length) {
            c = input.codeUnitAt(pos);
          } else {
            c = eof;
          }
          break;
        case 0x2d:
          pos++;
          if (pos < length) {
            c = input.codeUnitAt(pos);
          } else {
            c = eof;
          }
          hasExpSign = true;
          break;
      }
      digit = c ^ mask;
      if (digit > 9) {
        v = null;
        state.pos = pos;
        break;
      }
      pos++;
      if (pos < length) {
        c = input.codeUnitAt(pos);
      } else {
        c = eof;
      }
      expPartLen = 1;
      exp = digit;
      while (true) {
        digit = c ^ mask;
        if (digit > 9) {
          break;
        }
        pos++;
        if (pos < length) {
          c = input.codeUnitAt(pos);
        } else {
          c = eof;
        }
        if (expPartLen++ < 18) {
          exp = exp * 10 + digit;
        }
      }
      if (expPartLen > 18) {
        state.pos = pos;
        v = double.parse(input.substring(start, pos));
        break;
      }
      if (hasExpSign) {
        exp = -exp;
      }
    }
    state.pos = pos;
    final singlePart = !hasDot && !hasExp;
    if (singlePart && intPartLen <= 18) {
      v = hasSign ? -intValue : intValue;
      break;
    }
    if (singlePart && intPartLen == 19) {
      if (intValue == 922337203685477580) {
        final digit = input.codeUnitAt(intPartPos + 18) - 0x30;
        if (digit <= 7) {
          intValue = intValue * 10 + digit;
          v = hasSign ? -intValue : intValue;
          break;
        }
      }
    }
    var doubleValue = intValue * 1.0;
    var expRest = intPartLen - 18;
    expRest = expRest < 0 ? 0 : expRest;
    exp = expRest + exp;
    final modExp = exp < 0 ? -exp : exp;
    if (modExp > 22) {
      state.pos = pos;
      v = double.parse(input.substring(start, pos));
      break;
    }
    final k = powersOfTen[modExp];
    if (exp > 0) {
      doubleValue *= k;
    } else {
      doubleValue /= k;
    }
    if (decValue != 0) {
      var value = decValue * 1.0;
      final diff = exp - decPartLen;
      final modDiff = diff < 0 ? -diff : diff;
      final sign = diff < 0;
      var rest = modDiff;
      while (rest != 0) {
        var i = rest;
        if (i > 20) {
          i = 20;
        }
        rest -= i;
        final k = powersOfTen[i];
        if (sign) {
          value /= k;
        } else {
          value *= k;
        }
      }
      doubleValue += value;
    }
    v = hasSign ? -doubleValue : doubleValue;
    break;
  }
  if (v != null) {
    return Result(v);
  }
  final failPos = state.pos;
  state.pos = start;
  if (failPos < input.length) {
    return state.failAt(failPos, const ErrorUnexpectedChar());
  }
  return state.failAt(failPos, const ErrorUnexpectedEof());
}

Result<num>? _number(State<String> state) {
  final pos = state.pos;
  final r1 = _p$18(state);
  if (r1 != null) {
    final r2 = _ws(state);
    if (r2 != null) {
      return r1;
    }
  }
  state.pos = pos;
  return null;
}

Result<Object?>? _value(State<String> state) {
  int? c;
  if (state.pos < state.input.length) {
    c = state.input.codeUnitAt(state.pos);
  }
  var flag = 0x40;
  switch (c) {
    case 34: // '"'
      flag = 0x42;
      break;
    case 91: // '['
      flag = 0x44;
      break;
    case 102: // 'f'
      flag = 0x50;
      break;
    case 110: // 'n'
      flag = 0x48;
      break;
    case 116: // 't'
      flag = 0x60;
      break;
    case 123: // '{'
      flag = 0x41;
      break;
  }
  if (flag & 0x1 != 0) {
    final r1 = _object(state);
    if (r1 != null) {
      return r1;
    }
  }
  if (flag & 0x2 != 0) {
    final r1 = _string(state);
    if (r1 != null) {
      return r1;
    }
  }
  if (flag & 0x4 != 0) {
    final r1 = _array(state);
    if (r1 != null) {
      return r1;
    }
  }
  if (flag & 0x8 != 0) {
    final r1 = _null(state);
    if (r1 != null) {
      return r1;
    }
  }
  if (flag & 0x10 != 0) {
    final r1 = _false(state);
    if (r1 != null) {
      return r1;
    }
  }
  if (flag & 0x20 != 0) {
    final r1 = _true(state);
    if (r1 != null) {
      return r1;
    }
  }
  if (flag & 0x40 != 0) {
    final r1 = _number(state);
    if (r1 != null) {
      return r1;
    }
  }
  if (state.pos >= state.input.length) {
    state.fail<Object?>(const ErrorUnexpectedEof());
  }
  return state.failAll([
    const ErrorExpectedTags(['{']),
    const ErrorExpectedTags(['"']),
    const ErrorExpectedTags(['[']),
    const ErrorExpectedTags(['null']),
    const ErrorExpectedTags(['false']),
    const ErrorExpectedTags(['true'])
  ]);
}

Result<Object?>? _p$19(State<String> state) {
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
      final r3 = _p$19(state);
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
  Result<R>? failAll<R>(List<ParseError> errors) {
    if (pos < failPos) {
      return null;
    } else if (failPos < pos) {
      failPos = pos;
      this.errors = [];
    }
    this.errors.addAll(errors);
    return null;
  }

  @pragma('vm:prefer-inline')
  Result<R>? failAllAt<R>(int offset, List<ParseError> errors) {
    if (offset < failPos) {
      return null;
    } else if (failPos < offset) {
      failPos = offset;
      this.errors = [];
    }
    this.errors.addAll(errors);
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
