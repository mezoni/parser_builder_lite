import '../parser_builder.dart';

class Not<I> extends ParserBuilder<I, Object?> {
  final ParserBuilder<I, Object?> parser;

  const Not(this.parser);

  @override
  String getTemplate(BuildContext context) => '''
final pos = state.pos;
final r1 = {{p1}}(state);
if (r1 == null) {
  return const Result(null);
}
final end = state.pos;
state.pos = pos;
return state.fail(end, ErrorUnexpectedInput(pos));''';

  @override
  Map<String, String> getValues(BuildContext context) => {
        'p1': parser.build(context).name,
      };
}
