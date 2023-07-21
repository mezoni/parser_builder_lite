import 'build_context.dart';
import 'helper.dart';

class BuildFunctionResult {
  final String name;

  final String source;

  BuildFunctionResult({
    required this.name,
    required this.source,
  });
}

class FunctionBuilder {
  static const _template = '''
@type @name(@parameters) {
  @body
}''';

  const FunctionBuilder();

  BuildFunctionResult build(
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
        <Object?, BuildFunctionResult>{});
    final found = cache[key];
    if (found != null) {
      return found;
    }

    final body = buildBody();
    final source = render(_template, {
      'body': body.body,
      'name': body.name,
      'parameters': body.parameters,
      'type': body.type,
    });
    final result = BuildFunctionResult(name: body.name, source: source);
    cache[key] = result;
    context.globalOutput.writeln(source);
    return result;
  }
}
