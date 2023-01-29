import '../parser_builder.dart';

class _PrefixExpression<I, O1, O> extends ParserBuilder<I, O> {
  final ParserBuilder<I, O> expression;

  final Func<O> f;

  final ParserBuilder<I, O1> operator;

  const _PrefixExpression(this.operator, this.expression, this.f);

  @override
  String get template => '''
{
  final pos = state.pos;
  final r1 = {{p1}};
  final r2 = {{p2}};
  if (r2 != null) {
    if (r1 != null) {
      final v1 = {{val1}};
      final v2 = {{val2}};
      final v3 = {{f}}(r1.value, r2.value);
      return Result(v3);
    } else {
      return Result(r2.value);
    }
  }
  state.pos = pos;
  return null;
}''';

  @override
  Map<String, Object?> get values => {
        'f': f,
        'p1': operator,
        'p2': expression,
      };
}
