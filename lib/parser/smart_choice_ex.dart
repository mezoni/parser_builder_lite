import '../expr.dart';
import '../helper.dart';
import '../parser_builder.dart';
import 'choice.dart';

class SmartChoiceEx<I, O> extends ParserBuilder<I, O> {
  static const _template = '''
final int? @v = @peek;
var @flag = @mask;
if (@v != null) {
  @prepare
}
state.ok = false;
@parsers
if (!state.ok) {
  state.failAll(@errors);
}''';

  static const _templateLast = '''
if (@flag & @mask != 0) {
  @p1
  if (state.ok) {
    @r = @rv1;
  }
}''';

  static const _templateLastNoResult = '''
if (@flag & @mask != 0) {
  @p1
}''';

  static const _templateNext = '''
if (@flag & @mask != 0) {
  @p1
  if (state.ok) {
    @r = @rv1;
  }
}
if (!state.ok) {
  @next
}''';

  static const _templateNextNoResult = '''
if (@flag & @mask != 0) {
  @p1
}
if (!state.ok) {
  @next
}''';

  final Expr<int?> peek;

  final List<ParserBuilder<I, O>> ps;

  const SmartChoiceEx(this.peek, this.ps);

  @override
  bool get isSequential => false;

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    final result = _generate(context, hasResult);
    if (result != null) {
      return result;
    }

    return Choice(ps).buildBody(context, hasResult);
  }

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return ps.map((e) => (e, null));
  }

  BuildBodyResult? _generate(BuildContext context, bool hasResult) {
    if (ps.length > 64) {
      throw StateError('The number of parsers must not exceed 64');
    }

    ps.take(ps.length - 1).map(checkIsNotOptional);
    final allErrors = <String>[];
    final known = <ParserBuilder<I, O>>{};
    final unknown = <ParserBuilder<I, O>>{};
    final parserIndexes = <ParserBuilder<I, O>, int>{};
    final parserRanges = <ParserBuilder<I, O>, List<(int, int)>>{};
    for (var i = 0; i < ps.length; i++) {
      final p = ps[i];
      parserIndexes[p] = i;
      final ranges = p.getStartingCharacters().toList();
      final errors = p.getStartingErrors();
      if (ranges.isEmpty || errors.isEmpty) {
        unknown.add(p);
      } else {
        known.add(p);
        allErrors.addAll(errors);
        parserRanges[p] = normalizeRanges(ranges);
      }
    }

    if (known.isEmpty) {
      return null;
    }

    final map = <ParserBuilder<I, O>, List<(int, int)>>{};
    for (final p in known) {
      map[p] = parserRanges[p]!;
    }

    final transitions = makeTransitions(map);
    var badFlag = 0;
    for (final p in unknown) {
      final index = parserIndexes[p]!;
      badFlag |= 1 << index;
    }

    final branches = <String, String>{};
    for (final transition in transitions) {
      final range = transition.$1;
      final ps = transition.$2;
      final start = range.$1;
      final end = range.$2;
      final condition =
          start == end ? '@v == $start' : '@v >= $start && @v <= $end';
      var flag = 0;
      for (final p in ps) {
        final index = parserIndexes[p]!;
        flag |= 1 << index;
      }

      flag |= badFlag;
      branches[condition] = '@flag = 0x${flag.toRadixString(16)};';
    }

    final prepare = buildConditional(branches);
    final choices = renderWithPlunge(
      ps.length,
      hasResult,
      last: _templateLast,
      lastNoResult: _templateLastNoResult,
      next: _templateNext,
      nextNoResult: _templateNextNoResult,
      fillValues: (index, template, values, next) {
        final flag = 1 << index;
        values['mask'] = '0x${flag.toRadixString(16)}';
        if (index < ps.length - 1) {
          values['next'] = next(index + 1);
        }

        return template;
      },
    );

    final template = render(_template, {
      'O': '$O',
      'errors': '[${allErrors.join(', ')}]',
      'mask': '0x${badFlag.toRadixString(16)}',
      'peek': peek.calculate(context, ['state']),
      'prepare': prepare.toString(),
      'parsers': choices.toString(),
    });

    return renderBody(
      this,
      context,
      hasResult,
      template,
      template,
      {
        'O': '$O',
        'peek': peek.calculate(context, ['state']),
        'prepare': prepare.toString(),
        'parsers': choices.toString(),
      },
    );
  }
}
