import '../parser_builder.dart';

class Terminated<I, O> extends ParserBuilder<I, O> {
  final ParserBuilder<I, O> parser;

  final ParserBuilder<I, dynamic> terminate;

  const Terminated(this.parser, this.terminate);

  @override
  String getTemplate(BuildContext context) => '''
final pos = state.pos;
final r1 = {{p1}}(state);
if (r1 != null) {
  final r2 = {{p2}}(state);
  if (r2 != null) {
    return r1;
  }
  state.pos = pos;
}
return null;''';

  @override
  Map<String, String> getValues(BuildContext context) => {
        'p1': parser.build(context).name,
        'p2': terminate.build(context).name,
      };
}
