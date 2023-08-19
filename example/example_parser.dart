void main() {
  final r = parse('{"rocket": "🚀 flies to the stars"}');
  print(r);
}

Object? parse(String input) {
  final state = State(input);
  final result = parser(state);
  if (!state.ok) {
    final message =
        ParseError.errorMessage(input, state.failPos, state.getErrors());
    throw message;
  }
  return result;
}

String? _ws(State<String> state) {
  String? $0;
  final input$0 = state.input;
  while (state.pos < input$0.length) {
    final c = input$0.codeUnitAt(state.pos);
    final v = c >= 9 && c <= 10 || c == 13 || c == 32;
    if (!v) {
      break;
    }
    state.pos += 1;
  }
  state.ok = true;
  return $0;
}

String? _escapeChar(State<String> state) {
  String? $0;
  final pos$0 = state.pos;
  if (pos$0 < state.input.length) {
    final c = state.input.codeUnitAt(pos$0);
    if (c == 34) {
      state.pos += 1;
      $0 = '"';
    } else if (c == 47) {
      state.pos += 1;
      $0 = '/';
    } else if (c == 92) {
      state.pos += 1;
      $0 = '\\';
    } else if (c == 98) {
      state.pos += 1;
      $0 = '\b';
    } else if (c == 102) {
      state.pos += 1;
      $0 = '\f';
    } else if (c == 110) {
      state.pos += 1;
      $0 = '\n';
    } else if (c == 114) {
      state.pos += 1;
      $0 = '\r';
    } else if (c == 116) {
      state.pos += 1;
      $0 = '\t';
    }
  }
  if (!(state.ok = state.pos != pos$0)) {
    state.failAll([
      const ErrorExpectedTags(['"', '/', '\\', 'b', 'f', 'n', 'r', 't'])
    ]);
  }
  return $0;
}

String? _hexValue(State<String> state) {
  String? $0;
  String? $1;
  final input$0 = state.input;
  final pos$0 = state.pos;
  var count$0 = 0;
  while (count$0 < 4 && state.pos < input$0.length) {
    final c = input$0.codeUnitAt(state.pos);
    final v = c >= 48 && c <= 57 || c >= 65 && c <= 70 || c >= 97 && c <= 102;
    if (!v) {
      break;
    }
    state.pos += 1;
    count$0++;
  }
  if (state.ok = count$0 >= 4) {
    $1 = state.pos != pos$0 ? input$0.substring(pos$0, state.pos) : '';
  } else {
    final failPos = state.pos;
    state.pos = pos$0;
    state.failAt(failPos, const ErrorUnexpectedChar());
  }
  if (state.ok) {
    final v = $1!;
    $0 = String.fromCharCode(_toHexValue(v));
  }
  return $0;
}

String? _hexValueChecked(State<String> state) {
  String? $0;
  final failPos$0 = state.failPos;
  final errorCount$0 = state.errorCount;
  String? $1;
  $1 = _hexValue(state);
  if (state.ok) {
    $0 = $1;
  } else {
    if (state.canHandleError(failPos$0, errorCount$0)) {
      if (state.pos != state.failPos) {
        state.clearErrors(failPos$0, errorCount$0);
        state.failAt(
            state.failPos,
            ErrorMessage(state.pos - state.failPos,
                'Expected 4 digit hexadecimal number'));
      }
    }
  }
  return $0;
}

String? _escapeHex(State<String> state) {
  String? $0;
  final pos$0 = state.pos;
  const tag$0 = 'u';
  if (state.ok = state.pos + 1 <= state.input.length &&
      state.input.codeUnitAt(state.pos) == 117) {
    state.pos += 1;
  } else {
    state.fail(const ErrorExpectedTags([tag$0]));
  }
  if (state.ok) {
    String? $1;
    $1 = _hexValueChecked(state);
    if (state.ok) {
      $0 = $1;
    } else {
      state.pos = pos$0;
    }
  }
  return $0;
}

String? _stringChars(State<String> state) {
  String? $0;
  final input$0 = state.input;
  List<String>? list$0;
  String? str$0;
  while (state.pos < input$0.length) {
    final pos$0 = state.pos;
    var c = -1;
    while (state.pos < input$0.length) {
      c = input$0.runeAt(state.pos);
      final ok = c <= 91
          ? c <= 33
              ? c >= 32
              : c >= 35
          : c <= 1114111 && c >= 93;
      if (!ok) {
        break;
      }
      state.pos += c > 0xffff ? 2 : 1;
    }
    if (state.pos != pos$0) {
      final v = input$0.substring(pos$0, state.pos);
      if (str$0 == null) {
        str$0 = v;
      } else {
        if (list$0 == null) {
          list$0 = [str$0, v];
        } else {
          list$0.add(v);
        }
      }
    }
    if (c != 92) {
      break;
    }
    state.pos += 1;
    String? $1;
    String? $2;
    $2 = _escapeChar(state);
    if (state.ok) {
      $1 = $2;
    } else {
      String? $4;
      $4 = _escapeHex(state);
      if (state.ok) {
        $1 = $4;
      }
    }
    if (!state.ok) {
      state.pos = pos$0;
      break;
    }
    if (str$0 == null) {
      str$0 = $1!;
    } else {
      if (list$0 == null) {
        list$0 = [str$0, $1!];
      } else {
        list$0.add($1!);
      }
    }
  }
  state.ok = true;
  if (str$0 == null) {
    $0 = '';
  } else if (list$0 == null) {
    $0 = str$0;
  } else {
    $0 = list$0.join();
  }
  return $0;
}

String? _string(State<String> state) {
  String? $0;
  final pos$0 = state.pos;
  const tag$0 = '"';
  if (state.ok = state.pos + 1 <= state.input.length &&
      state.input.codeUnitAt(state.pos) == 34) {
    state.pos += 1;
  } else {
    state.fail(const ErrorExpectedTags([tag$0]));
  }
  if (state.ok) {
    String? $1;
    $1 = _stringChars(state);
    if (state.ok) {
      // => _doubleQuote
      final pos$5 = state.pos;
      const tag$2 = '"';
      if (state.ok = state.pos + 1 <= state.input.length &&
          state.input.codeUnitAt(state.pos) == 34) {
        state.pos += 1;
      } else {
        state.fail(const ErrorExpectedTags([tag$2]));
      }
      if (state.ok) {
        _ws(state);
        if (!state.ok) {
          state.pos = pos$5;
        }
      }
      // <= _doubleQuote
      if (state.ok) {
        $0 = $1;
      }
    }
  }
  if (!state.ok) {
    state.pos = pos$0;
  }
  return $0;
}

MapEntry<String, Object?>? _keyValue(State<String> state) {
  MapEntry<String, Object?>? $0;
  (String, Object?)? $1;
  final pos$0 = state.pos;
  String? $2;
  $2 = _string(state);
  if (state.ok) {
    // => _colon
    final pos$7 = state.pos;
    const tag$3 = ':';
    if (state.ok = state.pos + 1 <= state.input.length &&
        state.input.codeUnitAt(state.pos) == 58) {
      state.pos += 1;
    } else {
      state.fail(const ErrorExpectedTags([tag$3]));
    }
    if (state.ok) {
      _ws(state);
      if (!state.ok) {
        state.pos = pos$7;
      }
    }
    // <= _colon
    if (state.ok) {
      Object? $18;
      $18 = _value(state);
      if (state.ok) {
        $1 = ($2!, $18);
      }
    }
  }
  if (!state.ok) {
    state.pos = pos$0;
  }
  if (state.ok) {
    final v = $1!;
    $0 = MapEntry(v.$1, v.$2);
  }
  return $0;
}

String? _comma(State<String> state) {
  String? $0;
  final pos$0 = state.pos;
  String? $1;
  const tag$0 = ',';
  if (state.ok = state.pos + 1 <= state.input.length &&
      state.input.codeUnitAt(state.pos) == 44) {
    state.pos += 1;
    $1 = tag$0;
  } else {
    state.fail(const ErrorExpectedTags([tag$0]));
  }
  if (state.ok) {
    _ws(state);
    if (state.ok) {
      $0 = $1;
    } else {
      state.pos = pos$0;
    }
  }
  return $0;
}

List<MapEntry<String, Object?>>? _keyValues(State<String> state) {
  List<MapEntry<String, Object?>>? $0;
  var pos$0 = state.pos;
  final list$0 = <MapEntry<String, Object?>>[];
  while (true) {
    MapEntry<String, Object?>? $1;
    $1 = _keyValue(state);
    if (!state.ok) {
      state.pos = pos$0;
      break;
    }
    list$0.add($1!);
    pos$0 = state.pos;
    _comma(state);
    if (!state.ok) {
      break;
    }
  }
  if (state.ok = true) {
    $0 = list$0;
  }
  return $0;
}

Map<String, Object?>? _object(State<String> state) {
  Map<String, Object?>? $0;
  (String, List<MapEntry<String, Object?>>, String)? $1;
  final pos$0 = state.pos;
  String? $2;
  // => _openBrace
  final pos$1 = state.pos;
  String? $3;
  const tag$0 = '{';
  if (state.ok = state.pos + 1 <= state.input.length &&
      state.input.codeUnitAt(state.pos) == 123) {
    state.pos += 1;
    $3 = tag$0;
  } else {
    state.fail(const ErrorExpectedTags([tag$0]));
  }
  if (state.ok) {
    _ws(state);
    if (state.ok) {
      $2 = $3;
    } else {
      state.pos = pos$1;
    }
  }
  // <= _openBrace
  if (state.ok) {
    List<MapEntry<String, Object?>>? $5;
    $5 = _keyValues(state);
    if (state.ok) {
      String? $30;
      // => _closeBrace
      final pos$12 = state.pos;
      String? $31;
      const tag$6 = '}';
      if (state.ok = state.pos + 1 <= state.input.length &&
          state.input.codeUnitAt(state.pos) == 125) {
        state.pos += 1;
        $31 = tag$6;
      } else {
        state.fail(const ErrorExpectedTags([tag$6]));
      }
      if (state.ok) {
        _ws(state);
        if (state.ok) {
          $30 = $31;
        } else {
          state.pos = pos$12;
        }
      }
      // <= _closeBrace
      if (state.ok) {
        $1 = ($2!, $5!, $30!);
      }
    }
  }
  if (!state.ok) {
    state.pos = pos$0;
  }
  if (state.ok) {
    final v = $1!;
    $0 = Map.fromEntries(v.$2);
  }
  return $0;
}

List<Object?>? _values(State<String> state) {
  List<Object?>? $0;
  var pos$0 = state.pos;
  final list$0 = <Object?>[];
  while (true) {
    Object? $1;
    $1 = _value(state);
    if (!state.ok) {
      state.pos = pos$0;
      break;
    }
    list$0.add($1);
    pos$0 = state.pos;
    _comma(state);
    if (!state.ok) {
      break;
    }
  }
  if (state.ok = true) {
    $0 = list$0;
  }
  return $0;
}

List<Object?>? _array(State<String> state) {
  List<Object?>? $0;
  final pos$0 = state.pos;
  // => _openBracket
  final pos$1 = state.pos;
  const tag$0 = '[';
  if (state.ok = state.pos + 1 <= state.input.length &&
      state.input.codeUnitAt(state.pos) == 91) {
    state.pos += 1;
  } else {
    state.fail(const ErrorExpectedTags([tag$0]));
  }
  if (state.ok) {
    _ws(state);
    if (!state.ok) {
      state.pos = pos$1;
    }
  }
  // <= _openBracket
  if (state.ok) {
    List<Object?>? $2;
    $2 = _values(state);
    if (state.ok) {
      // => _closeBracket
      final pos$4 = state.pos;
      const tag$2 = ']';
      if (state.ok = state.pos + 1 <= state.input.length &&
          state.input.codeUnitAt(state.pos) == 93) {
        state.pos += 1;
      } else {
        state.fail(const ErrorExpectedTags([tag$2]));
      }
      if (state.ok) {
        _ws(state);
        if (!state.ok) {
          state.pos = pos$4;
        }
      }
      // <= _closeBracket
      if (state.ok) {
        $0 = $2;
      }
    }
  }
  if (!state.ok) {
    state.pos = pos$0;
  }
  return $0;
}

Object? _null(State<String> state) {
  Object? $0;
  final pos$0 = state.pos;
  const tag$0 = 'null';
  if (state.ok = state.pos + 4 <= state.input.length &&
      state.input.codeUnitAt(state.pos) == 110 &&
      state.input.codeUnitAt(state.pos + 1) == 117 &&
      state.input.codeUnitAt(state.pos + 2) == 108 &&
      state.input.codeUnitAt(state.pos + 3) == 108) {
    state.pos += 4;
  } else {
    state.fail(const ErrorExpectedTags([tag$0]));
  }
  if (state.ok) {
    _ws(state);
    if (!state.ok) {
      state.pos = pos$0;
    }
  }
  if (state.ok) {
    $0 = null;
  }
  return $0;
}

bool? _false(State<String> state) {
  bool? $0;
  final pos$0 = state.pos;
  const tag$0 = 'false';
  if (state.ok = state.pos + 5 <= state.input.length &&
      state.input.codeUnitAt(state.pos) == 102 &&
      state.input.codeUnitAt(state.pos + 1) == 97 &&
      state.input.codeUnitAt(state.pos + 2) == 108 &&
      state.input.codeUnitAt(state.pos + 3) == 115 &&
      state.input.codeUnitAt(state.pos + 4) == 101) {
    state.pos += 5;
  } else {
    state.fail(const ErrorExpectedTags([tag$0]));
  }
  if (state.ok) {
    _ws(state);
    if (!state.ok) {
      state.pos = pos$0;
    }
  }
  if (state.ok) {
    $0 = false;
  }
  return $0;
}

bool? _true(State<String> state) {
  bool? $0;
  final pos$0 = state.pos;
  const tag$0 = 'true';
  if (state.ok = state.pos + 4 <= state.input.length &&
      state.input.codeUnitAt(state.pos) == 116 &&
      state.input.codeUnitAt(state.pos + 1) == 114 &&
      state.input.codeUnitAt(state.pos + 2) == 117 &&
      state.input.codeUnitAt(state.pos + 3) == 101) {
    state.pos += 4;
  } else {
    state.fail(const ErrorExpectedTags([tag$0]));
  }
  if (state.ok) {
    _ws(state);
    if (!state.ok) {
      state.pos = pos$0;
    }
  }
  if (state.ok) {
    $0 = true;
  }
  return $0;
}

String? _minus(State<String> state) {
  String? $0;
  String? $1;
  const tag$0 = '-';
  if (state.ok = state.pos + 1 <= state.input.length &&
      state.input.codeUnitAt(state.pos) == 45) {
    state.pos += 1;
    $1 = tag$0;
  } else {
    state.fail(const ErrorExpectedTags([tag$0]));
  }
  if (state.ok) {
    $0 = $1;
  } else {
    state.ok = true;
  }
  return $0;
}

String? _digit0(State<String> state) {
  String? $0;
  final input$0 = state.input;
  while (state.pos < input$0.length) {
    final c = input$0.codeUnitAt(state.pos);
    final v = c >= 48 && c <= 57;
    if (!v) {
      break;
    }
    state.pos += 1;
  }
  state.ok = true;
  return $0;
}

Object? _integer(State<String> state) {
  Object? $0;
  const tag$0 = '0';
  if (state.ok = state.pos + 1 <= state.input.length &&
      state.input.codeUnitAt(state.pos) == 48) {
    state.pos += 1;
  } else {
    state.fail(const ErrorExpectedTags([tag$0]));
  }
  if (!state.ok) {
    final pos$0 = state.pos;
    if (state.ok = state.pos < state.input.length) {
      final c = state.input.codeUnitAt(state.pos);
      state.ok = c >= 49 && c <= 57;
      if (state.ok) {
        state.pos += 1;
      }
    }
    if (!state.ok) {
      state.fail(const ErrorUnexpectedChar());
    }
    if (state.ok) {
      _digit0(state);
      if (!state.ok) {
        state.pos = pos$0;
      }
    }
  }
  return $0;
}

Object? _frac(State<String> state) {
  Object? $0;
  Object? $1;
  final pos$0 = state.pos;
  const tag$0 = '.';
  if (state.ok = state.pos + 1 <= state.input.length &&
      state.input.codeUnitAt(state.pos) == 46) {
    state.pos += 1;
  } else {
    state.fail(const ErrorExpectedTags([tag$0]));
  }
  if (state.ok) {
    _digit0(state);
    if (!state.ok) {
      state.pos = pos$0;
    }
  }
  if (state.ok) {
    $0 = $1;
  } else {
    state.ok = true;
  }
  return $0;
}

num? _number(State<String> state) {
  num? $0;
  final pos$0 = state.pos;
  num? $1;
  String? $2;
  final pos$1 = state.pos;
  final pos$2 = state.pos;
  _minus(state);
  if (state.ok) {
    _integer(state);
    if (state.ok) {
      _frac(state);
      if (state.ok) {
        // => _exp
        final pos$5 = state.pos;
        final pos$6 = state.pos;
        if (pos$6 < state.input.length) {
          final c = state.input.codeUnitAt(pos$6);
          if (c == 101) {
            state.pos += 1;
          } else if (c == 69) {
            state.pos += 1;
          }
        }
        if (!(state.ok = state.pos != pos$6)) {
          state.failAll([
            const ErrorExpectedTags(['e', 'E'])
          ]);
        }
        if (state.ok) {
          final pos$7 = state.pos;
          if (pos$7 < state.input.length) {
            final c = state.input.codeUnitAt(pos$7);
            if (c == 43) {
              state.pos += 1;
            } else if (c == 45) {
              state.pos += 1;
            }
          }
          if (!(state.ok = state.pos != pos$7)) {
            state.failAll([
              const ErrorExpectedTags(['+', '-'])
            ]);
          }
          if (!state.ok) {
            state.ok = true;
          }
          if (state.ok) {
            _digit0(state);
          }
        }
        if (!state.ok) {
          state.pos = pos$5;
        }
        if (!state.ok) {
          state.ok = true;
        }
        // <= _exp
      }
    }
  }
  if (!state.ok) {
    state.pos = pos$2;
  }
  if (state.ok) {
    $2 = state.pos != pos$1 ? state.input.substring(pos$1, state.pos) : '';
  }
  if (state.ok) {
    final v = $2!;
    $1 = num.parse(v);
  }
  if (state.ok) {
    _ws(state);
    if (state.ok) {
      $0 = $1;
    } else {
      state.pos = pos$0;
    }
  }
  return $0;
}

Object? _value(State<String> state) {
  Object? $0;
  final int? v$0 =
      state.pos < state.input.length ? state.input.runeAt(state.pos) : null;
  var flag$0 = 0x40;
  if (v$0 != null) {
    if (v$0 == 34) {
      flag$0 = 0x42;
    } else if (v$0 == 91) {
      flag$0 = 0x44;
    } else if (v$0 == 102) {
      flag$0 = 0x50;
    } else if (v$0 == 110) {
      flag$0 = 0x48;
    } else if (v$0 == 116) {
      flag$0 = 0x60;
    } else if (v$0 == 123) {
      flag$0 = 0x41;
    }
  }
  state.ok = false;
  if (flag$0 & 0x1 != 0) {
    Map<String, Object?>? $1;
    $1 = _object(state);
    if (state.ok) {
      $0 = $1!;
    }
  }
  if (!state.ok) {
    if (flag$0 & 0x2 != 0) {
      String? $35;
      $35 = _string(state);
      if (state.ok) {
        $0 = $35!;
      }
    }
    if (!state.ok) {
      if (flag$0 & 0x4 != 0) {
        List<Object?>? $50;
        $50 = _array(state);
        if (state.ok) {
          $0 = $50!;
        }
      }
      if (!state.ok) {
        if (flag$0 & 0x8 != 0) {
          Object? $60;
          $60 = _null(state);
          if (state.ok) {
            $0 = $60;
          }
        }
        if (!state.ok) {
          if (flag$0 & 0x10 != 0) {
            bool? $63;
            $63 = _false(state);
            if (state.ok) {
              $0 = $63!;
            }
          }
          if (!state.ok) {
            if (flag$0 & 0x20 != 0) {
              bool? $66;
              $66 = _true(state);
              if (state.ok) {
                $0 = $66!;
              }
            }
            if (!state.ok) {
              if (flag$0 & 0x40 != 0) {
                num? $69;
                $69 = _number(state);
                if (state.ok) {
                  $0 = $69!;
                }
              }
            }
          }
        }
      }
    }
  }
  if (!state.ok) {
    state.failAll([
      const ErrorExpectedTags(['{']),
      const ErrorExpectedTags(['"']),
      const ErrorExpectedTags(['[']),
      const ErrorExpectedTags(['null']),
      const ErrorExpectedTags(['false']),
      const ErrorExpectedTags(['true'])
    ]);
  }
  return $0;
}

Object? parser(State<String> state) {
  Object? $0;
  final pos$0 = state.pos;
  _ws(state);
  if (state.ok) {
    Object? $2;
    $2 = _value(state);
    if (state.ok) {
      if (!(state.ok = state.pos >= state.input.length)) {
        state.fail(const ErrorExpectedEof());
      }
      if (state.ok) {
        $0 = $2;
      }
    }
  }
  if (!state.ok) {
    state.pos = pos$0;
  }
  return $0;
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

class ErrorExpectedChar extends ParseError {
  final int char;

  const ErrorExpectedChar(this.char);

  @override
  String getMessage({
    required Object? input,
    required int offset,
  }) {
    final hexValue = char.toRadixString(16);
    final value = ParseError.escape(char);
    return 'Unexpected character $value (0x$hexValue)';
  }
}

class ErrorExpectedEof extends ParseError {
  const ErrorExpectedEof();

  @override
  String getMessage({
    required Object? input,
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
    required Object? input,
    required int offset,
  }) {
    var string = value.toRadixString(16);
    if (const [8, 16, 24, 32, 40, 48, 56, 64].contains(size)) {
      string = string.padLeft(size >> 2, '0');
    }
    if (value >= 0 && value <= 0x10ffff) {
      string = '$string (${ParseError.escape(value)})';
    }
    return 'Expected 0x$string';
  }
}

class ErrorExpectedTags extends ParseError {
  final List<String> tags;

  const ErrorExpectedTags(this.tags);

  @override
  String getMessage({
    required Object? input,
    required int offset,
  }) {
    final value = tags.map(ParseError.escape).join(', ');
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
    required Object? input,
    required int offset,
  }) {
    return message;
  }
}

class ErrorUnexpectedChar extends ParseError {
  const ErrorUnexpectedChar();

  @override
  String getMessage({
    required Object? input,
    required int offset,
  }) {
    if (input is String) {
      if (offset < input.length) {
        final char = input.runeAt(offset);
        final hexValue = char.toRadixString(16);
        final value = ParseError.escape(char);
        return 'Unexpected character $value (0x$hexValue)';
      }
    }
    return 'Unexpected character';
  }
}

class ErrorUnexpectedEof extends ParseError {
  const ErrorUnexpectedEof();

  @override
  String getMessage({
    required Object? input,
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
    required Object? input,
    required int offset,
  }) {
    return 'Unexpected input';
  }
}

class ErrorUnknown extends ParseError {
  const ErrorUnknown();

  @override
  String getMessage({
    required Object? input,
    required int offset,
  }) {
    return 'Unknown error';
  }
}

abstract class ParseError {
  const ParseError();

  int get length => 0;

  String getMessage({
    required Object? input,
    required int offset,
  });

  static String errorMessage(
      String input, int offset, List<ParseError> errors) {
    int max(int x, int y) => x > y ? x : y;
    int min(int x, int y) => x < y ? x : y;
    final sb = StringBuffer();
    final errorList = errors.toList();
    if (offset >= input.length) {
      errorList.add(const ErrorUnexpectedEof());
      errorList.removeWhere((e) => e is ErrorUnexpectedChar);
    }
    final expectedTags = errorList.whereType<ErrorExpectedTags>().toList();
    if (expectedTags.isNotEmpty) {
      errorList.removeWhere((e) => e is ErrorExpectedTags);
      final tags = <String>{};
      for (final error in expectedTags) {
        tags.addAll(error.tags);
      }
      final error = ErrorExpectedTags(tags.toList());
      errorList.add(error);
    }
    final errorInfoList = errorList
        .map((e) {
          final offset2 = offset + e.length;
          final start = min(offset2, offset);
          final end = max(offset2, offset);
          return (
            start: start,
            end: end,
            message: e.getMessage(offset: start, input: input),
          );
        })
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
      final start = errorInfo.start;
      final end = errorInfo.end;
      final message = errorInfo.message;
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

  static String escape(Object? value, [bool quote = true]) {
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
  int get hashCode => value.hashCode;

  @override
  bool operator ==(other) => other is Result<T> && value == other.value;

  @override
  String toString() {
    return '$value';
  }
}

class State<T> {
  Object? context;

  final List<ParseError?> errors = List.filled(64, null, growable: false);

  int errorCount = 0;

  int failPos = 0;

  final T input;

  bool ok = false;

  int pos = 0;

  final List<
      ({
        int last,
        int index,
        List<({int start, int end, bool ok, Object? result})?> list
      })?> _cache = List.filled(64, null, growable: false);

  State(this.input);

  @pragma('vm:prefer-inline')
  bool canHandleError(int failPos, int errorCount) => failPos == this.failPos
      ? errorCount < this.errorCount
      : failPos < this.failPos;

  void clearErrors(int failPos, int errorCount) {
    if (this.failPos == failPos) {
      this.errorCount = errorCount;
    } else if (this.failPos > failPos) {
      this.errorCount = 0;
    }
  }

  @pragma('vm:prefer-inline')
  void fail(ParseError error) {
    ok = false;
    if (pos >= failPos) {
      if (failPos < pos) {
        failPos = pos;
        errorCount = 0;
      }
      if (errorCount < errors.length) {
        errors[errorCount++] = error;
      }
    }
  }

  @pragma('vm:prefer-inline')
  void failAll(List<ParseError> errors) {
    ok = false;
    if (pos >= failPos) {
      if (failPos < pos) {
        failPos = pos;
        errorCount = 0;
      }
      for (var i = 0; i < errors.length; i++) {
        if (errorCount < errors.length) {
          this.errors[errorCount++] = errors[i];
        }
      }
    }
  }

  @pragma('vm:prefer-inline')
  void failAllAt(int offset, List<ParseError> errors) {
    ok = false;
    if (offset >= failPos) {
      if (failPos < offset) {
        failPos = offset;
        errorCount = 0;
      }
      for (var i = 0; i < errors.length; i++) {
        if (errorCount < errors.length) {
          this.errors[errorCount++] = errors[i];
        }
      }
    }
  }

  @pragma('vm:prefer-inline')
  void failAt(int offset, ParseError error) {
    ok = false;
    if (offset >= failPos) {
      if (failPos < offset) {
        failPos = offset;
        errorCount = 0;
      }
      if (errorCount < errors.length) {
        errors[errorCount++] = error;
      }
    }
  }

  List<ParseError> getErrors() {
    return List.generate(errorCount, (i) => errors[i]!);
  }

  @pragma('vm:prefer-inline')
  void memoize(int id, int start, int end, bool ok, Object? result) {
    if (id >= _cache.length) {
      return;
    }

    var index = -1;
    var record = _cache[id];
    if (record == null) {
      record =
          (last: start, index: 0, list: List.filled(4, null, growable: false));
      _cache[id] = record;
    } else {
      index = record.index;
    }

    if (record.last <= pos) {
      final list = record.list;
      index = index < list.length - 1 ? index + 1 : 0;
      list[index] = (start: start, end: end, ok: ok, result: result);
      _cache[id] = (last: pos, index: index, list: list);
    }
  }

  @pragma('vm:prefer-inline')
  ({int start, int end, bool ok, Object? result})? memoized(int id, int pos) {
    if (id >= _cache.length) {
      return null;
    }

    final record = _cache[id];
    if (record == null) {
      return null;
    }

    final list = record.list;
    var count = 0;
    while (count < list.length) {
      final value = list[count];
      if (value == null) {
        return null;
      }

      if (value.start == pos) {
        return value;
      }

      count++;
    }

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
