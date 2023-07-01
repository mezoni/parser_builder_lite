Result<String>? _$g0(State<String> state) {
  const tag = '1';
  return switch (state.consumeCodeUnit(49)) {
    true => const Result(tag),
    _ => state.fail(const ErrorExpectedTags([tag])),
  };
}

Result<String>? _$g1(State<String> state) {
  const tag = '2';
  return switch (state.consumeCodeUnit(50)) {
    true => const Result(tag),
    _ => state.fail(const ErrorExpectedTags([tag])),
  };
}

Result<String>? _$g2(State<String> state) {
  const tag = '3';
  return switch (state.consumeCodeUnit(51)) {
    true => const Result(tag),
    _ => state.fail(const ErrorExpectedTags([tag])),
  };
}

Result<String>? delimited(State<String> state) {
  final pos = state.pos;
  final r1 = _$g0(state);
  if (r1 != null) {
    final r2 = _$g1(state);
    if (r2 != null) {
      final r3 = _$g2(state);
      if (r3 != null) {
        return Result(r2.value);
      }
    }
    state.pos = pos;
  }
  return null;
}

int? _$g4(int value, List<int> list) {
  if (list.isEmpty) {
    return null;
  }
  var right = list.length >> 1;
  if (right == 1) {
    final start = list[0];
    final end = list[1];
    if (value <= end && value >= start) {
      return value;
    }
    return null;
  }
  var left = 0;
  int? result;
  while (left < right) {
    final middle = (left + right) >> 1;
    final index = middle << 1;
    final start = list[index];
    final end = list[index + 1];
    if (value > end) {
      left = middle + 1;
    } else {
      if (value >= start) {
        return value;
      }
      right = middle;
    }
  }
  return result;
}

bool _$g3(int c) => _$g4(c, const [48, 57, 65, 90, 97, 122]) != null;

Result<int>? inAlphanumericRange(State<String> state) {
  final pos = state.pos;
  if (pos >= state.source.length) {
    return state.fail(const ErrorUnexpectedEof());
  }
  final c = state.source.readRune(state);
  final ok = _$g3(c);
  if (ok) {
    return Result(c);
  }
  state.pos = pos;
  return state.fail(const ErrorUnexpectedChar());
}

bool _$g5(int c) => _$g4(c, const [48, 57, 65, 90, 97, 122]) == null;

Result<int>? notInAlphanumericRange(State<String> state) {
  final pos = state.pos;
  if (pos >= state.source.length) {
    return state.fail(const ErrorUnexpectedEof());
  }
  final c = state.source.readRune(state);
  final ok = _$g5(c);
  if (ok) {
    return Result(c);
  }
  state.pos = pos;
  return state.fail(const ErrorUnexpectedChar());
}

Result<String>? preceded(State<String> state) {
  final pos = state.pos;
  final r1 = _$g0(state);
  if (r1 != null) {
    final r2 = _$g1(state);
    if (r2 != null) {
      return r2;
    }
    state.pos = pos;
  }
  return null;
}

Result<Object?>? skip1(State<String> state) {
  final pos = state.pos;
  final r1 = _$g0(state);
  if (r1 != null) {
    return const Result(null);
  }
  state.pos = pos;
  return null;
}

Result<Object?>? skip2(State<String> state) {
  final pos = state.pos;
  final r1 = _$g0(state);
  if (r1 != null) {
    final r2 = _$g1(state);
    if (r2 != null) {
      return const Result(null);
    }
  }
  state.pos = pos;
  return null;
}

Result<Object?>? skip3(State<String> state) {
  final pos = state.pos;
  final r1 = _$g0(state);
  if (r1 != null) {
    final r2 = _$g1(state);
    if (r2 != null) {
      final r3 = _$g2(state);
      if (r3 != null) {
        return const Result(null);
      }
    }
  }
  state.pos = pos;
  return null;
}

Result<String>? switchTag(State<String> state) {
  final pos = state.pos;
  final source = state.source;
  if (pos < source.length) {
    final c = source.codeUnitAt(pos);
    if (c == 97) {
      if (source.startsWith('abc', pos)) {
        state.pos += 3;
        return const Result('abc');
      } else if (source.startsWith('ab', pos)) {
        state.pos += 2;
        return const Result('ab');
      } else {
        state.pos += 1;
        return const Result('a');
      }
    } else if (c == 98) {
      state.pos += 1;
      return const Result('b');
    } else if (c == 99) {
      if (source.startsWith('cde', pos)) {
        state.pos += 3;
        return const Result('cde');
      }
    }
  }
  return state.fail(const ErrorMessage(1, 'error'));
}

Result<String>? terminated(State<String> state) {
  final pos = state.pos;
  final r1 = _$g0(state);
  if (r1 != null) {
    final r2 = _$g1(state);
    if (r2 != null) {
      return r1;
    }
    state.pos = pos;
  }
  return null;
}

Result<(String, String)>? tuple2(State<String> state) {
  final pos = state.pos;
  final r1 = _$g0(state);
  if (r1 != null) {
    final r2 = _$g1(state);
    if (r2 != null) {
      return Result((r1.value, r2.value));
    }
  }
  state.pos = pos;
  return null;
}

Result<(String, String, String)>? tuple3(State<String> state) {
  final pos = state.pos;
  final r1 = _$g0(state);
  if (r1 != null) {
    final r2 = _$g1(state);
    if (r2 != null) {
      final r3 = _$g2(state);
      if (r3 != null) {
        return Result((r1.value, r2.value, r3.value));
      }
    }
  }
  state.pos = pos;
  return null;
}

Result<String>? _$g6(State<String> state) {
  const tag = '4';
  return switch (state.consumeCodeUnit(52)) {
    true => const Result(tag),
    _ => state.fail(const ErrorExpectedTags([tag])),
  };
}

Result<(String, String, String, String)>? tuple4(State<String> state) {
  final pos = state.pos;
  final r1 = _$g0(state);
  if (r1 != null) {
    final r2 = _$g1(state);
    if (r2 != null) {
      final r3 = _$g2(state);
      if (r3 != null) {
        final r4 = _$g6(state);
        if (r4 != null) {
          return Result((r1.value, r2.value, r3.value, r4.value));
        }
      }
    }
  }
  state.pos = pos;
  return null;
}

Result<String>? _$g7(State<String> state) {
  const tag = '5';
  return switch (state.consumeCodeUnit(53)) {
    true => const Result(tag),
    _ => state.fail(const ErrorExpectedTags([tag])),
  };
}

Result<(String, String, String, String, String)>? tuple5(State<String> state) {
  final pos = state.pos;
  final r1 = _$g0(state);
  if (r1 != null) {
    final r2 = _$g1(state);
    if (r2 != null) {
      final r3 = _$g2(state);
      if (r3 != null) {
        final r4 = _$g6(state);
        if (r4 != null) {
          final r5 = _$g7(state);
          if (r5 != null) {
            return Result((r1.value, r2.value, r3.value, r4.value, r5.value));
          }
        }
      }
    }
  }
  state.pos = pos;
  return null;
}

Result<String>? _$g8(State<String> state) {
  const tag = '6';
  return switch (state.consumeCodeUnit(54)) {
    true => const Result(tag),
    _ => state.fail(const ErrorExpectedTags([tag])),
  };
}

Result<(String, String, String, String, String, String)>? tuple6(
    State<String> state) {
  final pos = state.pos;
  final r1 = _$g0(state);
  if (r1 != null) {
    final r2 = _$g1(state);
    if (r2 != null) {
      final r3 = _$g2(state);
      if (r3 != null) {
        final r4 = _$g6(state);
        if (r4 != null) {
          final r5 = _$g7(state);
          if (r5 != null) {
            final r6 = _$g8(state);
            if (r6 != null) {
              return Result(
                  (r1.value, r2.value, r3.value, r4.value, r5.value, r6.value));
            }
          }
        }
      }
    }
  }
  state.pos = pos;
  return null;
}

Result<String>? _$g9(State<String> state) {
  const tag = '7';
  return switch (state.consumeCodeUnit(55)) {
    true => const Result(tag),
    _ => state.fail(const ErrorExpectedTags([tag])),
  };
}

Result<(String, String, String, String, String, String, String)>? tuple7(
    State<String> state) {
  final pos = state.pos;
  final r1 = _$g0(state);
  if (r1 != null) {
    final r2 = _$g1(state);
    if (r2 != null) {
      final r3 = _$g2(state);
      if (r3 != null) {
        final r4 = _$g6(state);
        if (r4 != null) {
          final r5 = _$g7(state);
          if (r5 != null) {
            final r6 = _$g8(state);
            if (r6 != null) {
              final r7 = _$g9(state);
              if (r7 != null) {
                return Result((
                  r1.value,
                  r2.value,
                  r3.value,
                  r4.value,
                  r5.value,
                  r6.value,
                  r7.value
                ));
              }
            }
          }
        }
      }
    }
  }
  state.pos = pos;
  return null;
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

extension on State<String> {
  @pragma('vm:prefer-inline')
  // ignore: unused_element
  bool consumeCodeUnit(int c) {
    if (pos >= source.length || source.codeUnitAt(pos) != c) {
      return false;
    }
    pos++;
    return true;
  }
}
