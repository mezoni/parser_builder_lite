import '../parser_builder.dart';
import 'sequence.dart';

class Preceded<I, O> extends SequenceBase<I, O> {
  final ParserBuilder<I, O> p;

  final ParserBuilder<I, Object?> start;

  const Preceded(this.start, this.p);

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return [
      (start, false),
      (p, null),
    ];
  }
}
