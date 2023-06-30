import '../parser_builder.dart';

class _BinaryExpression<I, O1, O> extends ParserBuilder<I, O> {
  final FunctionBuilder<O> f;

  final ParserBuilder<I, O> left;

  final ParserBuilder<I, O1> operator;

  final ParserBuilder<I, O> right;

  const _BinaryExpression(this.left, this.operator, this.right, this.f);

  @override
  String getTemplate(BuildContext context) => '''
{{O}} left;
final r1 = {{p1}}(state);
if (r1 != null) {
  left = r1;
  while (true) {
    final pos = state.pos;
    final r2 = {{p2}}(state);
    if (r2 == null) {
      state.ok = true;
      break;
    }
    final r3 = {{p3}}(state);
    if (r3 == null) {
      state.pos = pos;
      break;
    }
    final op = r2.value;
    final right = r3.value;
    left = {{f}}();
  }
}
if (state.ok) {
  {{res0}} = {{left}};
}''';

  @override
  Map<String, String> getValues(BuildContext context) => {
        'O': '$O',
        'p1': left.build(context).name,
        'p2': operator.build(context).name,
        'p3': right.build(context).name,
      };
}
