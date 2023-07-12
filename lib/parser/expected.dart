import '../expr.dart';
import '../helper.dart';
import '../parser_builder.dart';
import 'handle_error.dart';

class Expected<I, O> extends ParserBuilder<I, O> {
  final String tag;

  final ParserBuilder<I, O> p;

  const Expected(this.tag, this.p);

  @override
  String buildBody(BuildContext context) {
    final text = escapeString(tag);
    return HandleError(
            p,
            Expr(
                '{{0}} != {{1}} ? (false, null) : (true, const ErrorExpectedTags([$text]))'))
        .buildBody(context);
  }
}
