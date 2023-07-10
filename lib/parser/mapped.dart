import '../expr.dart';
import '../helper.dart';
import '../parser_builder.dart';

class Mapped<I, O, O1> extends ParserBuilder<I, O> {
  static const _template = '''
final r1 = {{p1}}(state);
if (r1 != null) {
  final v = {{map}};
  return Result(v);
}
return null;''';

  final Expr<O> map;

  final ParserBuilder<I, O1> p;

  const Mapped(this.p, this.map);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'map': map.calculate(context, ['r1.value']),
      'p1': p.build(context).name,
    });
  }
}
