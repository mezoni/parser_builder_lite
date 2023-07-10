import '../parser_builder.dart';
import 'sequence.dart';

class Preceded<I, O> extends ParserBuilder<I, O> {
  final ParserBuilder<I, O> p;

  final ParserBuilder<I, Object?> start;

  const Preceded(this.start, this.p);

  @override
  String buildBody(BuildContext context) {
    return Sequence<I, O>([
      (start, false),
      (p, true),
    ]).buildBody(context);
  }
}
