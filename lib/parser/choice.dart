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
  static const _templateLast = '''
@p1
if (state.ok) {
  @r = @r1;
}''';

  static const _templateNext = '''
@p1
if (state.ok) {
  @r = @r1;
} else {
  @next
}''';

  static const _templateLastNoResult = '''
@p1''';

  static const _templateNextNoResult = '''
@p1
if (!state.ok) {
  @next
}''';

  const _Choice();

  @override
  bool get isSequential => false;

  List<ParserBuilder<I, O>> get _ps;

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    final ps = _ps;
    if (_ps.isEmpty) {
      throw ArgumentError.value(_ps, '_ps', 'Must not be empty');
    }

    ps.take(ps.length - 1).map(checkIsNotOptional);
    final template = renderWithPlunge(
      ps.length,
      hasResult,
      last: _templateLast,
      lastNoResult: _templateLastNoResult,
      next: _templateNext,
      nextNoResult: _templateNextNoResult,
      fillValues: (index, template, values, next) {
        if (index < ps.length - 1) {
          values['next'] = next(index + 1);
        }

        return template;
      },
    );

    return renderBody(
      this,
      context,
      hasResult,
      template,
      template,
      const {},
    );
  }

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return _ps.map((e) => (e, null));
  }
}
