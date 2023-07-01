import '../parser_builder.dart';

class Opt<I, O> extends ParserBuilder<I, O?> {
  final ParserBuilder<I, O> parser;

  const Opt(this.parser);

  @override
  String getTemplate(BuildContext context) => '''
return switch ({{p1}}(state)) {
  null => const Result(null),
  final r1 => Result(r1.value),
};''';

  @override
  Map<String, String> getValues(BuildContext context) => {
        'p1': parser.build(context).name,
      };
}
