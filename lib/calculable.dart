import 'build_context.dart';

/// The [Calculable] is the main class for declaring calculable expressions.
abstract interface class Calculable<T> {
  /// Returns the result (as the source code) of the calculable expression,
  /// given the arguments passed.
  String calculate(BuildContext context, List<String> arguments);
}
