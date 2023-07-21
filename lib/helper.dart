import 'dart:collection';
import 'dart:math';

import 'calculable.dart';
import 'parser_builder.dart';
import 'ranges.dart';

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

({String name, String size}) getCharReader(bool is16Bit, String name) {
  if (is16Bit) {
    return (name: 'codeUnitAt', size: '1');
  }

  return (name: 'runeAt', size: '$name < 0xffff ? 1 : 2');
}

(int, int) getUnicodeRange() {
  return const (0, 0x10ffff);
}

bool is16BitPredicate(Calculable<bool> predicate) {
  if (predicate is! InRange) {
    return false;
  }

  return !toRanges(predicate.ranges).any((e) => e.$1 > 0xffff || e.$2 > 0xffff);
}

List<((int, int), Set<T>)> makeTransitions<T>(Map<T, List<(int, int)>> map) {
  if (map.isEmpty) {
    return [];
  }

  if (map.values.any((e) => e.isEmpty)) {
    throw ArgumentError.value(
        map, 'map', 'Must not contain empty list of ranges');
  }

  _Transition<T> createTransition(int start, int end, Set<T> list) {
    return _ListEntry(((start, end), list));
  }

  bool intersect((int, int) r1, (int, int) r2) {
    return (r1.$1 <= r2.$1 && r1.$2 >= r2.$1) ||
        (r2.$1 <= r1.$1 && r2.$2 >= r1.$1);
  }

  final linkedList = LinkedList<_Transition<T>>();
  (_Transition<T>?, List<_Transition<T>>, _Transition<T>?) findTransitions(
      (int, int) range) {
    final list = <_Transition<T>>[];
    _Transition<T>? previous;
    _Transition<T>? next;
    for (final element in linkedList) {
      final r2 = element.value.$1;
      if (intersect(range, r2)) {
        list.add(element);
      } else if (r2.$1 > range.$2) {
        next = element;
        break;
      } else {
        previous = element;
      }
    }

    if (list.isNotEmpty) {
      previous = list.first.previous;
      next = list.last.next;
    }

    return (previous, list, next);
  }

  map = map.map((key, value) => MapEntry(key, normalizeRanges(value)));
  for (final key in map.keys) {
    final ranges = map[key]!;
    for (final range in ranges) {
      final found = findTransitions(range);
      final transitions = found.$2;
      final newTransitions = <_Transition<T>>[];
      var last = range.$1;
      for (final element in transitions) {
        final elementValue = element.value;
        final elementRange = elementValue.$1;
        final elementSet = elementValue.$2;
        if (last > elementRange.$1) {
          final end = min(range.$2, last - 1);
          final t = createTransition(elementRange.$1, end, {...elementSet});
          newTransitions.add(t);
          last = end + 1;
        } else if (last < elementRange.$1) {
          final end = min(range.$2, elementRange.$1 - 1);
          final t = createTransition(last, end, {key});
          newTransitions.add(t);
          last = end + 1;
        }

        final end = min(range.$2, elementRange.$2);
        final t = createTransition(last, end, {...elementSet, key});
        newTransitions.add(t);
        last = end + 1;
        if (last < elementRange.$2) {
          final t = createTransition(last, elementRange.$2, {...elementSet});
          newTransitions.add(t);
          last = elementRange.$2 + 1;
        }
      }

      if (last <= range.$2) {
        final t = createTransition(last, range.$2, {key});
        newTransitions.add(t);
      }

      final previous = found.$1;
      final next = found.$3;
      if (previous != null) {
        for (var i = newTransitions.length - 1; i >= 0; i--) {
          final t = newTransitions[i];
          previous.insertAfter(t);
        }
      } else {
        if (linkedList.isEmpty) {
          linkedList.addAll(newTransitions);
        } else if (next != null) {
          for (var i = newTransitions.length - 1; i >= 0; i--) {
            final t = newTransitions[i];
            next.insertBefore(t);
          }
        } else {
          linkedList.addAll(newTransitions);
        }
      }

      for (final element in transitions) {
        element.unlink();
      }
    }
  }

  return linkedList
      .map((e) => (
            e.value.$1,
            e.value.$2,
          ))
      .toList();
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
  final re = RegExp(r'@([_a-zA-Z][_a-zA-Z0-9]*)');
  var keys = re.allMatches(template).map((m) => m[1]!).toSet().toList();
  keys.sort();
  keys = keys.reversed.toList();
  var result = template;
  for (final key in keys) {
    if (values.containsKey(key)) {
      final value = values[key]!;
      result = result.replaceAll('@$key', value);
    }
  }

  return result;
}

BuildBodyResult renderBody<I, O>(
    ParserBuilder<I, O> parser,
    BuildContext context,
    bool hasResult,
    String template,
    String templateNoResult,
    Map<String, String> values,
    {List<(ParserBuilder<I, Object?>, bool?)>? parsers}) {
  parsers ??= parser.getCombinedParsers().toList();
  final allocator = context.localAllocator;
  final result = hasResult ? allocator.allocate() : 'unused';
  values = {...values};
  values['r'] = result;
  for (var i = 0; i < parsers.length; i++) {
    final k = i + 1;
    values['p$k'] = '';
    values['r$k'] = '';
    values['rv$k'] = '';
  }

  final re = RegExp(r'@([_a-zA-Z][_a-zA-Z0-9]*)');
  var source = hasResult ? template : templateNoResult;
  var keys = re.allMatches(source).map((m) => m[1]!).toSet().toList();
  for (final key in keys) {
    if (!values.containsKey(key)) {
      values[key] = allocator.allocate(key);
    }
  }

  for (var i = 0; i < parsers.length; i++) {
    final element = parsers[i];
    final parser = element.$1;
    final mode = element.$2 ?? hasResult;
    final r = parser.build(context, mode);
    final k = i + 1;
    values['p$k'] = r.source;
    values['r$k'] = r.result;
    values['rv$k'] = r.value;
  }

  keys.sort();
  keys = keys.reversed.toList();
  for (final key in keys) {
    final value = values[key]!;
    source = source.replaceAll('@$key', value);
  }

  return BuildBodyResult(
    result: result,
    source: source,
  );
}

String renderWithPlunge(
  int count,
  bool hasResult, {
  String? first,
  String? firstNoResult,
  String? last,
  String? lastNoResult,
  required String next,
  required String nextNoResult,
  required String Function(
    int index,
    String template,
    Map<String, String> values,
    String Function(int index) next,
  ) fillValues,
}) {
  String plunge(int index) {
    String? template;
    if (index == 0) {
      template = hasResult ? first : firstNoResult;
    }

    if (index == count - 1 && template == null) {
      template = hasResult ? last : lastNoResult;
    }

    if (index >= 0 && index <= count - 1) {
      template ??= hasResult ? next : nextNoResult;
    } else {
      throw RangeError.range(count, 0, count - 1);
    }

    final k = index + 1;
    final values = {
      'p1': '@p$k',
      'r1': '@r$k',
      'rv1': '@rv$k',
    };
    template = fillValues(index, template, values, plunge);
    return render(template, values);
  }

  return plunge(0);
}

List<(int, int)> toRanges(List<Object> ranges) {
  final result = <(int, int)>[];
  for (final element in ranges) {
    Never error() {
      throw ArgumentError.value(element, 'range', ' Invalid range');
    }

    int toInt(String value) {
      final runes = value.runes.toList();
      if (runes.length == 1) {
        return runes[0];
      }

      error();
    }

    final range = switch (element) {
      final int i => (i, i),
      final String i => (toInt(i), toInt(i)),
      final (String, String) i => (toInt(i.$1), toInt(i.$2)),
      final (String, int) i => (toInt(i.$1), i.$2),
      final (int, String) i => (i.$1, toInt(i.$2)),
      final (int, int) i => (i.$1, i.$2),
      _ => error(),
    };
    result.add(range);
  }

  return normalizeRanges(result);
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

typedef _Transition<T> = _ListEntry<((int, int), Set<T>)>;

final class _ListEntry<T> extends LinkedListEntry<_ListEntry<T>> {
  final T value;

  _ListEntry(this.value);
}
