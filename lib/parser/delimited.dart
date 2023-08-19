import '../parser_builder.dart';
import 'sequence.dart';

class Delimited<I, O1, O2, O3> extends SequenceBase<I, O2> {
  final ParserBuilder<I, O3> end;

  final ParserBuilder<I, O2> p;

  final ParserBuilder<I, O1> start;

  const Delimited(this.start, this.p, this.end);

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return [
      (start, false),
      (p, null),
      (end, false),
    ];
  }
}
