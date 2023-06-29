import '../parser_builder.dart';

class Recognize extends ParserBuilder<String, String> {
  final ParserBuilder<String, Object?> parser;

  const Recognize(this.parser);

  @override
  String getTemplate(BuildContext context) => '''
final start = state.pos;
final r1 = {{p1}};
if (r1 == null) {
  return null;
}
if (state.pos == start) {
  return const Result('');
}
return Result(state.source.substring(start, state.pos));''';

  @override
  Map<String, Object?> getValues(BuildContext context) => {
        'p1': parser,
      };
}
