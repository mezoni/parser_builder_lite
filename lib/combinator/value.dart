import '../parser_builder.dart';

class Value<I, O> extends ParserBuilder<I, O> {
  final ParserBuilder<I, Object?> parser;

  final String value;

  const Value(this.value, this.parser);

  @override
  String get template => '''
final r1 = {{p1}};
if (r1 != null) {
  return Result({{value}});
}
return null;''';

  @override
  Map<String, Object?> get values => {
        'p1': parser,
        'value': value,
      };
}
