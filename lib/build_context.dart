import 'allocator.dart';

class BuildContext {
  final Allocator allocator;

  final Map<String, Object?> cache = {};

  final StringSink output;

  BuildContext({
    required this.allocator,
    required this.output,
  });

  T initializeCache<T>(String key, T value) {
    final result = cache[key];
    if (result is T) {
      return result;
    }

    cache[key] = value;
    return value;
  }
}
