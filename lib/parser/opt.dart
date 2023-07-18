import '../helper.dart';
import '../parser_builder.dart';

class Opt<I, O> extends ParserBuilder<I, O?> {
  static const _template = '''
final r1 = {{p1}}(state);
if (r1 != null) {
  return r1;
}
return const Result(null);''';

  final ParserBuilder<I, O> p;

  const Opt(this.p);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'p1': p.build(context).name,
    });
  }

  @override
  bool isOptional(BuildContext context) {
    return true;
  }
}
