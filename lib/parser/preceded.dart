import '../parser_builder.dart';
import 'sequence.dart';

class Preceded<I, O1, O2> extends SequenceBase<I, O2> {
  final ParserBuilder<I, O2> p;

  final ParserBuilder<I, O1> start;

  const Preceded(this.start, this.p);

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return [
      (start, false),
      (p, null),
    ];
  }
}
