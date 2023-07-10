import '../parser_builder.dart';
import 'sequence.dart';

class Terminated<I, O> extends ParserBuilder<I, O> {
  final ParserBuilder<I, O> p;

  final ParserBuilder<I, dynamic> end;

  const Terminated(this.p, this.end);

  @override
  String buildBody(BuildContext context) {
    return Sequence<I, O>([
      (p, true),
      (end, false),
    ]).buildBody(context);
  }
}
