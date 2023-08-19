import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';
import '../parser_mixins.dart';
import 'take_while1.dart';

class SkipWhile1 extends ParserBuilder<String, String>
    with SatisfyMixin<String> {
  @override
  final Calculable<bool> predicate;

  const SkipWhile1(this.predicate);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    return renderBody(
      this,
      context,
      hasResult,
      '@p1',
      '@p1',
      const {},
      parsers: [(TakeWhile1(predicate), false)],
    );
  }
}
