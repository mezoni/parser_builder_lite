import '../parser_builder.dart';

class Map1<I, O, O1> extends ParserBuilder<I, O> {
  final Func<O> f;

  final ParserBuilder<I, O1> parser;

  const Map1(this.parser, this.f);

  @override
  String get template => '''
final r1 = {{p1}};
if (r1 == null) {
  return null;
}
final v = {{f}}(r1.value);
return Result(v);''';

  @override
  Map<String, Object?> get values => {
        'f': f,
        'p1': parser,
      };
}
