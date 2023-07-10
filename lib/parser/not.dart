import '../helper.dart';
import '../parser_builder.dart';

class Not<I> extends ParserBuilder<I, Object?> {
  static const _template = '''
final pos = state.pos;
final r1 = {{p1}}(state);
if (r1 == null) {
  return const Result<Object?>(null);
}
final length = state.pos - pos;
state.pos = pos;
return state.fail(ErrorUnexpectedInput(length));''';

  final ParserBuilder<I, Object?> p;

  const Not(this.p);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'p1': p.build(context).name,
    });
  }
}
