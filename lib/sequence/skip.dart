import '../parser_builder.dart';

class Skip<I> extends _Skip<I> {
  final List<ParserBuilder<I, Object?>> parsers;

  const Skip(this.parsers);

  @override
  List<ParserBuilder<I, Object?>> get _parsers => parsers;
}

class Skip2<I> extends _Skip<I> {
  final ParserBuilder<I, Object?> p1;

  final ParserBuilder<I, Object?> p2;

  const Skip2(this.p1, this.p2);

  @override
  List<ParserBuilder<I, Object?>> get _parsers => [p1, p2];
}

class Skip3<I> extends _Skip<I> {
  final ParserBuilder<I, Object?> p1;

  final ParserBuilder<I, Object?> p2;

  final ParserBuilder<I, Object?> p3;

  const Skip3(this.p1, this.p2, this.p3);

  @override
  List<ParserBuilder<I, Object?>> get _parsers => [p1, p2, p3];
}

class Skip4<I> extends _Skip<I> {
  final ParserBuilder<I, Object?> p1;

  final ParserBuilder<I, Object?> p2;

  final ParserBuilder<I, Object?> p3;

  final ParserBuilder<I, Object?> p4;

  const Skip4(this.p1, this.p2, this.p3, this.p4);

  @override
  List<ParserBuilder<I, Object?>> get _parsers => [p1, p2, p3, p4];
}

class Skip5<I> extends _Skip<I> {
  final ParserBuilder<I, Object?> p1;

  final ParserBuilder<I, Object?> p2;

  final ParserBuilder<I, Object?> p3;

  final ParserBuilder<I, Object?> p4;

  final ParserBuilder<I, Object?> p5;

  const Skip5(this.p1, this.p2, this.p3, this.p4, this.p5);

  @override
  List<ParserBuilder<I, Object?>> get _parsers => [p1, p2, p3, p4, p5];
}

class Skip6<I> extends _Skip<I> {
  final ParserBuilder<I, Object?> p1;

  final ParserBuilder<I, Object?> p2;

  final ParserBuilder<I, Object?> p3;

  final ParserBuilder<I, Object?> p4;

  final ParserBuilder<I, Object?> p5;

  final ParserBuilder<I, Object?> p6;

  const Skip6(this.p1, this.p2, this.p3, this.p4, this.p5, this.p6);

  @override
  List<ParserBuilder<I, Object?>> get _parsers => [p1, p2, p3, p4, p5, p6];
}

class Skip7<I> extends _Skip<I> {
  final ParserBuilder<I, Object?> p1;

  final ParserBuilder<I, Object?> p2;

  final ParserBuilder<I, Object?> p3;

  final ParserBuilder<I, Object?> p4;

  final ParserBuilder<I, Object?> p5;

  final ParserBuilder<I, Object?> p6;

  final ParserBuilder<I, Object?> p7;

  const Skip7(this.p1, this.p2, this.p3, this.p4, this.p5, this.p6, this.p7);

  @override
  List<ParserBuilder<I, Object?>> get _parsers => [p1, p2, p3, p4, p5, p6, p7];
}

abstract class _Skip<I> extends ParserBuilder<I, Object?> {
  const _Skip();

  List<ParserBuilder<I, Object?>> get _parsers;

  @override
  String getTemplate(BuildContext context) {
    final parsers = _parsers;
    if (parsers.isEmpty) {
      throw StateError('The parser list must not be empty');
    }

    void plunge(int index, StringBuffer buffer) {
      final i = index + 1;
      buffer.writeln('final r$i = {{p$i}}(state);');
      buffer.writeln('if (r$i != null) {');
      if (index < parsers.length - 1) {
        plunge(index + 1, buffer);
      } else {
        buffer.writeln('return const Result(null);');
      }

      buffer.writeln('}');
    }

    final buffer = StringBuffer();
    buffer.writeln('final pos = state.pos;');
    plunge(0, buffer);
    buffer.writeln('state.pos = pos;');
    buffer.writeln('return null;');
    return buffer.toString();
  }

  @override
  Map<String, String> getValues(BuildContext context) {
    final parsers = _parsers;
    if (parsers.isEmpty) {
      throw StateError('The parser list must not be empty');
    }

    final result = <String, String>{};
    for (var i = 0; i < parsers.length; i++) {
      final parser = parsers[i];
      result['p${i + 1}'] = parser.build(context).name;
    }

    return result;
  }
}
