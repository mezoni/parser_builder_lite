import '../calculable.dart';
import '../expr.dart';
import '../parser_builder.dart';
import 'handle_error.dart';

class Unterminated<I, O> extends ParserBuilder<I, O> {
  final Calculable<Object?> handle;

  final ParserBuilder<I, O> p;

  const Unterminated(this.p, this.handle);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    final errors = handle.calculate(context, ['{{0}}', '{{1}}']);
    return HandleError(
      p,
      Expr('{{0}} == {{1}} ? const (false, null) : (false, $errors)'),
    ).buildBody(context, hasResult);
  }

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return [(p, null)];
  }
}
