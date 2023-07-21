import 'allocator.dart';

/// The [BuildContext] is the context for building parsers.
class BuildContext {
  final Map<String, Object?> cache = {};

  // A global name allocator.
  final Allocator globalAllocator;

  /// A global output.
  final StringSink globalOutput;

  // A local name allocator.
  Allocator localAllocator;

  BuildContext({
    required this.globalAllocator,
    required this.globalOutput,
    required this.localAllocator,
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
