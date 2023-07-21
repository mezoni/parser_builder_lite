import 'build_context.dart';
import 'build_result.dart';

export 'build_context.dart';

class BuildBodyResult {
  final String result;

  final String source;

  BuildBodyResult({
    required this.result,
    required this.source,
  });
}

/// The [ParserBuilder] is the main class for declaring parser builders.
abstract class ParserBuilder<I, O> {
  const ParserBuilder();

  /// Returns `true` if the generated parser is optional; otherwise returns
  /// `false`.
  bool get isOptional {
    final parsers = getCombinedParsers().map((e) => e.$1);
    if (parsers.isEmpty) {
      return false;
    }

    if (!isSequential) {
      return parsers.any((e) => e.isOptional);
    }

    return !parsers.any((e) => !e.isOptional);
  }

  bool get isSequential {
    return true;
  }

  /// Returns the name of the parser.
  String? get name => null;

  /// Builds a parser and returns the build result.
  BuildResult build(BuildContext context, bool hasResult) {
    final body = buildBody(context, hasResult);
    final result = body.result;
    final buffer = StringBuffer();
    if (hasResult) {
      final type = getResultType();
      buffer.writeln('$type $result;');
    }

    buffer.write(body.source);
    var value = result;
    if (!isNullableResultType()) {
      value = '$value!';
    }
    return BuildResult(
      result: result,
      source: buffer.toString(),
      value: value,
    );
  }

  /// Builds a parser function body and returns the source code of the function
  /// body.
  BuildBodyResult buildBody(BuildContext context, bool hasResult);

  void checkIsNotOptional(ParserBuilder<I, Object?> p) {
    if (p.isOptional) {
      throw ArgumentError.value(p, 'p', 'Must not be optional');
    }
  }

  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return const [];
  }

  /// Returns a textual representation of the parser result type.
  String getResultType() {
    final name = '$O';
    final isNullable = isNullableResultType();
    final result = isNullable ? name : '$name?';
    return result;
  }

  /// Returns the starting characters of the parser.
  Iterable<(int, int)> getStartingCharacters() {
    return _getStartingElements((e) => e.getStartingCharacters());
  }

  /// Returns the starting errors of the parser.
  Iterable<String> getStartingErrors() {
    return _getStartingElements((e) => e.getStartingErrors());
  }

  /// Returns `true` if the parser result type is nullable; otherwise returns
  /// `false`.
  bool isNullableResultType() {
    final result = isNullableType<O>();
    return result;
  }

  /// Returns `true` if type [T] is nullable; otherwise returns `false`.
  bool isNullableType<T>() {
    try {
      // ignore: unused_local_variable
      final T val = null as T;
    } catch (e) {
      return false;
    }

    return true;
  }

  @override
  String toString() {
    final parsers = getCombinedParsers();
    return '$runtimeType(${parsers.join(', ')})';
  }

  Iterable<T> _getStartingElements<T>(
      Iterable<T> Function(ParserBuilder<I, Object?> parser) getElements) {
    final parsers = getCombinedParsers().map((e) => e.$1);
    if (parsers.isEmpty) {
      return const [];
    }

    if (!isSequential) {
      final result = <T>[];
      for (final parser in parsers) {
        final values = getElements(parser);
        if (values.isEmpty || parser.isOptional) {
          return const [];
        }

        result.addAll(values);
      }

      return result;
    }

    final parser = parsers.first;
    if (!parser.isOptional) {
      final values = getElements(parser);
      if (values.isNotEmpty) {
        return values;
      }
    }

    return const [];
  }
}
