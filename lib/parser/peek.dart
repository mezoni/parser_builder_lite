import '../helper.dart';
import '../parser_builder.dart';

class Peek<I, O> extends ParserBuilder<I, O> {
  static const _template = '''
final pos = state.pos;
final r1 = {{p1}}(state);
if (r1 != null) {
  state.pos = pos;
  return r1;
}
return null;''';

  final ParserBuilder<I, O> p;

  const Peek(this.p);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'p1': p.build(context).name,
    });
  }

  @override
  ParserBuilder<I, O>? getStartParser(BuildContext context) {
    return p;
  }
}
