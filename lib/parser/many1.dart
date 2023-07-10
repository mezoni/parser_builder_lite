import '../helper.dart';
import '../parser_builder.dart';

class Many1<I, O> extends ParserBuilder<I, List<O>> {
  static const _template = '''
final list = <{{O}}>[];
while (true) {
  final r1 = {{p1}}(state);
  if (r1 == null) {
    break;
  }
  list.add(r1.value);
}
if (list.isNotEmpty) {
  return Result(list);
}
return null;''';

  final ParserBuilder<I, O> p;

  const Many1(this.p);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'O': '$O',
      'p1': p.build(context).name,
    });
  }
}
