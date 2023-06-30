import '../parser_builder.dart';

class Opt<I, O> extends ParserBuilder<I, O?> {
  final ParserBuilder<I, O> parser;

  const Opt(this.parser);

  @override
  String getTemplate(BuildContext context) => '''
final r1 = {{p1}}(state);
if (r1 == null) {
  return const Result(null);
}
return Result(r1.value);''';

  @override
  Map<String, String> getValues(BuildContext context) => {
        'p1': parser.build(context).name,
      };
}
