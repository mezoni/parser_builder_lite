import 'build_context.dart';
import 'build_result.dart';
import 'helper.dart';

class FunctionBuilder {
  static const _template = '''
{{type}} {{name}}({{parameters}}) {
  {{body}}
}''';

  const FunctionBuilder();

  BuildResult build(
      BuildContext context,
      Object key,
      ({
        String body,
        String name,
        String parameters,
        String type,
      })
              Function()
          buildBody) {
    final cache = context.initializeCache(
        'parser_builder_lite.parser_builder.function_builder',
        <Object?, BuildResult>{});
    final found = cache[key];
    if (found != null) {
      return found;
    }

    final x = buildBody();
    final source = render(_template, {
      'body': x.body,
      'name': x.name,
      'parameters': x.parameters,
      'type': x.type,
    });
    final result = BuildResult(name: x.name, source: source);
    cache[key] = result;
    context.output.writeln(source);
    return result;
  }
}
