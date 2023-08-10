import '../calculable.dart';
import '../parser_builder.dart';
import 'handle_error.dart';

class ReplaceErrors<I, O> extends ParserBuilder<I, O> {
  final Calculable<(bool, List<Object>?)> handle;

  final ParserBuilder<I, O> p;

  const ReplaceErrors(this.p, this.handle);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    return HandleError(p, handle).buildBody(context, hasResult);
  }

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return [(p, null)];
  }
}
