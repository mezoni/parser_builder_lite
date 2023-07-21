import '../parser_builder.dart';

class Marked<I, O> extends ParserBuilder<I, O> {
  @override
  final String name;

  final ParserBuilder<I, O> p;

  const Marked(this.name, this.p);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    final body = p.buildBody(context, hasResult);
    final source = body.source;
    final buffer = StringBuffer();
    buffer.writeln(' // => $name');
    buffer.writeln(source);
    buffer.write(' // <= $name');
    return BuildBodyResult(
      result: body.result,
      source: buffer.toString(),
    );
  }

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return [(p, null)];
  }
}
