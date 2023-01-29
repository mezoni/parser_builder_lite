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
  }

  return null;
}
