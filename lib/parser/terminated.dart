import '../parser_builder.dart';
import 'sequence.dart';

class Terminated<I, O> extends SequenceBase<I, O> {
  final ParserBuilder<I, O> p;

  final ParserBuilder<I, dynamic> end;

  const Terminated(this.p, this.end);

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return [
      (p, null),
      (end, false),
    ];
  }
}
