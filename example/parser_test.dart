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
