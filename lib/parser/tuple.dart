import '../parser_builder.dart';
import 'sequence.dart';

class Tuple2<I, O1, O2> extends _Tuple<I, (O1, O2)> {
  final ParserBuilder<I, O1> p1;

  final ParserBuilder<I, O2> p2;

  const Tuple2(this.p1, this.p2);

  @override
  List<(ParserBuilder<I, Object?>, bool)> get _ps => [
        (p1, true),
        (p2, true),
      ];
}

class Tuple3<I, O1, O2, O3> extends _Tuple<I, (O1, O2, O3)> {
  final ParserBuilder<I, O1> p1;

  final ParserBuilder<I, O2> p2;

  final ParserBuilder<I, O3> p3;

  const Tuple3(this.p1, this.p2, this.p3);

  @override
  List<(ParserBuilder<I, Object?>, bool)> get _ps => [
        (p1, true),
        (p2, true),
        (p3, true),
      ];
}

class Tuple4<I, O1, O2, O3, O4> extends _Tuple<I, (O1, O2, O3, O4)> {
  final ParserBuilder<I, O1> p1;

  final ParserBuilder<I, O2> p2;

  final ParserBuilder<I, O3> p3;

  final ParserBuilder<I, O4> p4;

  const Tuple4(this.p1, this.p2, this.p3, this.p4);

  @override
  List<(ParserBuilder<I, Object?>, bool)> get _ps => [
        (p1, true),
        (p2, true),
        (p3, true),
        (p4, true),
      ];
}

class Tuple5<I, O1, O2, O3, O4, O5> extends _Tuple<I, (O1, O2, O3, O4, O5)> {
  final ParserBuilder<I, O1> p1;

  final ParserBuilder<I, O2> p2;

  final ParserBuilder<I, O3> p3;

  final ParserBuilder<I, O4> p4;

  final ParserBuilder<I, O5> p5;

  const Tuple5(this.p1, this.p2, this.p3, this.p4, this.p5);

  @override
  List<(ParserBuilder<I, Object?>, bool)> get _ps => [
        (p1, true),
        (p2, true),
        (p3, true),
        (p4, true),
        (p5, true),
      ];
}

class Tuple6<I, O1, O2, O3, O4, O5, O6>
    extends _Tuple<I, (O1, O2, O3, O4, O5, O6)> {
  final ParserBuilder<I, O1> p1;

  final ParserBuilder<I, O2> p2;

  final ParserBuilder<I, O3> p3;

  final ParserBuilder<I, O4> p4;

  final ParserBuilder<I, O5> p5;

  final ParserBuilder<I, O6> p6;

  const Tuple6(this.p1, this.p2, this.p3, this.p4, this.p5, this.p6);

  @override
  List<(ParserBuilder<I, Object?>, bool)> get _ps => [
        (p1, true),
        (p2, true),
        (p3, true),
        (p4, true),
        (p5, true),
        (p6, true),
      ];
}

class Tuple7<I, O1, O2, O3, O4, O5, O6, O7>
    extends _Tuple<I, (O1, O2, O3, O4, O5, O6, O7)> {
  final ParserBuilder<I, O1> p1;

  final ParserBuilder<I, O2> p2;

  final ParserBuilder<I, O3> p3;

  final ParserBuilder<I, O4> p4;

  final ParserBuilder<I, O5> p5;

  final ParserBuilder<I, O6> p6;

  final ParserBuilder<I, O7> p7;

  const Tuple7(this.p1, this.p2, this.p3, this.p4, this.p5, this.p6, this.p7);

  @override
  List<(ParserBuilder<I, Object?>, bool)> get _ps => [
        (p1, true),
        (p2, true),
        (p3, true),
        (p4, true),
        (p5, true),
        (p6, true),
        (p7, true),
      ];
}

class Tuple8<I, O1, O2, O3, O4, O5, O6, O7, O8>
    extends _Tuple<I, (O1, O2, O3, O4, O5, O6, O7, O8)> {
  final ParserBuilder<I, O1> p1;

  final ParserBuilder<I, O2> p2;

  final ParserBuilder<I, O3> p3;

  final ParserBuilder<I, O4> p4;

  final ParserBuilder<I, O5> p5;

  final ParserBuilder<I, O6> p6;

  final ParserBuilder<I, O7> p7;

  final ParserBuilder<I, O8> p8;

  const Tuple8(
      this.p1, this.p2, this.p3, this.p4, this.p5, this.p6, this.p7, this.p8);

  @override
  List<(ParserBuilder<I, Object?>, bool)> get _ps => [
        (p1, true),
        (p2, true),
        (p3, true),
        (p4, true),
        (p5, true),
        (p6, true),
        (p7, true),
        (p8, true),
      ];
}

class Tuple9<I, O1, O2, O3, O4, O5, O6, O7, O8, O9>
    extends _Tuple<I, (O1, O2, O3, O4, O5, O6, O7, O8, O9)> {
  final ParserBuilder<I, O1> p1;

  final ParserBuilder<I, O2> p2;

  final ParserBuilder<I, O3> p3;

  final ParserBuilder<I, O4> p4;

  final ParserBuilder<I, O5> p5;

  final ParserBuilder<I, O6> p6;

  final ParserBuilder<I, O7> p7;

  final ParserBuilder<I, O8> p8;

  final ParserBuilder<I, O9> p9;

  const Tuple9(this.p1, this.p2, this.p3, this.p4, this.p5, this.p6, this.p7,
      this.p8, this.p9);

  @override
  List<(ParserBuilder<I, Object?>, bool)> get _ps => [
        (p1, true),
        (p2, true),
        (p3, true),
        (p4, true),
        (p5, true),
        (p6, true),
        (p7, true),
        (p8, true),
        (p9, true),
      ];
}

abstract class _Tuple<I, O> extends ParserBuilder<I, O> {
  const _Tuple();

  List<(ParserBuilder<I, Object?>, bool)> get _ps;

  @override
  String buildBody(BuildContext context) {
    return Sequence<I, O>(_ps).buildBody(context);
  }
}
