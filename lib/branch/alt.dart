import '../parser_builder.dart';

class Alt2<I, O> extends ParserBuilder<I, O> {
  final ParserBuilder<I, O> p1;

  final ParserBuilder<I, O> p2;

  const Alt2(this.p1, this.p2);

  @override
  String get template => '''
{
  final r1 = {{p1}};
  if (r1 != null) {
    return r1;
  }
  final r2 = {{p2}};
  if (r2 != null) {
    return r2;
  }
  return null;
}''';

  @override
  Map<String, Object?> get values => {
        'p1': p1,
        'p2': p2,
      };
}

class Alt3<I, O> extends ParserBuilder<I, O> {
  final ParserBuilder<I, O> p1;

  final ParserBuilder<I, O> p2;

  final ParserBuilder<I, O> p3;

  const Alt3(this.p1, this.p2, this.p3);

  @override
  String get template => '''
{
  final r1 = {{p1}};
  if (r1 != null) {
    return r1;
  }
  final r2 = {{p2}};
  if (r2 != null) {
    return r2;
  }
  final r3 = {{p3}};
  if (r3 != null) {
    return r3;
  }
  return null;
}''';

  @override
  Map<String, Object?> get values => {
        'p1': p1,
        'p2': p2,
        'p3': p3,
      };
}

class Alt4<I, O> extends ParserBuilder<I, O> {
  final ParserBuilder<I, O> p1;

  final ParserBuilder<I, O> p2;

  final ParserBuilder<I, O> p3;

  final ParserBuilder<I, O> p4;

  const Alt4(this.p1, this.p2, this.p3, this.p4);

  @override
  String get template => '''
final r1 = {{p1}};
if (r1 != null) {
  return r1;
}
final r2 = {{p2}};
if (r2 != null) {
  return r2;
}
final r3 = {{p3}};
if (r3 != null) {
  return r3;
}
final r4 = {{p4}};
if (r4 != null) {
  return r4;
}
return null;''';

  @override
  Map<String, Object?> get values => {
        'p1': p1,
        'p2': p2,
        'p3': p3,
        'p4': p4,
      };
}

class Alt5<I, O> extends ParserBuilder<I, O> {
  final ParserBuilder<I, O> p1;

  final ParserBuilder<I, O> p2;

  final ParserBuilder<I, O> p3;

  final ParserBuilder<I, O> p4;

  final ParserBuilder<I, O> p5;

  const Alt5(this.p1, this.p2, this.p3, this.p4, this.p5);

  @override
  String get template => '''
{
  final r1 = {{p1}};
  if (r1 != null) {
    return r1;
  }
  final r2 = {{p2}};
  if (r2 != null) {
    return r2;
  }
  final r3 = {{p3}};
  if (r3 != null) {
    return r3;
  }
  final r4 = {{p4}};
  if (r4 != null) {
    return r4;
  }
  final r5 = {{p5}};
  if (r5 != null) {
    return r5;
  }
  return null;
}''';

  @override
  Map<String, Object?> get values => {
        'p1': p1,
        'p2': p2,
        'p3': p3,
        'p4': p4,
        'p5': p5,
      };
}

class Alt6<I, O> extends ParserBuilder<I, O> {
  final ParserBuilder<I, O> p1;

  final ParserBuilder<I, O> p2;

  final ParserBuilder<I, O> p3;

  final ParserBuilder<I, O> p4;

  final ParserBuilder<I, O> p5;

  final ParserBuilder<I, O> p6;

  const Alt6(this.p1, this.p2, this.p3, this.p4, this.p5, this.p6);

  @override
  String get template => '''
{
  final r1 = {{p1}};
  if (r1 != null) {
    return r1;
  }
  final r2 = {{p2}};
  if (r2 != null) {
    return r2;
  }
  final r3 = {{p3}};
  if (r3 != null) {
    return r3;
  }
  final r4 = {{p4}};
  if (r4 != null) {
    return r4;
  }
  final r5 = {{p5}};
  if (r5 != null) {
    return r5;
  }
  final r6 = {{p6}};
  if (r6 != null) {
    return r6;
  }
  return null;
}''';

  @override
  Map<String, Object?> get values => {
        'p1': p1,
        'p2': p2,
        'p3': p3,
        'p4': p4,
        'p5': p5,
        'p6': p6,
      };
}

class Alt7<I, O> extends ParserBuilder<I, O> {
  final ParserBuilder<I, O> p1;

  final ParserBuilder<I, O> p2;

  final ParserBuilder<I, O> p3;

  final ParserBuilder<I, O> p4;

  final ParserBuilder<I, O> p5;

  final ParserBuilder<I, O> p6;

  final ParserBuilder<I, O> p7;

  const Alt7(this.p1, this.p2, this.p3, this.p4, this.p5, this.p6, this.p7);

  @override
  String get template => '''
{
  final r1 = {{p1}};
  if (r1 != null) {
    return r1;
  }
  final r2 = {{p2}};
  if (r2 != null) {
    return r2;
  }
  final r3 = {{p3}};
  if (r3 != null) {
    return r3;
  }
  final r4 = {{p4}};
  if (r4 != null) {
    return r4;
  }
  final r5 = {{p5}};
  if (r5 != null) {
    return r5;
  }
  final r6 = {{p6}};
  if (r6 != null) {
    return r6;
  }
  final r7 = {{p7}};
  if (r7 != null) {
    return r7;
  }
  return null;
}''';

  @override
  Map<String, Object?> get values => {
        'p1': p1,
        'p2': p2,
        'p3': p3,
        'p4': p4,
        'p5': p5,
        'p6': p6,
        'p7': p7,
      };
}
