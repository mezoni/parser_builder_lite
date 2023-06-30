import '../parser_builder.dart';

class Preceded<I, O> extends ParserBuilder<I, O> {
  final ParserBuilder<I, Object?> precede;

  final ParserBuilder<I, O> parser;

  const Preceded(this.precede, this.parser);

  @override
  String getTemplate(BuildContext context) => '''
final pos = state.pos;
final r1 = {{p1}}(state);
if (r1 != null) {
  final r2 = {{p2}}(state);
  if (r2 != null) {
    return r2;
  }
  state.pos = pos;
}
return null;''';

  @override
  Map<String, String> getValues(BuildContext context) => {
        'p1': precede.build(context).name,
        'p2': parser.build(context).name,
      };
}
