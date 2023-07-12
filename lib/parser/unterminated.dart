import '../calculable.dart';
import '../expr.dart';
import '../parser_builder.dart';
import 'handle_error.dart';

class Unterminated<I, O> extends ParserBuilder<I, O> {
  final Calculable<Object?> handle;

  final ParserBuilder<I, O> p;

  const Unterminated(this.p, this.handle);

  @override
  String buildBody(BuildContext context) {
    final handle2 = handle.calculate(context, ['{{0}}', '{{1}}']);
    return HandleError(
      p,
      Expr('{{0}} == {{1}} ? (false, null) : (false, $handle2)'),
    ).buildBody(context);
  }
}
