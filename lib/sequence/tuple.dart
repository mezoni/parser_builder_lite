import '../parser_builder.dart';

class Tuple2<I, O1, O2> extends ParserBuilder<I, (O1, O2)> {
  final ParserBuilder<I, O1> p1;

  final ParserBuilder<I, O2> p2;

  const Tuple2(this.p1, this.p2);

  @override
  String getTemplate(BuildContext context) => r'''
final pos = state.pos;
final r1 = {{p1}}(state);
if (r1 != null) {
  final r2 = {{p2}}(state);
  if (r2 != null) {
     return Result((r1.value, r2.value));
  }
  state.pos = pos;
}
return null;''';

  @override
  Map<String, String> getValues(BuildContext context) => {
        'p1': p1.build(context).name,
        'p2': p2.build(context).name,
      };
}

class Tuple3<I, O1, O2, O3> extends ParserBuilder<I, (O1, O2, O3)> {
  final ParserBuilder<I, O1> p1;

  final ParserBuilder<I, O2> p2;

  final ParserBuilder<I, O3> p3;

  const Tuple3(this.p1, this.p2, this.p3);

  @override
  String getTemplate(BuildContext context) => r'''
final pos = state.pos;
final r1 = {{p1}}(state);
if (r1 != null) {
  final r2 = {{p2}}(state);
  if (r2 != null) {
    final r3 = {{p3}}(state);
    if (r3 != null) {
      return Result((r1.value, r2.value, r3.value));
    }
  }
  state.pos = pos;
}
return null;''';

  @override
  Map<String, String> getValues(BuildContext context) => {
        'p1': p1.build(context).name,
        'p2': p2.build(context).name,
        'p3': p3.build(context).name,
      };
}

class Tuple4<I, O1, O2, O3, O4> extends ParserBuilder<I, (O1, O2, O3, O4)> {
  final ParserBuilder<I, O1> p1;

  final ParserBuilder<I, O2> p2;

  final ParserBuilder<I, O3> p3;

  final ParserBuilder<I, O4> p4;

  const Tuple4(this.p1, this.p2, this.p3, this.p4);

  @override
  String getTemplate(BuildContext context) => '''
final pos = state.pos;
final r1 = {{p1}}(state);
if (r1 != null) {
  final r2 = {{p2}}(state);
  if (r2 != null) {
    final r3 = {{p3}}(state);
    if (r3 != null) {
      final r4 = {{p4}}v
      if (r4 != null) {
        return Result((r1.value, r2.value, r3.value, r4.value));
      }
    }
 }
  state.pos = pos;
}
return null;''';

  @override
  Map<String, String> getValues(BuildContext context) => {
        'p1': p1.build(context).name,
        'p2': p2.build(context).name,
        'p3': p3.build(context).name,
        'p4': p4.build(context).name,
      };
}

class Tuple5<I, O1, O2, O3, O4, O5>
    extends ParserBuilder<I, (O1, O2, O3, O4, O5)> {
  final ParserBuilder<I, O1> p1;

  final ParserBuilder<I, O2> p2;

  final ParserBuilder<I, O3> p3;

  final ParserBuilder<I, O4> p4;

  final ParserBuilder<I, O5> p5;

  const Tuple5(this.p1, this.p2, this.p3, this.p4, this.p5);

  @override
  String getTemplate(BuildContext context) => '''
final pos = state.pos;
final r1 = {{p1}}(state);
if (r1 != null) {
  final r2 = {{p2}}(state);
  if (r2 != null) {
    final r3 = {{p3}}(state);
    if (r3 != null) {
      final r4 = {{p4}}(state);
      if (r4 != null) {
        final r5 = {{p5}}(state);
        if (r5 != null) {
          return Result((r1.value, r2.value, r3.value, r4.value, r5.value));
        }
      }
    }
  }
  state.pos = pos;
}
return null;''';

  @override
  Map<String, String> getValues(BuildContext context) => {
        'p1': p1.build(context).name,
        'p2': p2.build(context).name,
        'p3': p3.build(context).name,
        'p4': p4.build(context).name,
        'p5': p5.build(context).name,
      };
}

class Tuple6<I, O1, O2, O3, O4, O5, O6>
    extends ParserBuilder<I, (O1, O2, O3, O4, O5, O6)> {
  final ParserBuilder<I, O1> p1;

  final ParserBuilder<I, O2> p2;

  final ParserBuilder<I, O3> p3;

  final ParserBuilder<I, O4> p4;

  final ParserBuilder<I, O5> p5;

  final ParserBuilder<I, O6> p6;

  const Tuple6(this.p1, this.p2, this.p3, this.p4, this.p5, this.p6);

  @override
  String getTemplate(BuildContext context) => '''
final pos = state.pos;
final r1 = {{p1}}(state);
if (r1 != null) {
  final r2 = {{p2}}(state);
  if (r2 != null) {
    final r3 = {{p3}}(state);
    if (r3 != null) {
      final r4 = {{p4}}(state);
      if (r4 != null) {
        final r5 = {{p5}}(state);
        if (r5 != null) {
          final r6 = {{p6}}(state);
          if (r6 != null) {
           return Result((r1.value, r2.value, r3.value, r4.value, r5.value, r6.value));
          }
        }
      }
    }
  }
  state.pos = pos;
}
return null;''';

  @override
  Map<String, String> getValues(BuildContext context) => {
        'p1': p1.build(context).name,
        'p2': p2.build(context).name,
        'p3': p3.build(context).name,
        'p4': p4.build(context).name,
        'p5': p5.build(context).name,
        'p6': p6.build(context).name,
      };
}

class Tuple7<I, O1, O2, O3, O4, O5, O6, O7>
    extends ParserBuilder<I, (O1, O2, O3, O4, O5, O6, O7)> {
  final ParserBuilder<I, O1> p1;

  final ParserBuilder<I, O2> p2;

  final ParserBuilder<I, O3> p3;

  final ParserBuilder<I, O4> p4;

  final ParserBuilder<I, O5> p5;

  final ParserBuilder<I, O6> p6;

  final ParserBuilder<I, O7> p7;

  const Tuple7(this.p1, this.p2, this.p3, this.p4, this.p5, this.p6, this.p7);

  @override
  String getTemplate(BuildContext context) => '''
final pos = state.pos;
final r1 = {{p1}}(state);
if (r1 != null) {
  final r2 = {{p2}}(state);
  if (r2 != null) {
    final r3 = {{p3}}(state);
    if (r3 != null) {
      final r4 = {{p4}}(state);
      if (r4 != null) {
        final r5 = {{p5}}(state);
        if (r5 != null) {
          final r6 = {{p6}}v
          if (r6 != null) {
            final r7 = {{p7}}(state);
            if (r7 != null) {
              return Result((r1.value, r2.value, r3.value, r4.value, r5.value, r6.value, r7.value));
            }
          }
        }
      }
    }
  }
  state.pos = pos;
}
return null;''';

  @override
  Map<String, String> getValues(BuildContext context) => {
        'p1': p1.build(context).name,
        'p2': p2.build(context).name,
        'p3': p3.build(context).name,
        'p4': p4.build(context).name,
        'p5': p5.build(context).name,
        'p6': p6.build(context).name,
        'p7': p7.build(context).name,
      };
}
