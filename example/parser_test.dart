// ignore_for_file: non_constant_identifier_names
// ignore_for_file: inference_failure_on_collection_literal
// ignore_for_file: unnecessary_cast

import 'package:test/test.dart' hide escape;

void main() {
  _test();
}

void _test() {
  // Many
  _test_Many$0();
  // Preceded
  _test_Preceded$0();
}

void _test_Many$0() {
  // Many
  test('Many', () {
    final state$0 = State('1112');
    final result$0 = _Many$0(state$0);
    expect(state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 1112');
    final value$0 = result$0!;
    expect(value$0, [49, 49, 49],
        reason: 'Testing \'result = value\' failed, input: 1112');
    expect(state$0.pos, 3, reason: 'Testing \'state.pos\' failed, input: 1112');
    final state$1 = State('1112');
    final result$1 = _Many_NoResult$0(state$1);
    expect(state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 1112');
    final value$1 = result$1;
    expect(value$1, null,
        reason: 'Testing \'result == null\' failed, input: 1112');
    expect(state$1.pos, 3, reason: 'Testing \'state.pos\' failed, input: 1112');
    final state$2 = State('');
    final result$2 = _Many$0(state$2);
    expect(state$2.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: ');
    final value$2 = result$2!;
    expect(value$2, [], reason: 'Testing \'result = value\' failed, input: ');
    expect(state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    final state$3 = State('');
    final result$3 = _Many_NoResult$0(state$3);
    expect(state$3.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: ');
    final value$3 = result$3;
    expect(value$3, null, reason: 'Testing \'result == null\' failed, input: ');
    expect(state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    final state$4 = State('2');
    final result$4 = _Many$0(state$4);
    expect(state$4.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 2');
    final value$4 = result$4!;
    expect(value$4, [], reason: 'Testing \'result = value\' failed, input: 2');
    expect(state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    final state$5 = State('2');
    final result$5 = _Many_NoResult$0(state$5);
    expect(state$5.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 2');
    final value$5 = result$5;
    expect(value$5, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect(state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
  });
}

void _test_Preceded$0() {
  // Preceded
  test('Preceded', () {
    final state$0 = State('123');
    final result$0 = _Preceded$0(state$0);
    expect(state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 123');
    final value$0 = result$0!;
    expect(value$0, 50,
        reason: 'Testing \'result = value\' failed, input: 123');
    expect(state$0.pos, 2, reason: 'Testing \'state.pos\' failed, input: 123');
    final state$1 = State('123');
    final result$1 = _Preceded_NoResult$0(state$1);
    expect(state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 123');
    final value$1 = result$1;
    expect(value$1, null,
        reason: 'Testing \'result == null\' failed, input: 123');
    expect(state$1.pos, 2, reason: 'Testing \'state.pos\' failed, input: 123');
    final state$2 = State('');
    final result$2 = _Preceded$0(state$2);
    expect(state$2.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect(result$2, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect(state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect(state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect(state$2.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect(state$2.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final state$3 = State('');
    final result$3 = _Preceded_NoResult$0(state$3);
    expect(state$3.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect(result$3, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect(state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect(state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect(state$3.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect(state$3.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final state$4 = State('1');
    final result$4 = _Preceded$0(state$4);
    expect(state$4.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 1');
    expect(result$4, null,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect(state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect(state$4.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect(state$4.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 1');
    expect(state$4.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 1');
    final state$5 = State('1');
    final result$5 = _Preceded_NoResult$0(state$5);
    expect(state$5.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 1');
    expect(result$5, null,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect(state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect(state$5.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect(state$5.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 1');
    expect(state$5.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 1');
    final state$6 = State('2');
    final result$6 = _Preceded$0(state$6);
    expect(state$6.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect(result$6, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect(state$6.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect(state$6.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect(state$6.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect(state$6.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
    final state$7 = State('2');
    final result$7 = _Preceded_NoResult$0(state$7);
    expect(state$7.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect(result$7, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect(state$7.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect(state$7.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect(state$7.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect(state$7.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
  });
}

List<int>? _Many$0(State<String> state) {
  List<int>? $0;
  final list$0 = <int>[];
  while (true) {
    int? $1;
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 49) {
      state.pos += 1;
      $1 = 49;
    } else {
      state.fail(const ErrorExpectedChar(49));
    }
    if (!state.ok) {
      break;
    }
    list$0.add($1!);
  }
  if (state.ok = true) {
    $0 = list$0;
  }
  return $0;
}

Object? _Many_NoResult$0(State<String> state) {
  Object? $0;
  while (true) {
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 49) {
      state.pos += 1;
    } else {
      state.fail(const ErrorExpectedChar(49));
    }
    if (!state.ok) {
      break;
    }
  }
  state.ok = true;
  return $0;
}

int? _Preceded$0(State<String> state) {
  int? $0;
  final pos$0 = state.pos;
  if (state.ok = state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 49) {
    state.pos += 1;
  } else {
    state.fail(const ErrorExpectedChar(49));
  }
  if (state.ok) {
    int? $1;
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 50) {
      state.pos += 1;
      $1 = 50;
    } else {
      state.fail(const ErrorExpectedChar(50));
    }
    if (state.ok) {
      $0 = $1;
    } else {
      state.pos = pos$0;
    }
  }
  return $0;
}

Object? _Preceded_NoResult$0(State<String> state) {
  Object? $0;
  final pos$0 = state.pos;
  if (state.ok = state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 49) {
    state.pos += 1;
  } else {
    state.fail(const ErrorExpectedChar(49));
  }
  if (state.ok) {
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 50) {
      state.pos += 1;
    } else {
      state.fail(const ErrorExpectedChar(50));
    }
    if (!state.ok) {
      state.pos = pos$0;
    }
  }
  return $0;
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
  Object? context;

  List<ParseError?> errors = List.filled(512, null, growable: false);

  int errorCount = 0;

  int failPos = 0;

  final T input;

  bool ok = false;

  int pos = 0;

  State(this.input);

  @pragma('vm:prefer-inline')
  void fail(ParseError error) {
    ok = false;
    if (pos >= failPos) {
      if (failPos < pos) {
        failPos = pos;
        errorCount = 0;
      }
      errors[errorCount++] = error;
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
        final error = errors[i];
        this.errors[errorCount++] = error;
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
        final error = errors[i];
        this.errors[errorCount++] = error;
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
      errors[errorCount++] = error;
    }
  }

  List<ParseError> getErrors() {
    return List.generate(errorCount, (i) => errors[i]!);
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
