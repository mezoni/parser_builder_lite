/// The [BuildResult] is the result of building the function.
/// Consists of the function [name] and the [source] code of the function body.
class BuildResult {
  /// The name of result variable.
  String result;

  /// The source code of function.
  String source;

  /// An expression to access the null-checked result value.
  String value;

  BuildResult({
    required this.result,
    required this.source,
    required this.value,
  });
}
