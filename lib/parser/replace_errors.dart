import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

class ReplaceErrors<I, O> extends ParserBuilder<I, O> {
  static const _template = '''
final errors = state.errors.toList();
final failPos = state.failPos;
final r1 = {{p1}}(state);
if (r1 != null) {
  return r1;
}
if (state.failPos == failPos) {
  state.errors = errors;
} else if (state.failPos > failPos) {
  state.errors = [];
} else {
  return null;
}
final error = {{handle}};
return state.failAt(state.failPos, error);''';

  final Calculable<Object?> handle;

  final ParserBuilder<I, O> p;

  const ReplaceErrors(this.p, this.handle);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'handle': handle.calculate(context, ['state.pos', 'state.failPos']),
      'p1': p.build(context).name,
    });
  }
}
