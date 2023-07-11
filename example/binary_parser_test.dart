// ignore_for_file: non_constant_identifier_names
// ignore_for_file: inference_failure_on_collection_literal
// ignore_for_file: unnecessary_cast
import 'dart:typed_data';

import 'package:test/test.dart' hide escape;

void main() {
  _test();
}

void _test() {
  // Many
  _test_Many$0();
  // UintBE
  _test_UintBE$0();
}

void _test_Many$0() {
  // Many
  test('Many', () {
    final state$0 =
        State(Uint8List.fromList([0, 1, 0, 1, 0, 2]).buffer.asByteData());
    final result$0 = _Many$0(state$0);
    expect(result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: [0, 1, 0, 1, 0, 2');
    final value$0 = result$0!.value;
    expect(value$0, [1, 1],
        reason: 'Testing \'result.value\' failed, input: [0, 1, 0, 1, 0, 2');
    expect(state$0.pos, 4,
        reason: 'Testing \'state.pos\' failed, input: [0, 1, 0, 1, 0, 2');
    final state$1 = State(Uint8List.fromList([]).buffer.asByteData());
    final result$1 = _Many$0(state$1);
    expect(result$1 != null, true,
        reason: 'Testing \'result != null\' failed, input: [');
    final value$1 = result$1!.value;
    expect(value$1, [], reason: 'Testing \'result.value\' failed, input: [');
    expect(state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: [');
    final state$2 =
        State(Uint8List.fromList([0, 0, 2, 0, 0, 0, 1, 0]).buffer.asByteData());
    final result$2 = _Many$0(state$2);
    expect(result$2 != null, true,
        reason:
            'Testing \'result != null\' failed, input: [0, 0, 2, 0, 0, 0, 1, 0');
    final value$2 = result$2!.value;
    expect(value$2, [],
        reason:
            'Testing \'result.value\' failed, input: [0, 0, 2, 0, 0, 0, 1, 0');
    expect(state$2.pos, 0,
        reason: 'Testing \'state.pos\' failed, input: [0, 0, 2, 0, 0, 0, 1, 0');
  });
}

void _test_UintBE$0() {
  // UintBE
  test('UintBE', () {
    final state$0 =
        State(Uint8List.fromList([0, 48, 0, 48]).buffer.asByteData());
    final result$0 = _UintBE$0(state$0);
    expect(result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: [0, 48, 0, 48');
    final value$0 = result$0!.value;
    expect(value$0, 48,
        reason: 'Testing \'result.value\' failed, input: [0, 48, 0, 48');
    expect(state$0.pos, 2,
        reason: 'Testing \'state.pos\' failed, input: [0, 48, 0, 48');
    final state$1 = State(Uint8List.fromList([]).buffer.asByteData());
    final result$1 = _UintBE$0(state$1);
    expect(result$1 == null, true,
        reason: 'Testing \'result == null\' failed, input: [');
    expect(state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: [');
    expect(state$1.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: [');
    expect(state$1.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: [');
    expect(state$1.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: [');
    final state$2 = State(Uint8List.fromList([0, 49]).buffer.asByteData());
    final result$2 = _UintBE$0(state$2);
    expect(result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: [0, 49');
    expect(state$2.pos, 0,
        reason: 'Testing \'state.pos\' failed, input: [0, 49');
    expect(state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: [0, 49');
    expect(state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: [0, 49');
    expect(state$2.errors[0], isA<ErrorExpectedInt>(),
        reason: 'Testing \'state.error\' failed, input: [0, 49');
    expect((state$2.errors[0] as ErrorExpectedInt).value, 0x30,
        reason: 'Testing \'ErrorExpectedInt.value\' failed, input: [0, 49');
  });
}

Result<int>? _$0(State<ByteData> state) {
  if (state.pos + 2 <= state.input.lengthInBytes) {
    final v = state.input.getUint16(state.pos);
    if (v == 1) {
      state.pos += 2;
      return const Result(1);
    }
    return state.fail(const ErrorExpectedInt(16, 1));
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<List<int>>? _Many$0(State<ByteData> state) {
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

Result<int>? _UintBE$0(State<ByteData> state) {
  if (state.pos + 2 <= state.input.lengthInBytes) {
    final v = state.input.getUint16(state.pos);
    if (v == 48) {
      state.pos += 2;
      return const Result(48);
    }
    return state.fail(const ErrorExpectedInt(16, 48));
  }
  return state.fail(const ErrorUnexpectedEof());
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
    if (const [8, 16, 32, 64].contains(size)) {
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
