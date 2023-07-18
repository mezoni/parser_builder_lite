import '../calculable.dart';
import '../expr.dart';
import '../parser_builder.dart';
import 'handle_error.dart';

class ReplaceErrors<I, O> extends ParserBuilder<I, O> {
  final Calculable<Object?> handle;

  final ParserBuilder<I, O> p;

  const ReplaceErrors(this.p, this.handle);

  @override
  String buildBody(BuildContext context) {
    checkIsNotOptional(context, p);
    final handle2 = handle.calculate(context, ['{{0}}', '{{1}}']);
    return HandleError(
      p,
      Expr('(true, $handle2)'),
    ).buildBody(context);
  }
}
