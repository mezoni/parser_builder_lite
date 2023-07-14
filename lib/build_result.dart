/// The [BuildResult] is the result of building the function.
/// Consists of the function [name] and the [source] code of the function body.
class BuildResult {
  /// The name of function.
  String name;

  /// The source code of function.
  String source;

  BuildResult({
    required this.name,
    required this.source,
  });
}
