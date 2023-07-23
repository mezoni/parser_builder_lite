import '../helper.dart';
import '../parser_builder.dart';
import 'named.dart';

class Memoize<I, O> extends ParserBuilder<I, O> {
  static const _template = '''
final @v = state.memoized(@id, state.pos);
if (@v != null) {
  state.ok = @v.ok;
  state.pos = @v.end;
  @r = @v.result as @O;
} else {
  final @pos = state.pos;
  @p1
  state.memoize(@id, @pos, state.pos, state.ok, @r1);
  @r = @r1;
}''';

  static const _templateNoResult = '''
final @v = state.memoized(@id, state.pos);
if (@v != null) {
  state.ok = @v.ok;
  state.pos = @v.end;  
} else {
  final @pos = state.pos;
  @p1
  state.memoize(@id, @pos, state.pos, state.ok, null);
}''';

  final Named<I, O> p;

  const Memoize(this.p);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    final cache = context
        .initializeCache('parser_builder_lite.memoize', <Object?, int>{});
    var id = 0;
    if (cache.containsKey(p)) {
      id = cache[p]!;
    } else {
      id = cache.length;
      cache[p] = id;
    }

    return renderBody(
      this,
      context,
      hasResult,
      _template,
      _templateNoResult,
      {'id': getAsCode(id), 'O': getResultType()},
    );
  }

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return [(p, null)];
  }
}
