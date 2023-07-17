import '../parser_builder.dart';

class Marked<I, O> extends ParserBuilder<I, O> {
  @override
  final String name;

  final ParserBuilder<I, O> p;

  const Marked(this.name, this.p);

  @override
  String buildBody(BuildContext context) {
    return p.buildBody(context);
  }

  @override
  ParserBuilder<I, Object?>? getStartParser(BuildContext context) {
    return p;
  }

  @override
  String toString() {
    return p.toString();
  }
}
