import '../helper.dart';
import '../parser_builder.dart';

class Many1Count<I> extends ParserBuilder<I, int> {
  static const _template = '''
var count = 0;
while (true) {
  final r1 = {{p1}}(state);
  if (r1 == null) {
    break;
  }
  count++;
}
if (count != 0) {
  return Result(count);
}
return null;''';

  final ParserBuilder<I, Object?> p;

  const Many1Count(this.p);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'p1': p.build(context).name,
    });
  }
}
