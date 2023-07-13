import '../helper.dart';
import '../parser_builder.dart';

class ManyMN<I, O> extends ParserBuilder<I, List<O>> {
  static const _template = '''
final pos = state.pos;
final list = <{{O}}>[];
while (list.length < {{n}}) {
  final r1 = {{p1}}(state);
  if (r1 == null) {
    break;
  }
  list.add(r1.value);
}
if (list.length >= {{m}}) {
  return Result(list);
}
state.pos = pos;
return null;''';

  static const _template0 = '''
final list = <{{O}}>[];
while (list.length < {{n}}) {
  final r1 = {{p1}}(state);
  if (r1 == null) {
    break;
  }
  list.add(r1.value);
}
return Result(list);''';

  final int m;

  final int n;

  final ParserBuilder<I, O> p;

  const ManyMN(this.m, this.n, this.p);

  @override
  String buildBody(BuildContext context) {
    RangeError.checkNotNegative(m, 'm');
    if (n < m) {
      throw ArgumentError.value(n, 'n', 'Must be greater than or equal to $m');
    }

    return render(m == 0 ? _template0 : _template, {
      'O': '$O',
      'm': getAsCode(m),
      'n': getAsCode(n),
      'p1': p.build(context).name,
    });
  }

  @override
  ParserBuilder<I, Object?>? getStartParser(BuildContext context) {
    return m < 1 ? null : p;
  }
}
