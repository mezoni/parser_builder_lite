import '../expr.dart';
import '../helper.dart';
import '../parser_builder.dart';
import 'choice.dart';

class SmartChoiceEx<I, O> extends ParserBuilder<I, O> {
  static const _template = '''
final int? v = {{peek}};
var flag = {{flag}};
if (v != null) {
  {{cases}}
}
{{choices}}
if (state.pos >= state.input.length) {
  state.fail<{{O}}>(const ErrorUnexpectedEof());
}
return state.failAll({{errors}});''';

  static const _templateNext = '''
if (flag & {{flag}} != 0) {
  final r1 = {{p1}}(state);
  if (r1 != null) {
    return r1;
  }
}''';

  final Expr<int?> peek;

  final List<ParserBuilder<I, O>> ps;

  const SmartChoiceEx(this.peek, this.ps);

  @override
  String buildBody(BuildContext context) {
    final source = _generate(context);
    if (source != null) {
      return source;
    }

    return Choice(ps).buildBody(context);
  }

  String? _generate(BuildContext context) {
    if (ps.length > 64) {
      throw StateError('The number of parsers must not exceed 64');
    }

    ps.take(ps.length - 1).map((e) => checkIsNotOptional(context, e));
    final allErrors = <String>[];
    final known = <ParserBuilder<I, O>>{};
    final unknown = <ParserBuilder<I, O>>{};
    final parserIndexes = <ParserBuilder<I, O>, int>{};
    final parserRanges = <ParserBuilder<I, O>, List<(int, int)>>{};
    for (var i = 0; i < ps.length; i++) {
      final p = ps[i];
      parserIndexes[p] = i;
      final ranges = p.getStartCharacters(context);
      final errors = p.getStartErrors(context);
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
          start == end ? 'v == $start' : 'v >= $start && v <= $end';
      var flag = 0;
      for (final p in ps) {
        final index = parserIndexes[p]!;
        flag |= 1 << index;
      }

      flag |= badFlag;
      branches[condition] = 'flag = 0x${flag.toRadixString(16)};';
    }

    final cases = buildConditional(branches);
    final values = {
      'errors': '[${allErrors.join(', ')}]',
      'flag': '0x${badFlag.toRadixString(16)}',
    };
    final choices = StringBuffer();
    for (var i = 0; i < ps.length; i++) {
      final p = ps[i];
      final key = 'p${i + 2}';
      values[key] = p.build(context).name;
      final flag = 1 << i;
      final source = render(_templateNext, {
        'flag': '0x${flag.toRadixString(16)}',
        'p1': '{{$key}}',
      });
      choices.write(source);
      if (i < ps.length - 1) {
        choices.writeln();
      }
    }

    final template = render(_template, {
      'O': '$O',
      'peek': peek.calculate(context, ['state']),
      'cases': cases.toString(),
      'choices': choices.toString(),
    });
    return render(template, values);
  }
}
