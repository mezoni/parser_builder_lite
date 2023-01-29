import '../parser_builder.dart';

class HandleError<I, O> extends ParserBuilder<I, O> {
  final Func<Object?> f;

  final ParserBuilder<I, O> parser;

  const HandleError(this.parser, this.f);

  @override
  Map<String, Object?> get values => {
        'f': f,
        'p1': parser,
      };

  @override
  String get template => '''
{
  final failPos = state.failPos;
  final errors = state.errors;
  state.errors = [];
  state.failPos = -1;
  final r1 = {{p1}};
  if (r1 != null) {
    return r1;
  }
  if (state.failPos >= failPos) {
    final error = {{f}}(state) as ParseError;
    if (state.failPos == failPos) {
      state.errors.addAll(errors);
    }
    return state.fail(error);
  } else {
    state.failPos = failPos;
    state.errors = [];
    state.errors.addAll(errors);
  }
  return null;
}''';
}
