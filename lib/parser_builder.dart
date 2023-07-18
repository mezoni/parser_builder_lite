import 'build_context.dart';
import 'build_result.dart';
import 'function_builder.dart';

export 'build_context.dart';

/// The [ParserBuilder] is the main class for declaring parser builders.
abstract class ParserBuilder<I, O> {
  const ParserBuilder();

  /// Returns the name of the parser.
  String? get name => null;

  /// Builds a parser and returns the build result.
  BuildResult build(BuildContext context) {
    return const FunctionBuilder().build(context, this, () {
      final name = this.name ?? context.allocator.allocate();
      final body = buildBody(context);
      return (
        body: body,
        name: name,
        parameters: 'State<$I> state',
        type: 'Result<$O>?',
      );
    });
  }

  /// Builds a parser function body and returns the source code of the function
  /// body.
  String buildBody(BuildContext context);

  void checkIsNotOptional(BuildContext context, ParserBuilder<I, Object?> p) {
    if (p.getIsOptional(context)) {
      throw ArgumentError.value(p, 'p', 'Must not be optional');
    }
  }

  /// Returns `true` if the generated parser is optional; otherwise returns
  /// `false`.
  bool getIsOptional(BuildContext context) {
    return false;
  }

  /// Returns a textual representation of the parser result type.
  String getResultType() {
    final name = '$O';
    final isNullable = isNullableResultType();
    final result = isNullable ? name : '$name?';
    return result;
  }

  /// Returns the starting characters of the parser.
  List<(int, int)> getStartCharacters(BuildContext context) {
    final parser = getStartParser(context);
    if (parser == null) {
      return const [];
    }

    return parser.getStartCharacters(context);
  }

  /// Returns the starting errors of the parser.
  List<String> getStartErrors(BuildContext context) {
    final parser = getStartParser(context);
    if (parser == null) {
      return const [];
    }

    return parser.getStartErrors(context);
  }

  /// Returns the starting parser of the parser.
  ParserBuilder<I, Object?>? getStartParser(BuildContext context) {
    return null;
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
    return '$runtimeType';
  }
}
