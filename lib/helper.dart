String buildConditional(Map<String, String> branches) {
  if (branches.isEmpty) {
    throw ArgumentError.value(branches, 'branches', 'Must not be empty');
  }

  final conditions = branches.keys.toList();
  if (conditions.length == 1 && conditions.last.trim().isEmpty) {
    return branches[conditions.first]!;
  }

  final list = <String>[];
  String? elseBranch;
  for (var i = 0; i < conditions.length; i++) {
    final condition = conditions[i];
    final body = branches[condition]!;
    if (condition.trim().isEmpty) {
      if (i != conditions.length - 1) {
        throw ArgumentError(
            'A branch without a condition must be the last branch');
      }

      if (conditions.length < 2) {
        throw ArgumentError(
            'A conditional with an empty condition must contain at least 2 branches');
      }

      elseBranch = body;
      continue;
    }

    final sb = StringBuffer();
    sb.writeln('($condition) {');
    sb.writeln(body);
    sb.write('}');
    list.add(sb.toString());
  }

  final sb = StringBuffer();
  sb.write('if ');
  sb.write(list.join(' else if '));
  if (elseBranch != null) {
    sb.writeln(' else {');
    sb.writeln(elseBranch);
    sb.write('}');
  }

  return sb.toString();
}

void checkRange((int, int) range) {
  if (range.$1 > range.$2) {
    throw RangeError.range(range.$2, range.$1, null);
  }
}

String escapeString(String text, [bool quote = true]) {
  text = text.replaceAll('\\', r'\\');
  text = text.replaceAll('\b', r'\b');
  text = text.replaceAll('\f', r'\f');
  text = text.replaceAll('\n', r'\n');
  text = text.replaceAll('\r', r'\r');
  text = text.replaceAll('\t', r'\t');
  text = text.replaceAll('\v', r'\v');
  text = text.replaceAll('\'', '\\\'');
  text = text.replaceAll('\$', r'\$');
  if (!quote) {
    return text;
  }

  return '\'$text\'';
}

String getAsCode(Object? value) {
  final result = tryGetAsCode(value);
  if (result != null) {
    return result;
  }

  throw StateError('Unsupported type: ${value.runtimeType}');
}

(int, int) getUnicodeRange() {
  return const (0, 0x10ffff);
}

List<(int, int)> normalizeRanges(List<(int, int)> ranges) {
  final result = <(int, int)>[];
  final temp = ranges.toList();
  temp.sort(
    (a, b) {
      if (a.$1 > b.$1) {
        return 1;
      } else if (a.$1 < b.$1) {
        return -1;
      } else {
        return a.$2 - b.$2;
      }
    },
  );
  for (var i = 0; i < temp.length; i++) {
    var range = temp[i];
    result.add(range);
    checkRange(range);
    var k = i + 1;
    for (; k < temp.length; k++) {
      final next = temp[k];
      checkRange(next);
      if (next.$1 <= range.$2 + 1) {
        range = (range.$1, range.$2 > next.$2 ? range.$2 : next.$2);
        result.last = range;
      } else {
        k--;
        break;
      }
    }

    i = k;
  }

  return result;
}

String render(String template, Map<String, String> values) {
  var result = template;
  for (var key in values.keys) {
    final value = values[key]!;
    result = result.replaceAll('{{$key}}', value);
  }

  return result;
}

String? tryGetAsCode(Object? value) {
  if (value is String) {
    final escaped = escapeString(value);
    return escaped;
  } else if (value is bool) {
    return '$value';
  } else if (value is num) {
    return '$value';
  } else if (value == null) {
    return '$value';
  } else if (value is Enum) {
    return '${value.runtimeType}.${value.name}';
  } else if (value is List<(int, int)>) {
    final values = <Object?>[];
    for (var item in value) {
      final start = tryGetAsCode(item.$1);
      final end = tryGetAsCode(item.$2);
      values.add(start);
      values.add(end);
    }

    return '[${values.join(', ')}]';
  } else if (value is List) {
    final values = <Object?>[];
    for (var item in value) {
      final code = tryGetAsCode(item);
      values.add(code);
    }

    return '[${values.join(', ')}]';
  } else if (value is Set) {
    final values = <Object?>[];
    for (var item in value) {
      final code = tryGetAsCode(item);
      values.add(code);
    }

    return '{${values.join(', ')}}';
  } else if (value is Map) {
    final values = <Object?>[];
    for (var key in value.keys) {
      final k = tryGetAsCode(key);
      final v = tryGetAsCode(value[key]);
      values.add('$k: $v');
    }

    return '{${values.join(', ')}}';
  } else if (value is Type) {
    final result = '$Type';
    if (result.endsWith(')')) {
      if (!result.contains(',')) {
        //
      }
    }
  }
  return null;
}
