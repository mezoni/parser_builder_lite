import '../parser_builder.dart';

class Preceded<I, O> extends ParserBuilder<I, O> {
  final ParserBuilder<I, Object?> precede;

  final ParserBuilder<I, O> parser;

  const Preceded(this.precede, this.parser);

  @override
  String get template => '''
{
  final pos = state.pos;
  final r1 = {{p1}};
  if (r1 != null) {
    final r2 = {{p2}};
    if (r2 != null) {
      return r2;
    }
    state.pos = pos;
  }
  return null;
}''';

  @override
  Map<String, Object?> get values => {
        'p1': precede,
        'p2': parser,
      };
}
