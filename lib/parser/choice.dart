import '../helper.dart';
import '../parser_builder.dart';

class Choice<I, O> extends _Choice<I, O> {
  final List<ParserBuilder<I, O>> ps;

  const Choice(this.ps);

  @override
  List<ParserBuilder<I, O>> get _ps => ps;
}

class Choice2<I, O> extends _Choice<I, O> {
  final ParserBuilder<I, O> p1;

  final ParserBuilder<I, O> p2;

  const Choice2(this.p1, this.p2);

  @override
  List<ParserBuilder<I, O>> get _ps => [p1, p2];
}

class Choice3<I, O> extends _Choice<I, O> {
  final ParserBuilder<I, O> p1;

  final ParserBuilder<I, O> p2;

  final ParserBuilder<I, O> p3;

  const Choice3(this.p1, this.p2, this.p3);

  @override
  List<ParserBuilder<I, O>> get _ps => [p1, p2, p3];
}

class Choice4<I, O> extends _Choice<I, O> {
  final ParserBuilder<I, O> p1;

  final ParserBuilder<I, O> p2;

  final ParserBuilder<I, O> p3;

  final ParserBuilder<I, O> p4;

  const Choice4(this.p1, this.p2, this.p3, this.p4);

  @override
  List<ParserBuilder<I, O>> get _ps => [p1, p2, p3, p4];
}

class Choice5<I, O> extends _Choice<I, O> {
  final ParserBuilder<I, O> p1;

  final ParserBuilder<I, O> p2;

  final ParserBuilder<I, O> p3;

  final ParserBuilder<I, O> p4;

  final ParserBuilder<I, O> p5;

  const Choice5(this.p1, this.p2, this.p3, this.p4, this.p5);

  @override
  List<ParserBuilder<I, O>> get _ps => [p1, p2, p3, p4, p5];
}

class Choice6<I, O> extends _Choice<I, O> {
  final ParserBuilder<I, O> p1;

  final ParserBuilder<I, O> p2;

  final ParserBuilder<I, O> p3;

  final ParserBuilder<I, O> p4;

  final ParserBuilder<I, O> p5;

  final ParserBuilder<I, O> p6;

  const Choice6(this.p1, this.p2, this.p3, this.p4, this.p5, this.p6);

  @override
  List<ParserBuilder<I, O>> get _ps => [p1, p2, p3, p4, p5, p6];
}

class Choice7<I, O> extends _Choice<I, O> {
  final ParserBuilder<I, O> p1;

  final ParserBuilder<I, O> p2;

  final ParserBuilder<I, O> p3;

  final ParserBuilder<I, O> p4;

  final ParserBuilder<I, O> p5;

  final ParserBuilder<I, O> p6;

  final ParserBuilder<I, O> p7;

  const Choice7(this.p1, this.p2, this.p3, this.p4, this.p5, this.p6, this.p7);

  @override
  List<ParserBuilder<I, O>> get _ps => [p1, p2, p3, p4, p5, p6, p7];
}

abstract class _Choice<I, O> extends ParserBuilder<I, O> {
  static const _template = '''
{{next}}
return null;''';

  static const _templateNext = '''
final {{r1}} = {{p1}}(state);
if ({{r1}} != null) {
  return {{r1}};
}''';

  const _Choice();

  List<ParserBuilder<I, O>> get _ps;

  @override
  String buildBody(BuildContext context) {
    final ps = _ps;
    if (_ps.isEmpty) {
      throw ArgumentError.value(_ps, '_ps', 'Must not be empty');
    }

    final buffer = StringBuffer();
    final values = <String, String>{};
    for (var i = 0; i < ps.length; i++) {
      final p = ps[i];
      final source = render(_templateNext, {
        'p1': '{{p${i + 1}}}',
        'r1': 'r${i + 1}',
      });
      buffer.writeln(source);
      final result = p.build(context);
      values['p${i + 1}'] = result.name;
    }

    final template = render(_template, {
      'next': buffer.toString(),
    });
    return render(template, values);
  }
}
