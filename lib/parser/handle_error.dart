import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

class HandleError<I, O> extends ParserBuilder<I, O> {
  static const _template = r'''
final errors = state.errors.toList();
final failPos = state.failPos;
state.errors = [];
state.failPos = 0;
final r1 = {{p1}}(state);
final failPos2 = state.failPos;
if (failPos2 < failPos) {
  state.errors = errors;
  state.failPos = failPos;
}
if (r1 != null) {
  if (failPos2 == failPos) {
    state.errors.addAll(errors);
  }
  return r1;
}
if (failPos2 < failPos) {
  return null;
}
final v = {{handle}};
if (failPos2 == failPos) {
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
final error = v.$2 as ParseError?;
if (error != null) {
  return state.failAt(state.failPos, error);
}
return null;''';
  final Calculable<(bool replace, Object? error)> handle;

  final ParserBuilder<I, O> p;

  const HandleError(this.p, this.handle);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'p1': p.build(context).name,
      'handle': handle.calculate(context, ['state.pos', 'failPos2']),
    });
  }
}
