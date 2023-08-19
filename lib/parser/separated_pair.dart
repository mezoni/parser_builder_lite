import '../parser_builder.dart';
import 'sequence.dart';

class SeparatedPair<I, O1, O2, O3> extends SequenceBase<I, (O1, O3)> {
  final ParserBuilder<I, O3> p2;

  final ParserBuilder<I, O2> sep;

  final ParserBuilder<I, O1> p1;

  const SeparatedPair(this.p1, this.sep, this.p2);

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return [
      (p1, null),
      (sep, false),
      (p2, null),
    ];
  }
}
