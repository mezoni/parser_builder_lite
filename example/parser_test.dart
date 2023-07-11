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
    expect(result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: \'1112\'');
    final value$0 = result$0!.value;
    expect(value$0, [49, 49, 49],
        reason: 'Testing \'result.value\' failed, input: \'1112\'');
    expect(state$0.pos, 3,
        reason: 'Testing \'state.pos\' failed, input: \'1112\'');
    final state$1 = State('');
    final result$1 = _Many$0(state$1);
    expect(result$1 != null, true,
        reason: 'Testing \'result != null\' failed, input: \'\'');
    final value$1 = result$1!.value;
    expect(value$1, [], reason: 'Testing \'result.value\' failed, input: \'\'');
    expect(state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: \'\'');
    final state$2 = State('2');
    final result$2 = _Many$0(state$2);
    expect(result$2 != null, true,
        reason: 'Testing \'result != null\' failed, input: \'2\'');
    final value$2 = result$2!.value;
    expect(value$2, [],
        reason: 'Testing \'result.value\' failed, input: \'2\'');
    expect(state$2.pos, 0,
        reason: 'Testing \'state.pos\' failed, input: \'2\'');
  });
}

void _test_Preceded$0() {
  // Preceded
  test('Preceded', () {
    final state$0 = State('123');
    final result$0 = _Preceded$0(state$0);
    expect(result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: \'123\'');
    final value$0 = result$0!.value;
    expect(value$0, 50,
        reason: 'Testing \'result.value\' failed, input: \'123\'');
    expect(state$0.pos, 2,
        reason: 'Testing \'state.pos\' failed, input: \'123\'');
    final state$1 = State('');
    final result$1 = _Preceded$0(state$1);
    expect(result$1 == null, true,
        reason: 'Testing \'result == null\' failed, input: \'\'');
    expect(state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: \'\'');
    expect(state$1.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: \'\'');
    expect(state$1.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: \'\'');
    expect(state$1.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: \'\'');
    final state$2 = State('1');
    final result$2 = _Preceded$0(state$2);
    expect(result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: \'1\'');
    expect(state$2.pos, 0,
        reason: 'Testing \'state.pos\' failed, input: \'1\'');
    expect(state$2.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: \'1\'');
    expect(state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: \'1\'');
    expect(state$2.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: \'1\'');
    final state$3 = State('2');
    final result$3 = _Preceded$0(state$3);
    expect(result$3 == null, true,
        reason: 'Testing \'result == null\' failed, input: \'2\'');
    expect(state$3.pos, 0,
        reason: 'Testing \'state.pos\' failed, input: \'2\'');
    expect(state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: \'2\'');
    expect(state$3.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: \'2\'');
    expect(state$3.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: \'2\'');
  });
}

Result<int>? _$0(State<String> state) {
  if (state.pos < state.input.length) {
    final c = state.input.codeUnitAt(state.pos);
    if (c == 49) {
      state.pos++;
      return const Result(49);
    }
    return state.fail(const ErrorExpectedChar(49));
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<List<int>>? _Many$0(State<String> state) {
  final list = <int>[];
  while (true) {
    final r1 = _$0(state);
    if (r1 == null) {
      break;
    }
    list.add(r1.value);
  }
  return Result(list);
}

Result<int>? _$2(State<String> state) {
  if (state.pos < state.input.length) {
    final c = state.input.codeUnitAt(state.pos);
    if (c == 50) {
      state.pos++;
      return const Result(50);
    }
    return state.fail(const ErrorExpectedChar(50));
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<int>? _Preceded$0(State<String> state) {
  final pos = state.pos;
  final r1 = _$0(state);
  if (r1 != null) {
    final r2 = _$2(state);
    if (r2 != null) {
      return r2;
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
