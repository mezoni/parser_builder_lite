import '../build_result.dart';
import '../parser_builder.dart';

class Ref<I, O> extends ParserBuilder<I, O> {
  @override
  final String name;

  const Ref(this.name);

  @override
  BuildResult build(BuildContext context) {
    return BuildResult(name: name, source: '$name(state)');
  }

  @override
  String buildBody(BuildContext context) {
    return 'throw UnimplementedError();';
  }
}
