import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

class HandleError<I, O> extends ParserBuilder<I, O> {
  static const _template = r'''
final errors = state.errors.toList();
final previous = state.failPos;
state.errors = [];
state.failPos = 0;
final r1 = {{p1}}(state);
final current = state.failPos;
if (current < previous) {
  state.errors = errors;
  state.failPos = previous;
}
if (r1 != null) {
  if (current == previous) {
    state.errors.addAll(errors);
  }
  return r1;
}
if (current < previous) {
  return null;
}
final (bool, List<ParseError>)? v;
v = {{handle}};
if (current == previous) {
  if (v.$1) {
    state.errors = errors;
  } else {
    state.errors.addAll(errors);
  }
} else {
  if (v.$1) {
    state.errors = [];
  }
}
state.errors.addAll(v.$2);
return null;''';

  final Calculable<(bool replace, List<Object?> errors)> handle;

  final ParserBuilder<I, O> p;

  const HandleError(this.p, this.handle);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'p1': p.build(context).name,
      'handle': handle.calculate(context, ['state.pos', 'current']),
    });
  }
}
