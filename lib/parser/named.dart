import '../parser_builder.dart';

class Named<I, O> extends ParserBuilder<I, O> {
  @override
  final String name;

  final ParserBuilder<I, O> p;

  const Named(this.name, this.p);

  @override
  String buildBody(BuildContext context) {
    return p.buildBody(context);
  }

  @override
  bool getIsOptional(BuildContext context) {
    return p.getIsOptional(context);
  }

  @override
  ParserBuilder<I, Object?>? getStartParser(BuildContext context) {
    return p;
  }

  @override
  String toString() {
    return '$name($p)';
  }
}
