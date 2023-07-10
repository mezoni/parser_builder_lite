import '../helper.dart';
import '../parser_builder.dart';

class Expected<I, O> extends ParserBuilder<I, O> {
  static const _template = '''
final errors = state.errors.toList();
final failPos = state.failPos;
final r1 = {{p1}}(state);
if (r1 != null) {
  return r1;
}
if (state.failPos != failPos) {
  return null;
}
state.errors = errors;
return state.fail(const ErrorExpectedTags([{{tag}}]));''';
  final String tag;

  final ParserBuilder<I, O> p;

  const Expected(this.tag, this.p);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'p1': p.build(context).name,
      'tag': escapeString(tag),
    });
  }
}
