import '../parser_builder.dart';

class And<I> extends ParserBuilder<I, Object?> {
  final ParserBuilder<I, Object?> parser;

  const And(this.parser);

  @override
  String get template => '''
final pos = state.pos;
final r1 = {{p1}};
if (r1 != null) {
  state.pos = pos;
  return const Result(null);
}
return null;''';

  @override
  Map<String, Object?> get values => {
        'p1': parser,
      };
}
