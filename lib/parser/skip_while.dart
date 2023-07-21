import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';
import 'take_while.dart';

class SkipWhile extends ParserBuilder<String, Object?> {
  final Calculable<bool> predicate;

  const SkipWhile(this.predicate);

  @override
  bool get isOptional => true;

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    return renderBody(
      this,
      context,
      hasResult,
      '@p1',
      '@p1',
      const {},
      parsers: [(TakeWhile(predicate), false)],
    );
  }
}
