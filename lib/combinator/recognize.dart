import '../parser_builder.dart';

class Recognize extends ParserBuilder<String, String> {
  final ParserBuilder<String, Object?> parser;

  const Recognize(this.parser);

  @override
  String getTemplate(BuildContext context) => '''
final start = state.pos;
return switch ({{p1}}(state)) {
  null => null,
  _ => switch (state.pos != start) {
    true => Result(state.source.substring(start, state.pos)),
    _ => const Result(''),
  }
};''';

  @override
  Map<String, String> getValues(BuildContext context) => {
        'p1': parser.build(context).name,
      };
}
