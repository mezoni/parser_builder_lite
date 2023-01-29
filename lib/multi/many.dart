import '../parser_builder.dart';

class Many0<I, O> extends ParserBuilder<I, List<O>> {
  final ParserBuilder<I, O> parser;

  const Many0(this.parser);

  @override
  String get template => '''
{
  final list = <{{O}}>[];
  while (true) {
    final r1 = {{p1}};
    if (r1 == null) {
      break;
    }
    list.add(r1.value);
  }
  return Result(list);
}''';

  @override
  Map<String, Object?> get values => {
        'O': O,
        'p1': parser,
      };
}

class Many1<I, O> extends ParserBuilder<I, List<O>> {
  final ParserBuilder<I, O> parser;

  const Many1(this.parser);

  @override
  String get template => '''
{
  final list = <{{O}}>[];
  while (true) {
    final r1 = {{p1}};
    if (r1 == null) {
      break;
    }
    list.add(r1.value);
  }
  if (list.isEmpty) {
    return nul;;
  }
  return Result(list);
}''';

  @override
  Map<String, Object?> get values => {
        'O': O,
        'p1': parser,
      };
}
