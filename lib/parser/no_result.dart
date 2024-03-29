import '../parser_builder.dart';
import 'sequence.dart';

class NoResult<I> extends _NoResult<I> {
  final List<ParserBuilder<I, Object?>> ps;

  const NoResult(this.ps);

  @override
  List<ParserBuilder<I, Object?>> get _ps => ps;
}

class NoResult2<I, O1, O2> extends _NoResult<I> {
  final ParserBuilder<I, O1> p1;

  final ParserBuilder<I, O2> p2;

  const NoResult2(this.p1, this.p2);

  @override
  List<ParserBuilder<I, Object?>> get _ps => [p1, p2];
}

class NoResult3<I, O1, O2, O3> extends _NoResult<I> {
  final ParserBuilder<I, O1> p1;

  final ParserBuilder<I, O2> p2;

  final ParserBuilder<I, O3> p3;

  const NoResult3(this.p1, this.p2, this.p3);

  @override
  List<ParserBuilder<I, Object?>> get _ps => [p1, p2, p3];
}

class NoResult4<I, O1, O2, O3, O4> extends _NoResult<I> {
  final ParserBuilder<I, O1> p1;

  final ParserBuilder<I, O2> p2;

  final ParserBuilder<I, O3> p3;

  final ParserBuilder<I, O4> p4;

  const NoResult4(this.p1, this.p2, this.p3, this.p4);

  @override
  List<ParserBuilder<I, Object?>> get _ps => [p1, p2, p3, p4];
}

class NoResult5<I, O1, O2, O3, O4, O5> extends _NoResult<I> {
  final ParserBuilder<I, O1> p1;

  final ParserBuilder<I, O2> p2;

  final ParserBuilder<I, O3> p3;

  final ParserBuilder<I, O4> p4;

  final ParserBuilder<I, O5> p5;

  const NoResult5(this.p1, this.p2, this.p3, this.p4, this.p5);

  @override
  List<ParserBuilder<I, Object?>> get _ps => [p1, p2, p3, p4, p5];
}

class NoResult6<I, O1, O2, O3, O4, O5, O6> extends _NoResult<I> {
  final ParserBuilder<I, O1> p1;

  final ParserBuilder<I, O2> p2;

  final ParserBuilder<I, O3> p3;

  final ParserBuilder<I, O4> p4;

  final ParserBuilder<I, O5> p5;

  final ParserBuilder<I, O6> p6;

  const NoResult6(this.p1, this.p2, this.p3, this.p4, this.p5, this.p6);

  @override
  List<ParserBuilder<I, Object?>> get _ps => [p1, p2, p3, p4, p5, p6];
}

class NoResult7<I, O1, O2, O3, O4, O5, O6, O7> extends _NoResult<I> {
  final ParserBuilder<I, O1> p1;

  final ParserBuilder<I, O2> p2;

  final ParserBuilder<I, O3> p3;

  final ParserBuilder<I, O4> p4;

  final ParserBuilder<I, O5> p5;

  final ParserBuilder<I, O6> p6;

  final ParserBuilder<I, O7> p7;

  const NoResult7(
      this.p1, this.p2, this.p3, this.p4, this.p5, this.p6, this.p7);

  @override
  List<ParserBuilder<I, Object?>> get _ps => [p1, p2, p3, p4, p5, p6, p7];
}

class NoResult8<I, O1, O2, O3, O4, O5, O6, O7, O8> extends _NoResult<I> {
  final ParserBuilder<I, O1> p1;

  final ParserBuilder<I, O2> p2;

  final ParserBuilder<I, O3> p3;

  final ParserBuilder<I, O4> p4;

  final ParserBuilder<I, O5> p5;

  final ParserBuilder<I, O6> p6;

  final ParserBuilder<I, O7> p7;

  final ParserBuilder<I, O8> p8;

  const NoResult8(
      this.p1, this.p2, this.p3, this.p4, this.p5, this.p6, this.p7, this.p8);

  @override
  List<ParserBuilder<I, Object?>> get _ps => [p1, p2, p3, p4, p5, p6, p7, p8];
}

class NoResult9<I, O1, O2, O3, O4, O5, O6, O7, O8, O9> extends _NoResult<I> {
  final ParserBuilder<I, O1> p1;

  final ParserBuilder<I, O2> p2;

  final ParserBuilder<I, O3> p3;

  final ParserBuilder<I, O4> p4;

  final ParserBuilder<I, O5> p5;

  final ParserBuilder<I, O6> p6;

  final ParserBuilder<I, O7> p7;

  final ParserBuilder<I, O8> p8;

  final ParserBuilder<I, O9> p9;

  const NoResult9(this.p1, this.p2, this.p3, this.p4, this.p5, this.p6, this.p7,
      this.p8, this.p9);

  @override
  List<ParserBuilder<I, Object?>> get _ps =>
      [p1, p2, p3, p4, p5, p6, p7, p8, p9];
}

abstract class _NoResult<I> extends SequenceBase<I, Object?> {
  const _NoResult();

  List<ParserBuilder<I, Object?>> get _ps;

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return _ps.map((e) => (e, false));
  }
}
