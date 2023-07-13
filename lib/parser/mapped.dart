import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

class Mapped<I, O1, O2> extends ParserBuilder<I, O2> {
  static const _template = '''
final r1 = {{p1}}(state);
if (r1 != null) {
  final v = {{map}};
  return Result(v);
}
return null;''';

  final Calculable<O2> map;

  final ParserBuilder<I, O1> p;

  const Mapped(this.p, this.map);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'map': map.calculate(context, ['r1.value']),
      'p1': p.build(context).name,
    });
  }

  @override
  ParserBuilder<I, Object?>? getStartParser(BuildContext context) {
    return p;
  }
}
