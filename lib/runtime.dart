const errorMessageTemplate = r'''
// ignore: unused_element
String _errorMessage(String source, List<ParseError> errors) {
  final sb = StringBuffer();
  final maxOffset = errors.map((e) => e.offset).reduce((v, e) => v > e ? v : e);
  final newErrors = errors.where((e) => e.offset == maxOffset).toSet().toList();
  final mapByStart = <int, List<ParseError>>{};
  for (final error in newErrors) {
    final start = error.start ?? maxOffset;
    (mapByStart[start] ??= []).add(error);
  }

  final expectedTags = newErrors.whereType<ErrorExpectedTags>();
  if (expectedTags.isNotEmpty) {
    final map = <int, Set<String>>{};
    newErrors.removeWhere((e) => e is ErrorExpectedTags);
    for (final error in expectedTags) {
      final start = error.start ?? maxOffset;
      (map[start] ??= {}).addAll(error.tags);
    }

    for (final start in map.keys) {
      final tags = map[start]!;
      final error = ErrorExpectedTags(maxOffset, tags.toList());
      error.start = start;
      newErrors.add(error);
    }
  }

  for (var i = 0; i < newErrors.length; i++) {
    if (sb.isNotEmpty) {
      sb.writeln();
      sb.writeln();
    }

    final error = newErrors[i];
    final end = error.offset;
    final start = error.start ?? end;
    RangeError.checkValidRange(start, end, source.length);
    var row = 1;
    var lineStart = 0, next = 0, pos = 0;
    while (pos < source.length) {
      final c = source.codeUnitAt(pos++);
      if (c == 0xa || c == 0xd) {
        next = c == 0xa ? 0xd : 0xa;
        if (pos < source.length && source.codeUnitAt(pos) == next) {
          pos++;
        }

        if (pos - 1 >= start) {
          break;
        }

        row++;
        lineStart = pos;
      }
    }

    int max(int x, int y) => x > y ? x : y;
    int min(int x, int y) => x < y ? x : y;
    final sourceLen = source.length;
    final lineLimit = min(80, sourceLen);
    final start2 = start;
    final end2 = min(start2 + lineLimit, end);
    final errorLen = end2 - start;
    final extraLen = lineLimit - errorLen;
    final rightLen = min(sourceLen - end2, extraLen - (extraLen >> 1));
    final leftLen = min(start, max(0, lineLimit - errorLen - rightLen));
    final list = <int>[];
    final iterator = RuneIterator.at(source, start2);
    for (var i = 0; i < leftLen; i++) {
      if (!iterator.movePrevious()) {
        break;
      }

      list.add(iterator.current);
    }

    final column = start - lineStart + 1;
    final left = String.fromCharCodes(list.reversed);
    final end3 = min(sourceLen, start2 + (lineLimit - leftLen));
    final indicatorLen = max(1, errorLen);
    final right = source.substring(start2, end3);
    var text = left + right;
    text = text.replaceAll('\n', ' ');
    text = text.replaceAll('\r', ' ');
    text = text.replaceAll('\t', ' ');
    sb.writeln('line $row, column $column: $error');
    sb.writeln(text);
    sb.write(' ' * leftLen + '^' * indicatorLen);
  }

  return sb.toString();
}

''';

const runtimeTemplate = r'''
class ErrorExpectedChar extends ParseError {
  final int char;

  ErrorExpectedChar(super.offset, this.char);

  @override
  int get hashCode => super.hashCode ^ char.hashCode;

  @override
  bool operator ==(other) {
    return other is ErrorExpectedChar && other.char == char && super == other;
  }

  @override
  String toString() {
    final value = escape(char);
    return 'Expected character $value';
  }
}

class ErrorExpectedEof extends ParseError {
  ErrorExpectedEof(super.offset);

  @override
  // ignore: hash_and_equals
  bool operator ==(other) {
    return other is ErrorExpectedEof && super == other;
  }

  @override
  String toString() {
    return 'Expected end of file';
  }
}

class ErrorExpectedTags extends ParseError {
  final List<String> tags;

  ErrorExpectedTags(super.offset, this.tags);

  @override
  int get hashCode {
    var result = super.hashCode;
    for (var i = 0; i < tags.length; i++) {
      final tag = tags[i];
      result ^= tag.hashCode;
    }

    return result;
  }

  @override
  bool operator ==(other) {
    if (other is ErrorExpectedTags) {
      final otherTags = other.tags;
      if (otherTags.length == tags.length) {
        for (var i = 0; i < tags.length; i++) {
          final tag = tags[i];
          final otherTag = otherTags[i];
          if (tag != otherTag) {
            return false;
          }
        }
      }

      return super == other;
    }

    return false;
  }

  @override
  String toString() {
    final value = tags.map(escape).join(', ');
    return 'Expected $value';
  }
}

class ErrorMessage extends ParseError {
  final String message;

  ErrorMessage(super.offset, this.message);

  @override
  int get hashCode => super.hashCode ^ message.hashCode;

  @override
  bool operator ==(other) {
    return other is ErrorMessage && other.message == message && super == other;
  }

  @override
  String toString() {
    return message;
  }
}

class ErrorUnexpectedChar extends ParseError {
  final String source;

  ErrorUnexpectedChar(super.offset, this.source);

  @override
  int get hashCode => super.hashCode ^ source.hashCode;

  @override
  bool operator ==(other) {
    return other is ErrorUnexpectedChar &&
        other.source == source &&
        super == other;
  }

  @override
  String toString() {
    final char = source.runeAt(offset);
    final value = escape(char);
    return 'Unexpected character $value';
  }
}

class ErrorUnexpectedEof extends ParseError {
  ErrorUnexpectedEof(super.offset);

  @override
  // ignore: hash_and_equals
  bool operator ==(other) {
    return other is ErrorUnexpectedEof && super == other;
  }

  @override
  String toString() {
    return 'Unexpected end of file';
  }
}

class ErrorUnexpectedInput extends ParseError {
  ErrorUnexpectedInput(super.offset);

  @override
  // ignore: hash_and_equals
  bool operator ==(other) {
    return other is ErrorUnexpectedInput && super == other;
  }

  @override
  String toString() {
    return 'Unexpected input';
  }
}

abstract class ParseError {
  int offset;

  int? start;

  ParseError(this.offset);

  @override
  int get hashCode => offset.hashCode ^ start.hashCode;

  @override
  bool operator ==(Object? other) {
    return other is ParseError &&
        other.offset == offset &&
        other.start == start;
  }

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
}

class Result<T> {
  final T value;

  const Result(this.value);

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

  Result<R>? fail<R>(ParseError error) {
    final offset = error.offset;
    if (offset < failPos) {
      return null;
    }

    if (failPos < offset) {
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

''';
