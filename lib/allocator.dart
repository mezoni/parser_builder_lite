class Allocator {
  final Map<String, int> _names = {};

  final String prefix;

  Allocator(this.prefix);

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
