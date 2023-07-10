import '../parser_builder.dart';
import 'sequence.dart';

class Skip<I> extends _Skip<I> {
  final List<ParserBuilder<I, Object?>> ps;

  const Skip(this.ps);

  @override
  List<ParserBuilder<I, Object?>> get _ps => ps;
}

class Skip2<I> extends _Skip<I> {
  final ParserBuilder<I, Object?> p1;

  final ParserBuilder<I, Object?> p2;

  const Skip2(this.p1, this.p2);

  @override
  List<ParserBuilder<I, Object?>> get _ps => [p1, p2];
}

class Skip3<I> extends _Skip<I> {
  final ParserBuilder<I, Object?> p1;

  final ParserBuilder<I, Object?> p2;

  final ParserBuilder<I, Object?> p3;

  const Skip3(this.p1, this.p2, this.p3);

  @override
  List<ParserBuilder<I, Object?>> get _ps => [p1, p2, p3];
}

class Skip4<I> extends _Skip<I> {
  final ParserBuilder<I, Object?> p1;

  final ParserBuilder<I, Object?> p2;

  final ParserBuilder<I, Object?> p3;

  final ParserBuilder<I, Object?> p4;

  const Skip4(this.p1, this.p2, this.p3, this.p4);

  @override
  List<ParserBuilder<I, Object?>> get _ps => [p1, p2, p3, p4];
}

class Skip5<I> extends _Skip<I> {
  final ParserBuilder<I, Object?> p1;

  final ParserBuilder<I, Object?> p2;

  final ParserBuilder<I, Object?> p3;

  final ParserBuilder<I, Object?> p4;

  final ParserBuilder<I, Object?> p5;

  const Skip5(this.p1, this.p2, this.p3, this.p4, this.p5);

  @override
  List<ParserBuilder<I, Object?>> get _ps => [p1, p2, p3, p4, p5];
}

class Skip6<I> extends _Skip<I> {
  final ParserBuilder<I, Object?> p1;

  final ParserBuilder<I, Object?> p2;

  final ParserBuilder<I, Object?> p3;

  final ParserBuilder<I, Object?> p4;

  final ParserBuilder<I, Object?> p5;

  final ParserBuilder<I, Object?> p6;

  const Skip6(this.p1, this.p2, this.p3, this.p4, this.p5, this.p6);

  @override
  List<ParserBuilder<I, Object?>> get _ps => [p1, p2, p3, p4, p5, p6];
}

class Skip7<I> extends _Skip<I> {
  final ParserBuilder<I, Object?> p1;

  final ParserBuilder<I, Object?> p2;

  final ParserBuilder<I, Object?> p3;

  final ParserBuilder<I, Object?> p4;

  final ParserBuilder<I, Object?> p5;

  final ParserBuilder<I, Object?> p6;

  final ParserBuilder<I, Object?> p7;

  const Skip7(this.p1, this.p2, this.p3, this.p4, this.p5, this.p6, this.p7);

  @override
  List<ParserBuilder<I, Object?>> get _ps => [p1, p2, p3, p4, p5, p6, p7];
}

class Skip8<I> extends _Skip<I> {
  final ParserBuilder<I, Object?> p1;

  final ParserBuilder<I, Object?> p2;

  final ParserBuilder<I, Object?> p3;

  final ParserBuilder<I, Object?> p4;

  final ParserBuilder<I, Object?> p5;

  final ParserBuilder<I, Object?> p6;

  final ParserBuilder<I, Object?> p7;

  final ParserBuilder<I, Object?> p8;

  const Skip8(
      this.p1, this.p2, this.p3, this.p4, this.p5, this.p6, this.p7, this.p8);

  @override
  List<ParserBuilder<I, Object?>> get _ps => [p1, p2, p3, p4, p5, p6, p7, p8];
}

class Skip9<I> extends _Skip<I> {
  final ParserBuilder<I, Object?> p1;

  final ParserBuilder<I, Object?> p2;

  final ParserBuilder<I, Object?> p3;

  final ParserBuilder<I, Object?> p4;

  final ParserBuilder<I, Object?> p5;

  final ParserBuilder<I, Object?> p6;

  final ParserBuilder<I, Object?> p7;

  final ParserBuilder<I, Object?> p8;

  final ParserBuilder<I, Object?> p9;

  const Skip9(this.p1, this.p2, this.p3, this.p4, this.p5, this.p6, this.p7,
      this.p8, this.p9);

  @override
  List<ParserBuilder<I, Object?>> get _ps =>
      [p1, p2, p3, p4, p5, p6, p7, p8, p9];
}

abstract class _Skip<I> extends ParserBuilder<I, Object?> {
  const _Skip();

  List<ParserBuilder<I, Object?>> get _ps;

  @override
  String buildBody(BuildContext context) {
    return Sequence<I, Object?>(_ps.map((e) => (e, false)).toList())
        .buildBody(context);
  }
}
