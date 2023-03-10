import '../parser_builder.dart';

class Not<I> extends ParserBuilder<I, Object?> {
  final ParserBuilder<I, Object?> parser;

  const Not(this.parser);

  @override
  String get template => '''
{
  final pos = state.pos;
  final r1 = {{p1}};
  if (r1 == null) {
    return const Result(null);
  }
  final error = ErrorUnexpectedInput(state.pos);
  error.start = pos;
  state.pos = pos;
  return state.fail(error);
}''';

  @override
  Map<String, Object?> get values => {
        'p1': parser,
      };
}
