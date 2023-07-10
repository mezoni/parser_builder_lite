import 'build_context.dart';
import 'build_result.dart';
import 'helper.dart';

class FunctionBuilder {
  static const _template = '''
{{type}} {{name}}({{parameters}}) {
  {{body}}
}''';

  const FunctionBuilder();

  BuildResult build(BuildContext context, Object key, String type, String name,
      String parameters, String body) {
    final cache = context.initializeCache(
        'parser_builder_lite.parser_builder.function_builder',
        <Object?, BuildResult>{});
    final found = cache[key];
    if (found != null) {
      return found;
    }

    final source = render(_template, {
      'body': body,
      'name': name,
      'parameters': parameters,
      'type': type,
    });
    final result = BuildResult(name: name, source: source);
    cache[key] = result;
    context.output.writeln(source);
    return result;
  }
}
