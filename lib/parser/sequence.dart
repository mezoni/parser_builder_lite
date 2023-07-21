import '../helper.dart';
import '../parser_builder.dart';

class Sequence<I, O> extends SequenceBase<I, O> {
  final List<(ParserBuilder<I, Object?>, bool)> ps;

  const Sequence(this.ps);

  @override
  Iterable<(ParserBuilder<I, Object?>, bool)> getCombinedParsers() {
    return ps;
  }
}

abstract class SequenceBase<I, O> extends ParserBuilder<I, O> {
  static const _template = '''
final @pos = state.pos;
@parsers
if (!state.ok) {
  state.pos = @pos;
}''';

  static const _template2 = '''
final @pos = state.pos;
@parsers''';

  static const _template2Last = '''
@p1
if (state.ok) {
  @r = @value;
} else {
  state.pos = @pos;
}''';

  static const _template2LastNoResult = '''
@p1
if (!state.ok) {
  state.pos = @pos;
}''';

  static const _templateLast = '''
@p1
if (state.ok) {
  @r = @value;
}''';

  static const _templateLastNoResult = '''
@p1''';

  static const _templateNext = '''
@p1
if (state.ok) {
  @next
}''';

  const SequenceBase();

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    final sequence = getCombinedParsers().toList();
    if (sequence.isEmpty) {
      throw ArgumentError.value(sequence, 'sequence', 'Must not be empty');
    }

    if (sequence.length == 1) {
      final template = renderWithPlunge(
        sequence.length,
        hasResult,
        next: _templateLast,
        nextNoResult: _templateLastNoResult,
        fillValues: (index, template, values, next) {
          final element = sequence[index];
          final mode = element.$2 ?? hasResult;
          if (mode) {
            values['value'] = '@rv1';
          } else {
            template = _templateLastNoResult;
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
    } else if (sequence.length == 2) {
      final results = <int>[];
      final templateParsers = renderWithPlunge(
        sequence.length,
        hasResult,
        last: _template2Last,
        lastNoResult: _template2LastNoResult,
        next: _templateNext,
        nextNoResult: _templateNext,
        fillValues: (index, template, values, next) {
          final element = sequence[index];
          final mode = element.$2 ?? hasResult;
          if (mode) {
            results.add(index + 1);
          }

          if (index < sequence.length - 1) {
            values['next'] = next(index + 1);
          } else {
            if (hasResult) {
              if (results.isNotEmpty) {
                values['value'] = switch (results.length) {
                  1 => '@r${results[0]}',
                  _ => '(${results.map((e) => '@rv$e').join(', ')})',
                };
                template = _template2Last;
              } else {
                template = _template2LastNoResult;
              }
            }
          }

          return template;
        },
      );
      final template = render(_template2, {'parsers': templateParsers});
      return renderBody(
        this,
        context,
        hasResult,
        template,
        template,
        const {},
      );
    }

    final results = <int>[];
    final templateSequence = renderWithPlunge(
      sequence.length,
      hasResult,
      last: _templateLast,
      lastNoResult: _templateLastNoResult,
      next: _templateNext,
      nextNoResult: _templateNext,
      fillValues: (index, template, values, next) {
        final element = sequence[index];
        final mode = element.$2 ?? hasResult;
        if (mode) {
          results.add(index + 1);
        }

        if (index < sequence.length - 1) {
          values['next'] = next(index + 1);
        } else {
          if (hasResult) {
            if (results.isNotEmpty) {
              values['value'] = switch (results.length) {
                1 => '@r${results[0]}',
                _ => '(${results.map((e) => '@rv$e').join(', ')})',
              };
              template = _templateLast;
            } else {
              template = _templateLastNoResult;
            }
          }
        }

        return template;
      },
    );

    final template = render(_template, {'parsers': templateSequence});
    return renderBody(
      this,
      context,
      hasResult,
      template,
      template,
      const {},
    );
  }
}
