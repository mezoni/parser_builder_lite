import '../helper.dart';
import '../parser_builder.dart';

class ManyMN<I, O> extends ParserBuilder<I, List<O>> {
  static const _template = '''
final @pos = state.pos;
final @list = <@O>[];
while (@list.length < @n) {
  @p1
  if (!state.ok) {
    break;
  }
  @list.add(@rv1);
}
if (state.ok = @list.length >= @m) {
  @r = @list;
} else {
  state.pos = @pos;
}''';

  static const _templateNoResult = '''
final @pos = state.pos;
var @count = 0;
while (@count < @n) {
  @p1
  if (!state.ok) {
    break;
  }
  @count++;
}
if (!(state.ok = @count >= @m)) {
  state.pos = @pos;
}''';

  static const _template0 = '''
final @list = <@O>[];
while (@list.length < @n) {
  @p1
  if (!state.ok) {
    break;
  }
  @list.add(@rv1);
}
if (state.ok = true) {
  @r = @list;
}''';

  static const _template0NoResult = '''
var @count = 0;
while (@count < @n) {
  @p1
  if (!state.ok) {
    break;
  }
  @count++;
}
state.ok = true;''';

  final int m;

  final int n;

  final ParserBuilder<I, O> p;

  const ManyMN(this.m, this.n, this.p);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    RangeError.checkNotNegative(m, 'm');
    if (n < m) {
      throw ArgumentError.value(n, 'n', 'Must be greater than or equal to $m');
    }

    checkIsNotOptional(p);
    return renderBody(
      this,
      context,
      hasResult,
      m == 0 ? _template0 : _template,
      m == 0 ? _template0NoResult : _templateNoResult,
      {
        'O': '$O',
        'm': getAsCode(m),
        'n': getAsCode(n),
      },
    );
  }

  @override
  bool get isOptional {
    return m == 0 ? true : false;
  }

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return [(p, null)];
  }
}
