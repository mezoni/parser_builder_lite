import '../helper.dart';
import '../parser_builder.dart';

class Recognize extends ParserBuilder<String, String> {
  static const _template = '''
final pos = state.pos;
final r1 = {{p1}}(state);
if (r1 != null) {
  return state.pos != pos ?
      Result(state.source.substring(pos, state.pos))
      : const Result('');
}
return null;''';

  final ParserBuilder<String, Object?> p;

  const Recognize(this.p);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'p1': p.build(context).name,
    });
  }
}
