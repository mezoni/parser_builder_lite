import '../expr.dart';
import '../helper.dart';
import '../parser_builder.dart';
import 'handle_error.dart';

class Expected<I, O> extends ParserBuilder<I, O> {
  final String tag;

  final ParserBuilder<I, O> p;

  const Expected(this.tag, this.p);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    final text = escapeString(tag);
    return HandleError(
            p,
            Expr(
                '{{0}} != {{1}} ? const (false, null) : const (true, [ErrorExpectedTags([$text])])'))
        .buildBody(context, hasResult);
  }

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return [(p, null)];
  }

  @override
  Iterable<String> getStartingErrors() {
    return ['const ErrorExpectedTags([${escapeString(tag)}])'];
  }
}
