import 'allocator.dart';

/// The [BuildContext] is the context for building parsers.
class BuildContext {
  // A global name allocator.
  final Allocator allocator;

  final Map<String, Object?> cache = {};

  /// A global output.
  final StringSink output;

  BuildContext({
    required this.allocator,
    required this.output,
  });

  /// Initializes the cache if it has not been initialized and returns the
  /// initial [value] or an already existing value.
  T initializeCache<T>(String key, T value) {
    final result = cache[key];
    if (result is T) {
      return result;
    }

    cache[key] = value;
    return value;
  }
}
