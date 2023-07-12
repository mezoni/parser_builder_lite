import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

class Unterminated<I, O1, O2, O3> extends ParserBuilder<I, (O1, O2, O3)> {
  static const _template = '''
final errors = state.errors;
final failPos = state.failPos;
final pos = state.pos;
final r1 = {{start}}(state);
if (r1 == null) {
  return null;
}
final r2 = {{p}}(state);
if (r2 != null) {
  final r3 = {{end}}(state);
  if (r3 != null) {
    return Result((r1.value, r2.value, r3.value));
  }
}
state.pos = pos;
if (state.failPos == failPos && state.errors.length == errors.length) {
  return null;
}
return state.failAt(state.failPos, {{handle}});''';
  final ParserBuilder<I, O3> end;

  final Calculable<Object?> handle;

  final ParserBuilder<I, O2> p;

  final ParserBuilder<I, O1> start;

  const Unterminated(this.start, this.p, this.end, this.handle);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'start': start.build(context).name,
      'p': p.build(context).name,
      'end': end.build(context).name,
      'handle': handle.calculate(context, ['pos', 'state.failPos']),
    });
  }
}
