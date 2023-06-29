import '../parser_builder.dart';

class Delimited<I, O> extends ParserBuilder<I, O> {
  final ParserBuilder<I, Object?> after;

  final ParserBuilder<I, Object?> before;

  final ParserBuilder<I, O> parser;

  const Delimited(this.before, this.parser, this.after);

  @override
  String getTemplate(BuildContext context) => '''
final pos = state.pos;
final r1 = {{p1}};
if (r1 != null) {
  final r2 = {{p2}};
  if (r2 != null) {
    final r3 = {{p3}};
    if (r3 != null) {
      return Result(r2.value);
    }
  }
  state.pos = pos;
}
return null;''';

  @override
  Map<String, Object?> getValues(BuildContext context) => {
        'p1': before,
        'p2': parser,
        'p3': after,
      };
}
