import '../helper.dart';
import '../parser_builder.dart';

class ConstValue<I, O> extends ParserBuilder<I, O> {
  static const _template = '''
return const Result(value);''';

  static const _templateWithParser = '''
final r1 = {{p1}}(state);
if (r1 != null) {
  return const Result({{value}});
}
return null;''';

  final ParserBuilder<I, Object?>? p;

  final String value;

  const ConstValue(this.value, [this.p]);

  @override
  String buildBody(BuildContext context) {
    if (p == null) {
      return render(_template, {
        'value': value,
      });
    }

    return render(_templateWithParser, {
      'p1': p!.build(context).name,
      'value': value,
    });
  }

  @override
  ParserBuilder<I, Object?>? getStartParser(BuildContext context) {
    return p;
  }
}
