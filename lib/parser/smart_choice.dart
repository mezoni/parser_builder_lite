import '../helper.dart';
import '../parser_builder.dart';
import 'choice.dart';

class SmartChoice<O> extends ParserBuilder<String, O> {
  static const _template = '''
int? c;
if (state.pos < state.input.length) {
  c = state.input.{{reader}}(state.pos);
}
var flag = {{flag}};
{{cases}}
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

  final List<ParserBuilder<String, O>> ps;

  const SmartChoice(this.ps);

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
      throw StateError('Too many parsers');
    }

    final allErrors = <String>[];
    final bad = <ParserBuilder<String, O>>{};
    final good = <ParserBuilder<String, O>>{};
    final parserIndexes = <ParserBuilder<String, O>, int>{};
    final parserRanges = <ParserBuilder<String, O>, List<(int, int)>>{};
    for (var i = 0; i < ps.length; i++) {
      final p = ps[i];
      parserIndexes[p] = i;
      final ranges = p.getStartCharacters(context);
      final errors = p.getStartErrors(context);
      if (ranges.isEmpty || errors.isEmpty) {
        bad.add(p);
      } else {
        good.add(p);
        allErrors.addAll(errors);
        parserRanges[p] = normalizeRanges(ranges);
      }
    }

    if (good.isEmpty) {
      return null;
    }

    final map = <ParserBuilder<String, O>, List<(int, int)>>{};
    for (final p in good) {
      map[p] = parserRanges[p]!;
    }

    final transitions = makeTransitions(map);
    var badFlag = 0;
    for (final p in bad) {
      final index = parserIndexes[p]!;
      badFlag |= 1 << index;
    }

    var is32bit = bad.isNotEmpty;
    final branches = <String, String>{};
    for (final transition in transitions) {
      final range = transition.$1;
      final ps = transition.$2;
      final start = range.$1;
      final end = range.$2;
      if (start > 0xffff || end > 0xffff) {
        is32bit = true;
      }
      final condition =
          start == end ? 'c == $start' : 'c >= $start && c <= $end';
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
      final key = 'p${i + 1}';
      values[key] = p.build(context).name;
      final flag = 1 << i;
      final source = render(_templateNext, {
        'flag': '0x${flag.toRadixString(16)}',
        'p1': '{{p${i + 1}}}',
      });
      choices.write(source);
      if (i < ps.length - 1) {
        choices.writeln();
      }
    }

    final template = render(_template, {
      'O': '$O',
      'cases': cases.toString(),
      'choices': choices.toString(),
      'reader': is32bit ? 'runeAt' : 'codeUnitAt',
    });
    return render(template, values);
  }
}
