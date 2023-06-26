import '../parser_builder.dart';

class Map2<I, O, O1, O2> extends ParserBuilder<I, O> {
  final ParserBuilder<I, O1> p1;

  final ParserBuilder<I, O2> p2;

  final Func<O> f;

  const Map2(this.p1, this.p2, this.f);

  @override
  String get template => '''
final pos = state.pos;
final r1 = {{p1}};
if (r1 != null) {
  final r2 = {{p2}};
  if (r2 != null) {
    final v = {{f}}(r1.value, r2.value);
    return Result(v);
  }
  state.pos = pos;
}
return null;''';

  @override
  Map<String, Object?> get values => {
        'f': f,
        'p1': p1,
        'p2': p2,
      };
}

class Map3<I, O, O1, O2, O3> extends ParserBuilder<I, O> {
  final ParserBuilder<I, O1> p1;

  final ParserBuilder<I, O2> p2;

  final ParserBuilder<I, O3> p3;

  final Func<O> f;

  const Map3(this.p1, this.p2, this.p3, this.f);

  @override
  String get template => '''
final pos = state.pos;
final r1 = {{p1}};
if (r1 != null) {
  final r2 = {{p2}};
  if (r2 != null) {
    final r3 = {{p3}};
    if (r3 != null) {
      final v = {{f}}(r1.value, r2.value, r3.value);
      return Result(v);
    }
  }
  state.pos = pos;
}
return null;''';

  @override
  Map<String, Object?> get values => {
        'f': f,
        'p1': p1,
        'p2': p2,
        'p3': p3,
      };
}
