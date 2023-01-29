import '../parser_builder.dart';

class SeparatedList0<I, O> extends ParserBuilder<I, List<O>> {
  final ParserBuilder<I, O> p1;

  final ParserBuilder<I, Object?> p2;

  const SeparatedList0(this.p1, this.p2);

  @override
  String get template => '''
{
  var pos = state.pos;
  final list = <{{O}}>[];
  while (true) {
    final r1 = {{p1}};
    if (r1 == null) {
      state.pos = pos;
      break;
    }
    list.add(r1.value);
    pos = state.pos;
    final r2 = {{p2}};
    if (r2 == null) {
      break;
    }
  }
  return Result(list);
}
''';

  @override
  Map<String, Object?> get values => {
        'O': '$O',
        'p1': p1,
        'p2': p2,
      };
}
