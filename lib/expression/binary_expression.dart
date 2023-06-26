import '../parser_builder.dart';

class _BinaryExpression<I, O1, O> extends ParserBuilder<I, O> {
  final Func<O> f;

  final ParserBuilder<I, O> left;

  final ParserBuilder<I, O1> operator;

  final ParserBuilder<I, O> right;

  const _BinaryExpression(this.left, this.operator, this.right, this.f);

  @override
  Map<String, Object?> get values => {
        'O': '$O',
        'p1': left,
        'p2': operator,
        'p3': right,
      };

  @override
  String get template => '''
{{O}} left;
final r1 = {{p1}};
if (r1 != null) {
  left = r1;
  while (true) {
    final pos = state.pos;
    final r2 = {{p2}};
    if (r2 == null) {
      state.ok = true;
      break;
    }
    final r3 = {{p3}};
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
}
