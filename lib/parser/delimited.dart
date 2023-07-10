import '../parser_builder.dart';
import 'sequence.dart';

class Delimited<I, O> extends ParserBuilder<I, O> {
  final ParserBuilder<I, Object?> end;

  final ParserBuilder<I, O> p;

  final ParserBuilder<I, Object?> start;

  const Delimited(this.start, this.p, this.end);

  @override
  String buildBody(BuildContext context) {
    return Sequence<I, O>([
      (start, false),
      (p, true),
      (end, false),
    ]).buildBody(context);
  }
}
