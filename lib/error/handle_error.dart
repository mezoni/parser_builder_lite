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
final pos = state.pos;
final failPos = state.failPos;
final errors = state.errors;
state.errors = [];
state.failPos = -1;
final r1 = {{p1}};
var failPos2 = state.failPos;
if (failPos2 < failPos) {
  state.failPos = failPos;
  state.errors = errors;
} else if (failPos2 == failPos) {
  state.errors.addAll(errors);
}

if (r1 != null) {
  return r1;
}

if (failPos2 < pos) {
  failPos2 = pos;
}

final error = {{f}}(pos, failPos2) as ParseError;
return state.fail(failPos2, error);''';
}
