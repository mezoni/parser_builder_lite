import '../helper.dart';
import '../parser_builder.dart';

class Sequence<I, O> extends SequenceBase<I, O> {
  final List<(ParserBuilder<I, Object?>, bool)> ps;

  const Sequence(this.ps);

  @override
  List<(ParserBuilder<I, Object?>, bool)> getParserSequence(
      BuildContext context) {
    return ps;
  }
}

abstract class SequenceBase<I, O> extends ParserBuilder<I, O> {
  static const _template = '''
final pos = state.pos;
{{next}}
state.pos = pos;
return null;''';

  static const _templateLast = '''
final {{r1}} = {{p1}}(state);
if ({{r1}} != null) {
  return {{r}};
}''';

  static const _templateNext = '''
final {{r1}} = {{p1}}(state);
if ({{r1}} != null) {
  {{next}}
}''';

  const SequenceBase();

  @override
  String buildBody(BuildContext context) {
    final ps = getParserSequence(context);
    if (ps.isEmpty) {
      throw ArgumentError.value(ps, 'ps', 'Must not be empty');
    }

    final values = <String, String>{};
    final results = <String>[];
    for (var i = 0; i < ps.length; i++) {
      final element = ps[i];
      final p = element.$1;
      values['p${i + 1}'] = p.build(context).name;
      if (element.$2) {
        results.add('r${i + 1}');
      }
    }

    final result = switch (results.length) {
      0 => 'Result<${getResultType()}>(null)',
      1 => results[0],
      _ => 'Result((${results.map((e) => '$e.value').join(', ')}))',
    };

    String plunge(int i) {
      if (i < ps.length - 1) {
        return render(_templateNext, {
          'next': plunge(i + 1),
          'p1': '{{p${i + 1}}}',
          'r1': 'r${i + 1}',
        });
      } else {
        return render(_templateLast, {
          'p1': '{{p${i + 1}}}',
          'r1': 'r${i + 1}',
        });
      }
    }

    final template = render(_template, {
      'next': plunge(0),
      'r': result,
    });
    return render(template, values);
  }

  List<(ParserBuilder<I, Object?>, bool)> getParserSequence(
      BuildContext context);

  @override
  ParserBuilder<I, Object?>? getStartParser(BuildContext context) {
    final ps = getParserSequence(context);
    return ps.isEmpty ? null : ps[0].$1;
  }
}
