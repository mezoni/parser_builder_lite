import '../parser_builder.dart';
import 'sequence.dart';

class Delimited<I, O> extends SequenceBase<I, O> {
  final ParserBuilder<I, Object?> end;

  final ParserBuilder<I, O> p;

  final ParserBuilder<I, Object?> start;

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
