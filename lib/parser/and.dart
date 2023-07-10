import '../helper.dart';
import '../parser_builder.dart';

class And<I> extends ParserBuilder<I, Object?> {
  static const _template = '''
final pos = state.pos;
final r1 = {{p1}}(state);
if (r1 != null) {
  state.pos = pos;
  return const Result<Object?>(null);
}
return null;''';

  final ParserBuilder<I, Object?> p;

  const And(this.p);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'p1': p.build(context).name,
    });
  }
}
