import '../helper.dart';
import '../parser_builder.dart';

class ManyCount<I> extends ParserBuilder<I, int> {
  static const _template = '''
var count = 0;
while (true) {
  final r1 = {{p1}}(state);
  if (r1 == null) {
    break;
  }
  count++;
}
return Result(count);''';

  final ParserBuilder<I, Object?> p;

  const ManyCount(this.p);

  @override
  String buildBody(BuildContext context) {
    checkIsNotOptional(context, p);
    return render(_template, {
      'p1': p.build(context).name,
    });
  }

  @override
  bool getIsOptional(BuildContext context) {
    return true;
  }
}
