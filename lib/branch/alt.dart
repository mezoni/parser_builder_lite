import '../helper.dart' as helper;
import '../parser_builder.dart';

class Alt<I, O> extends _Alt<I, O> {
  final List<ParserBuilder<I, O>> parsers;

  const Alt(this.parsers);

  @override
  List<ParserBuilder<I, O>> get _parsers => parsers;
}

class Alt2<I, O> extends _Alt<I, O> {
  final ParserBuilder<I, O> p1;

  final ParserBuilder<I, O> p2;

  const Alt2(this.p1, this.p2);

  @override
  List<ParserBuilder<I, O>> get _parsers => [p1, p2];
}

class Alt3<I, O> extends _Alt<I, O> {
  final ParserBuilder<I, O> p1;

  final ParserBuilder<I, O> p2;

  final ParserBuilder<I, O> p3;

  const Alt3(this.p1, this.p2, this.p3);

  @override
  List<ParserBuilder<I, O>> get _parsers => [p1, p2, p3];
}

class Alt4<I, O> extends _Alt<I, O> {
  final ParserBuilder<I, O> p1;

  final ParserBuilder<I, O> p2;

  final ParserBuilder<I, O> p3;

  final ParserBuilder<I, O> p4;

  const Alt4(this.p1, this.p2, this.p3, this.p4);

  @override
  List<ParserBuilder<I, O>> get _parsers => [p1, p2, p3, p4];
}

class Alt5<I, O> extends _Alt<I, O> {
  final ParserBuilder<I, O> p1;

  final ParserBuilder<I, O> p2;

  final ParserBuilder<I, O> p3;

  final ParserBuilder<I, O> p4;

  final ParserBuilder<I, O> p5;

  const Alt5(this.p1, this.p2, this.p3, this.p4, this.p5);

  @override
  List<ParserBuilder<I, O>> get _parsers => [p1, p2, p3, p4, p5];
}

class Alt6<I, O> extends _Alt<I, O> {
  final ParserBuilder<I, O> p1;

  final ParserBuilder<I, O> p2;

  final ParserBuilder<I, O> p3;

  final ParserBuilder<I, O> p4;

  final ParserBuilder<I, O> p5;

  final ParserBuilder<I, O> p6;

  const Alt6(this.p1, this.p2, this.p3, this.p4, this.p5, this.p6);

  @override
  List<ParserBuilder<I, O>> get _parsers => [p1, p2, p3, p4, p5, p6];
}

class Alt7<I, O> extends _Alt<I, O> {
  final ParserBuilder<I, O> p1;

  final ParserBuilder<I, O> p2;

  final ParserBuilder<I, O> p3;

  final ParserBuilder<I, O> p4;

  final ParserBuilder<I, O> p5;

  final ParserBuilder<I, O> p6;

  final ParserBuilder<I, O> p7;

  const Alt7(this.p1, this.p2, this.p3, this.p4, this.p5, this.p6, this.p7);

  @override
  List<ParserBuilder<I, O>> get _parsers => [p1, p2, p3, p4, p5, p6, p7];
}

abstract class _Alt<I, O> extends ParserBuilder<I, O> {
  const _Alt();

  List<ParserBuilder<I, O>> get _parsers;

  @override
  String getTemplate(BuildContext context) {
    if (_parsers.isEmpty) {
      throw StateError('The parser list must not be empty');
    }

    const template = '''
final r{{n}} = {{p{{n}}}}(state);
if (r{{n}} != null) {
  return r{{n}};
}''';

    final buffer = StringBuffer();
    for (var i = 0; i < _parsers.length; i++) {
      final statements = template.replaceAll('{{n}}', helper.getAsCode(i + 1));
      buffer.writeln(statements);
    }

    buffer.writeln('return null;');
    return buffer.toString();
  }

  @override
  Map<String, String> getValues(BuildContext context) {
    return {
      for (var i = 0; i < _parsers.length; i++)
        'p${i + 1}': _parsers[i].build(context).name
    };
  }
}
