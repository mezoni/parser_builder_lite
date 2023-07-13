import '../helper.dart';
import '../parser_builder.dart';

class SwitchTags<O> extends ParserBuilder<String, O> {
  static const _template = '''
final pos = state.pos;
final input = state.input;
if (pos < input.length) {
  final c = input.codeUnitAt(pos);
  {{tests}}
  return state.failAll({{errors}});
}
return state.fail(const ErrorUnexpectedEof());''';

  final List<String> errors;

  final Map<String, String> table;

  const SwitchTags(this.table, this.errors);

  @override
  String buildBody(BuildContext context) {
    if (table.isEmpty) {
      throw ArgumentError.value(
          table, 'table', 'The map of tags must not be empty: $table');
    }

    final map = <int, List<String>>{};
    for (final tag in table.keys) {
      if (tag.isEmpty) {
        throw ArgumentError.value(table, 'table',
            'The map of tags must not contain empty tags: ${table.keys.join(', ')}');
      }

      final c = tag.codeUnitAt(0);
      var list = map[c];
      if (list == null) {
        list = [];
        map[c] = list;
      }

      list.add(tag);
    }

    final branches = <String, String>{};
    for (final c in map.keys) {
      final tags = map[c]!;
      tags.sort((x, y) => y.length.compareTo(x.length));
      final tests = <String, String>{};
      for (final tag in tags) {
        final escaped = escapeString(tag);
        final result = table[tag]!;
        final length = tag.length;
        final isLong = length > 1;
        final branch = 'state.pos += $length;\nreturn $result;';
        final test = 'input.startsWith($escaped, pos)';
        final condition = isLong ? test : '';
        tests[condition] = branch;
      }

      final branch = buildConditional(tests);
      branches['c == $c'] = branch;
    }

    return render(_template, {
      'errors': '[${errors.join(', ')}]',
      'tests': buildConditional(branches),
    });
  }

  @override
  List<(int, int)> getStartCharacters(BuildContext context) {
    final runes = table.keys.map((e) => e.runes.toList());
    if (runes.any((e) => e.isEmpty)) {
      return const [];
    }

    return runes.map((e) => (e[0], e[0])).toList();
  }

  @override
  List<String> getStartErrors(BuildContext context) {
    final runes = table.keys.map((e) => e.runes.toList());
    if (runes.any((e) => e.isEmpty)) {
      return const [];
    }

    return errors;
  }
}
