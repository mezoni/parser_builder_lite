import 'helper.dart' as helper;

class Allocator {
  int _id = 0;

  final String prefix;

  Allocator(this.prefix);

  String allocate() {
    return '$prefix${_id++}';
  }
}

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

class BuildResult {
  String name;

  String source;

  BuildResult({
    required this.name,
    required this.source,
  });
}

class Func<R> {
  static const _template = '''
{{R}} {{name}}{{source}}''';

  final String source;

  const Func(this.source);

  @override
  int get hashCode => R.hashCode ^ source.hashCode;

  @override
  bool operator ==(other) {
    return other is Func<R> && source == other.source;
  }

  BuildResult build(BuildContext context) {
    final cache = context
        .initializeCache('parser_builder_lite.func', <Object?, BuildResult>{});
    final found = cache[this];
    if (found != null) {
      return found;
    }

    final name = context.allocator.allocate();
    final newSource = helper.render(_template, {
      'R': '$R',
      'name': name,
      'source': source,
    });
    context.output.writeln(newSource);
    context.output.writeln();
    final result = BuildResult(name: name, source: newSource);
    cache[this] = result;
    return result;
  }
}

class Named<I, O> extends ParserBuilder<I, O> {
  @override
  final String name;

  final ParserBuilder<I, O> parser;

  const Named(this.name, this.parser);

  @override
  String get template => parser.template;

  @override
  Map<String, Object?> get values => parser.values;
}

abstract class ParserBuilder<I, O> {
  static const _template = '''
Result<{{O}}>? {{name}}(State<{{I}}> state) {
{{body}}
}''';

  const ParserBuilder();

  String? get name => null;

  String get template;

  Map<String, Object?> get values => const {};

  BuildResult build(BuildContext context) {
    final cache = context
        .initializeCache('parser_builder_lite.parsers', <String, String>{});
    var name = this.name;
    if (name != null) {
      final source = cache[name];
      if (source != null) {
        return BuildResult(
          name: name,
          source: source,
        );
      }
    }

    name ??= context.allocator.allocate();
    final values = this.values;
    final newValues = <String, String>{};
    for (var key in values.keys) {
      String? newValue;
      final value = values[key];
      if (value is ParserBuilder) {
        final result = value.build(context);
        newValue = '${result.name}(state)';
      } else if (value is Func) {
        final result = value.build(context);
        newValue = result.name;
      } else {
        newValue = '$value';
      }

      newValues[key] = newValue;
    }

    final body = helper.render(template, newValues);
    final source = helper.render(_template, {
      'I': '$I',
      'O': '$O',
      'body': body,
      'name': name,
    });

    context.output.writeln(source);
    context.output.writeln();
    cache[name] = source;
    return BuildResult(name: name, source: source);
  }
}

class Ref<I, O> extends ParserBuilder<I, O> {
  @override
  final String name;

  const Ref(this.name);

  @override
  String get template => name;

  @override
  Map<String, Object?> get values => const {};

  @override
  BuildResult build(BuildContext context) {
    return BuildResult(name: name, source: '');
  }
}
