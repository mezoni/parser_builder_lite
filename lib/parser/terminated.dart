import '../parser_builder.dart';
import 'sequence.dart';

class Terminated<I, O1, O2> extends SequenceBase<I, O1> {
  final ParserBuilder<I, O1> p;

  final ParserBuilder<I, O2> end;

  const Terminated(this.p, this.end);

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return [
      (p, null),
      (end, false),
    ];
  }
}
