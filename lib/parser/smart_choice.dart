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
switch (c) {
  {{cases}}
}
{{choices}}
if (state.pos >= state.input.length) {
  state.fail<{{O}}>(const ErrorUnexpectedEof());
}
return state.failAll({{errors}});''';

  static const _templateCase = '''
case {{char}}: // {{comment}}
  flag = {{flag}};
  break;''';

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
      return null;
    }

    var allRanges = <(int, int)>[];
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
        allRanges.addAll(ranges);
        allErrors.addAll(errors);
        parserRanges[p] = normalizeRanges(ranges);
      }
    }

    allRanges = normalizeRanges(allRanges);
    final chars = <int>[];
    for (var i = 0; i < allRanges.length; i++) {
      final range = allRanges[i];
      final start = range.$1;
      final end = range.$2;
      for (var k = start; k <= end; k++) {
        chars.add(k);
        if (chars.length > 24) {
          return null;
        }
      }
    }

    if (chars.isEmpty) {
      return null;
    }

    var badFlag = 0;
    for (final p in bad) {
      final index = parserIndexes[p]!;
      badFlag |= 1 << index;
    }

    final cases = StringBuffer();
    for (var i = 0; i < chars.length; i++) {
      final char = chars[i];
      var flag = 0;
      for (final p in good) {
        final index = parserIndexes[p]!;
        for (final range in parserRanges[p]!) {
          if (char >= range.$1 && char <= range.$2) {
            flag |= 1 << index;
            break;
          }
        }
      }

      flag |= badFlag;
      final source = render(_templateCase, {
        'char': getAsCode(char),
        'comment': getAsCode(String.fromCharCode(char)),
        'flag': '0x${flag.toRadixString(16)}',
      });
      cases.write(source);
      if (i < ps.length - 1) {
        cases.writeln();
      }
    }

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

    final is32bit = chars.any((e) => e > 0xffff);
    final template = render(_template, {
      'O': '$O',
      'cases': cases.toString(),
      'choices': choices.toString(),
      'reader': is32bit ? 'runeAt' : 'codeUnitAt',
    });
    return render(template, values);
  }
}
