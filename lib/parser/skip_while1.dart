import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';
import 'take_while1.dart';

class SkipWhile1 extends ParserBuilder<String, String> {
  static const _template = '''
@p1
if (state.ok) {
  @r = '';
}''';

  static const _templateNoResult = '''
@p1''';

  final Calculable<bool> predicate;

  const SkipWhile1(this.predicate);

  @override
  bool get isOptional => true;

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    return renderBody(
      this,
      context,
      hasResult,
      _template,
      _templateNoResult,
      const {},
      parsers: [(TakeWhile1(predicate), false)],
    );
  }
}
