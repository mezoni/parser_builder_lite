import '../helper.dart' as helper;
import '../parser_builder.dart';

class SwitchTags<O> extends ParserBuilder<String, O> {
  static const _template = '''
final pos = state.pos;
final source = state.source;
if (pos < source.length) {
  final c = source.codeUnitAt(pos);
  {{tests}}
}
return state.fail({{error}});''';

  final String error;

  final Map<String, String> table;

  const SwitchTags(this.table, this.error);

  @override
  String getTemplate(BuildContext context) {
    if (table.isEmpty) {
      throw ArgumentError.value(
          table, 'table', 'The map of tags must not be empty: $this');
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
        final escaped = helper.escapeString(tag);
        final result = table[tag]!;
        final length = tag.length;
        final isLong = length > 1;
        final branch = 'state.pos += $length;\nreturn $result;';
        final test = 'source.startsWith($escaped, pos)';
        final condition = isLong ? test : '';
        tests[condition] = branch;
      }

      final branch = helper.buildConditional(tests);
      branches['c == $c'] = branch;
    }

    return helper.render(_template, {
      'error': error,
      'tests': helper.buildConditional(branches),
    });
  }
}
