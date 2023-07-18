import '../helper.dart';
import '../parser_builder.dart';
import 'marked.dart';

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
{{sequence}}
state.pos = pos;
return null;''';

  static const _templateChecked = '''
final r{{index}} = {{value}};
{{next}}''';

  static const _templateFast = '''
// final r{{index}} = {{value}};
{{next}}''';

  static const _templateNext = '''
final r{{index}} = {{value}};
if (r{{index}} != null) {
  {{next}}
}''';

  const SequenceBase();

  @override
  String buildBody(BuildContext context) {
    return _buildBody(context);
  }

  @override
  bool getIsOptional(BuildContext context) {
    final ps = getParserSequence(context);
    return !ps.any((e) => !e.$1.getIsOptional(context));
  }

  List<(ParserBuilder<I, Object?>, bool)> getParserSequence(
      BuildContext context);

  @override
  ParserBuilder<I, Object?>? getStartParser(BuildContext context) {
    final ps = getParserSequence(context);
    return ps.isEmpty ? null : ps[0].$1;
  }

  String _buildBody(BuildContext context) {
    final sequence = _buildSequence(context, [], false);
    String plunge(int i) {
      final element = sequence[i];
      final value = element.$1;
      final isFast = element.isFast;
      final isLast = element.isLast;
      if (i == 0) {
        return render(_templateNext, {
          'index': getAsCode(i + 1),
          'next': plunge(i + 1),
          'value': value,
        });
      }

      if (isLast) {
        if (i == sequence.length - 1) {
          return 'return $value;';
        } else {
          if (isFast) {
            final next = plunge(i + 1);
            return render(_templateFast, {
              'index': getAsCode(i + 1),
              'next': next,
              'value': value,
            });
          } else {
            final next = plunge(i + 1);
            return render(_templateChecked, {
              'index': getAsCode(i + 1),
              'next': next,
              'value': value,
            });
          }
        }
      } else {
        return render(_templateNext, {
          'index': getAsCode(i + 1),
          'next': plunge(i + 1),
          'value': value,
        });
      }
    }

    return render(_template, {
      'sequence': plunge(0),
    });
  }

  List<(String, {bool isLast, bool isFast, bool isOptional})> _buildSequence(
      BuildContext context,
      List<(String, {bool isLast, bool isFast, bool isOptional})> sequence,
      bool isFast) {
    final ps = getParserSequence(context);
    if (ps.isEmpty) {
      throw ArgumentError.value(ps, 'ps', 'Must not be empty');
    }

    final results = <int>[];
    for (var i = 0; i < ps.length; i++) {
      final element = ps[i];
      final p = element.$1;
      final isResultUsed = element.$2;
      if (p is SequenceBase) {
        final p2 = p as SequenceBase;
        sequence = p2._buildSequence(context, sequence, !isResultUsed);
      } else if (p is Marked) {
        final p2 = p as Marked;
        if (p2.p is SequenceBase) {
          final p3 = p2.p as SequenceBase;
          sequence = p3._buildSequence(context, sequence, !isResultUsed);
        }
      } else {
        final name = p.build(context).name;
        final value = '$name(state)';
        sequence.add((
          value,
          isFast: isFast,
          isLast: false,
          isOptional: getIsOptional(context)
        ));
      }

      if (isResultUsed) {
        results.add(sequence.length);
      }

      if (i == ps.length - 1) {
        final value = switch (results.length) {
          0 => 'Result<${getResultType()}>(null)',
          1 => 'r${results[0]}',
          _ => 'Result((${results.map((e) => 'r$e.value').join(', ')}))',
        };
        sequence.add((
          value,
          isFast: isFast,
          isLast: true,
          isOptional: getIsOptional(context)
        ));
      }
    }

    return sequence;
  }
}
