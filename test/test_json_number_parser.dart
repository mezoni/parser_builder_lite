void main() {
  const s = '100000.00123e3';
  final x = double.parse(s);
  print(s);
  print(x);
  final r = parse(s);
  print(r);
}

num parse(String input) {
  final state = State(input);
  final result = number(state);
  if (!state.ok) {
    final message = _errorMessage(input, state.pos, state.getErrors());
    throw FormatException('\n$message');
  }
  return result!;
}

Object? _ws(State<String> state) {
  Object? $0;
  final input$0 = state.input;
  while (state.pos < input$0.length) {
    final c = input$0.runeAt(state.pos);
    final v = c == 0x9 || c == 0xa || c == 0xd || c == 0x20;
    if (!v) {
      break;
    }
    state.pos += c < 0xffff ? 1 : 2;
  }
  state.ok = true;
  return $0;
}

num? number(State<String> state) {
  num? $0;
  final pos$0 = state.pos;
  _ws(state);
  if (state.ok) {
    num? $2;
    final pos$1 = state.pos;
    num? $3;
    {
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
      state.ok = v != null;
      if (state.ok) {
        $3 = v;
      } else {
        final failPos = state.pos;
        state.pos = start;
        state.failAt(failPos, const ErrorUnexpectedChar());
      }
    }
    if (state.ok) {
      _ws(state);
      if (state.ok) {
        $2 = $3;
      } else {
        state.pos = pos$1;
      }
    }
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

String _errorMessage(String input, int offset, List<ParseError> errors) {
  final sb = StringBuffer();
  final errorList = errors.toList();
  if (offset >= input.length) {
    errorList.add(const ErrorUnexpectedEof());
    errorList.removeWhere((e) => e is ErrorUnexpectedChar);
  }

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
