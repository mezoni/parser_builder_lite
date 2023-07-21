import '../helper.dart';
import '../parser_builder.dart';

class Ref<I, O> extends ParserBuilder<I, O> {
  static const _template = '''
@r = @name(state);''';

  static const _templateNoResult = '''
@name(state);''';

  @override
  final String name;

  const Ref(this.name);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    return renderBody(
      this,
      context,
      hasResult,
      _template,
      _templateNoResult,
      {'name': name},
    );
  }
}
