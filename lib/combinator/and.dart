import '../parser_builder.dart';

class And<I> extends ParserBuilder<I, Object?> {
  final ParserBuilder<I, Object?> parser;

  const And(this.parser);

  @override
  String getTemplate(BuildContext context) => '''
final pos = state.pos;
final r1 = {{p1}}(state);
if (r1 != null) {
  state.pos = pos;
  return const Result(null);
}
return null;''';

  @override
  Map<String, String> getValues(BuildContext context) => {
        'p1': parser.build(context).name,
      };
}
