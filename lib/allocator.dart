class Allocator {
  final Map<String, int> _names = {};

  final String prefix;

  Allocator(this.prefix) {
    if (prefix.isEmpty) {
      throw ArgumentError.value(prefix, 'prefix', 'Must not be empty');
    }
  }

  String allocate([String name = '']) {
    var id = _names[name];
    id ??= 0;
    final result = '$prefix$name\$$id';
    _names[name] = id + 1;
    return result;
  }

  Allocator clone() {
    return Allocator(prefix);
  }
}
