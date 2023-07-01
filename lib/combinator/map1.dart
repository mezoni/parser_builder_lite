import '../parser_builder.dart';

class Map1<I, O, O1> extends ParserBuilder<I, O> {
  final FunctionBuilder<O> f;

  final ParserBuilder<I, O1> parser;

  const Map1(this.parser, this.f);

  @override
  String getTemplate(BuildContext context) => '''
return switch ({{p1}}(state)) {
  null => null,
  final r1 => Result({{f}}(r1.value)),
};''';

  @override
  Map<String, String> getValues(BuildContext context) => {
        'f': f.build(context).name,
        'p1': parser.build(context).name,
      };
}
