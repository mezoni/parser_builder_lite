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
    checkIsNotOptional(context, p);
    final text = escapeString(tag);
    return HandleError(
            p,
            Expr(
                '{{0}} != {{1}} ? (false, []) : (true, [const ErrorExpectedTags([$text])])'))
        .buildBody(context);
  }

  @override
  List<(int, int)> getStartCharacters(BuildContext context) {
    return p.getStartCharacters(context);
  }

  @override
  List<String> getStartErrors(BuildContext context) {
    return ['const ErrorExpectedTags([${escapeString(tag)}])'];
  }
}
