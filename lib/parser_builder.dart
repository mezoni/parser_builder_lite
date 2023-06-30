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
  const FunctionBuilder();

  String? get name => null;

  BuildResult build(BuildContext context) {
    final cache = context.initializeCache(
        'parser_builder_lite.parser_builder.function_builder',
        <Object?, BuildResult>{});
    final found = cache[this];
    if (found != null) {
      return found;
    }

    final name = this.name ?? context.allocator.allocate();
    final source = getSource(context);
    final code = helper.render('{{R}} {{name}}{{source}}', {
      'R': '$R',
      'name': name,
      'source': source,
    });
    context.output.writeln(code);
    context.output.writeln();
    final result = BuildResult(name: name, source: code);
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
  Map<String, String> getValues(BuildContext context) =>
      parser.getValues(context);
}

abstract class ParserBuilder<I, O> extends FunctionBuilder<Result<O>?> {
  const ParserBuilder();

  @override
  String getSource(BuildContext context) {
    final values = getValues(context);
    final template = getTemplate(context);
    final source = helper.render(template, values);
    return '(State<$I> state) { $source }';
  }

  String getTemplate(BuildContext context);

  Map<String, String> getValues(BuildContext context) => const {};
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
}

class Result<T> {}
