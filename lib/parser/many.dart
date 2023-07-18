import '../helper.dart';
import '../parser_builder.dart';

class Many<I, O> extends ParserBuilder<I, List<O>> {
  static const _template = '''
final list = <{{O}}>[];
while (true) {
  final r1 = {{p1}}(state);
  if (r1 == null) {
    break;
  }
  list.add(r1.value);
}
return Result(list);''';

  final ParserBuilder<I, O> p;

  const Many(this.p);

  @override
  String buildBody(BuildContext context) {
    checkIsNotOptional(context, p);
    return render(_template, {
      'O': '$O',
      'p1': p.build(context).name,
    });
  }

  @override
  bool getIsOptional(BuildContext context) {
    return true;
  }
}
