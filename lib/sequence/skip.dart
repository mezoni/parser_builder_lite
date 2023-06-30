import '../parser_builder.dart';

class Skip2<I> extends ParserBuilder<I, Object?> {
  final ParserBuilder<I, Object?> p1;

  final ParserBuilder<I, Object?> p2;

  const Skip2(this.p1, this.p2);

  @override
  String getTemplate(BuildContext context) => '''
final pos = state.pos;
final r1 = {{p1}}(state);
if (r1 != null) {
  final r2 = {{p2}}(state);
  if (r2 != null) {
     return const Result(null);
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

class Skip3<I> extends ParserBuilder<I, Object?> {
  final ParserBuilder<I, Object?> p1;

  final ParserBuilder<I, Object?> p2;

  final ParserBuilder<I, Object?> p3;

  const Skip3(this.p1, this.p2, this.p3);

  @override
  String getTemplate(BuildContext context) => '''
final pos = state.pos;
final r1 = {{p1}}(state);
if (r1 != null) {
  final r2 = {{p2}}(state);
  if (r2 != null) {
    final r3 = {{p3}}(state);
    if (r3 != null) {
      return const Result(null);
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

class Skip4<I> extends ParserBuilder<I, Object?> {
  final ParserBuilder<I, Object?> p1;

  final ParserBuilder<I, Object?> p2;

  final ParserBuilder<I, Object?> p3;

  final ParserBuilder<I, Object?> p4;

  const Skip4(this.p1, this.p2, this.p3, this.p4);

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
        return const Result(null);
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

class Skip5<I> extends ParserBuilder<I, Object?> {
  final ParserBuilder<I, Object?> p1;

  final ParserBuilder<I, Object?> p2;

  final ParserBuilder<I, Object?> p3;

  final ParserBuilder<I, Object?> p4;

  final ParserBuilder<I, Object?> p5;

  const Skip5(this.p1, this.p2, this.p3, this.p4, this.p5);

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
          return const Result(null);
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

class Skip6<I> extends ParserBuilder<I, Object?> {
  final ParserBuilder<I, Object?> p1;

  final ParserBuilder<I, Object?> p2;

  final ParserBuilder<I, Object?> p3;

  final ParserBuilder<I, Object?> p4;

  final ParserBuilder<I, Object?> p5;

  final ParserBuilder<I, Object?> p6;

  const Skip6(this.p1, this.p2, this.p3, this.p4, this.p5, this.p6);

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
           return const Result(null);
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

class Skip7<I> extends ParserBuilder<I, Object?> {
  final ParserBuilder<I, Object?> p1;

  final ParserBuilder<I, Object?> p2;

  final ParserBuilder<I, Object?> p3;

  final ParserBuilder<I, Object?> p4;

  final ParserBuilder<I, Object?> p5;

  final ParserBuilder<I, Object?> p6;

  final ParserBuilder<I, Object?> p7;

  const Skip7(this.p1, this.p2, this.p3, this.p4, this.p5, this.p6, this.p7);

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
            final r7 = {{p7}}(state);
            if (r7 != null) {
              return const Result(null);
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
