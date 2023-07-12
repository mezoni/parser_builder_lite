import '../helper.dart';
import '../parser_builder.dart';

class SeparatedList1<I, O> extends ParserBuilder<I, List<O>> {
  static const _template = '''
var pos = state.pos;
final list = <{{O}}>[];
while (true) {
  final r1 = {{p1}}(state);
  if (r1 == null) {
    state.pos = pos;
    break;
  }
  list.add(r1.value);
  pos = state.pos;
  final r2 = {{p2}}(state);
  if (r2 == null) {
    break;
  }
}
if (list.isNotEmpty) {
  return Result(list);
}
return null;''';

  final ParserBuilder<I, O> p1;

  final ParserBuilder<I, Object?> p2;

  const SeparatedList1(this.p1, this.p2);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'O': '$O',
      'p1': p1.build(context).name,
      'p2': p2.build(context).name,
    });
  }
}
