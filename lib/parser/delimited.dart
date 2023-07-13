import '../parser_builder.dart';
import 'sequence.dart';

class Delimited<I, O> extends SequenceBase<I, O> {
  final ParserBuilder<I, Object?> end;

  final ParserBuilder<I, O> p;

  final ParserBuilder<I, Object?> start;

  const Delimited(this.start, this.p, this.end);

  @override
  List<(ParserBuilder<I, Object?>, bool)> getParserSequence(
      BuildContext context) {
    return [
      (start, false),
      (p, true),
      (end, false),
    ];
  }
}
