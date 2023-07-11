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
}

void _test_Many$0() {
  // Many
  test('Many', () {
    final state$0 = State('1112');
    final result$0 = _Many$0(state$0);
    expect(result$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'1112\'');
    final value$0 = result$0!.value;
    expect(value$0, [49, 49, 49],
        reason: 'Testing \'result.value\' failed, source: \'1112\'');
    expect(state$0.pos, 3,
        reason: 'Testing \'state.pos\' failed, source: \'1112\'');
    final state$1 = State('');
    final result$1 = _Many$0(state$1);
    expect(result$1 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'\'');
    final value$1 = result$1!.value;
    expect(value$1, [],
        reason: 'Testing \'result.value\' failed, source: \'\'');
    expect(state$1.pos, 0,
        reason: 'Testing \'state.pos\' failed, source: \'\'');
    final state$2 = State('2');
    final result$2 = _Many$0(state$2);
    expect(result$2 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'2\'');
    final value$2 = result$2!.value;
    expect(value$2, [],
        reason: 'Testing \'result.value\' failed, source: \'2\'');
    expect(state$2.pos, 0,
        reason: 'Testing \'state.pos\' failed, source: \'2\'');
  });
}

Result<int>? _$0(State<String> state) {
  if (state.pos < state.source.length) {
    final c = state.source.codeUnitAt(state.pos);
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
  @override
  final int length;

  const ErrorUnexpectedInput(this.length);

  @override
  String getMessage({
    required int offset,
    required Object source,
  }) {
    return 'Unexpected input';
  }
}

class ErrorUnknown extends ParseError {
  const ErrorUnknown();

  @override
  String getMessage({
    required int offset,
    required Object source,
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

  int failPos = 0;

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
