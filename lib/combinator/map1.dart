import '../parser_builder.dart';

class Map1<I, O, O1> extends ParserBuilder<I, O> {
  final FunctionBuilder<O> f;

  final ParserBuilder<I, O1> parser;

  const Map1(this.parser, this.f);

  @override
  String getTemplate(BuildContext context) => '''
final r1 = {{p1}};
if (r1 == null) {
  return null;
}
final v = {{f}}(r1.value);
return Result(v);''';

  @override
  Map<String, Object?> getValues(BuildContext context) => {
        'f': f,
        'p1': parser,
      };
}
