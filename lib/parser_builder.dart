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

class Func<R> extends FunctionBuilder<R> {
  final String source;

  const Func(this.source);

  @override
  int get hashCode => R.hashCode ^ source.hashCode;

  @override
  bool operator ==(other) {
    return other is Func<R> && source == other.source;
  }

  @override
  String getSource(BuildContext context) => source;
}

abstract class FunctionBuilder<R> {
  static const _template = '''
{{R}} {{name}}{{source}}''';

  const FunctionBuilder();

  BuildResult build(BuildContext context) {
    final cache = context.initializeCache(
        'parser_builder_lite.parser_builder.function_builder',
        <Object?, BuildResult>{});
    final found = cache[this];
    if (found != null) {
      return found;
    }

    final name = context.allocator.allocate();
    final source = getSource(context);
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

  String getSource(BuildContext context);
}

class Named<I, O> extends ParserBuilder<I, O> {
  @override
  final String name;

  final ParserBuilder<I, O> parser;

  const Named(this.name, this.parser);

  @override
  String getTemplate(BuildContext context) => parser.getTemplate(context);

  @override
  Map<String, Object?> getValues(BuildContext context) =>
      parser.getValues(context);
}

abstract class ParserBuilder<I, O> {
  static const _template = '''
Result<{{O}}>? {{name}}(State<{{I}}> state) {
{{body}}
}''';

  const ParserBuilder();

  String? get name => null;

  BuildResult build(BuildContext context) {
    final cache = context.initializeCache(
        'parser_builder_lite.parser_builder.parser_builder.parsers',
        <String, String>{});
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
    final values = getValues(context);
    final newValues = <String, String>{};
    for (var key in values.keys) {
      String? newValue;
      final value = values[key];
      if (value is ParserBuilder) {
        final result = value.build(context);
        newValue = '${result.name}(state)';
      } else if (value is FunctionBuilder) {
        final result = value.build(context);
        newValue = result.name;
      } else {
        newValue = '$value';
      }

      newValues[key] = newValue;
    }

    final template = getTemplate(context);
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

  String getTemplate(BuildContext context);

  Map<String, Object?> getValues(BuildContext context) => const {};
}

class Ref<I, O> extends ParserBuilder<I, O> {
  @override
  final String name;

  const Ref(this.name);

  @override
  BuildResult build(BuildContext context) {
    return BuildResult(name: name, source: '');
  }

  @override
  String getTemplate(BuildContext context) => name;

  @override
  Map<String, Object?> getValues(BuildContext context) => const {};
}
