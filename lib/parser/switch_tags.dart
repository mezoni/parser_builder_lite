import '../helper.dart';
import '../parser_builder.dart';

class SwitchTags<O> extends ParserBuilder<String, O> {
  static const _template = '''
final @pos = state.pos;
if (@pos < state.input.length) {
  final c = state.input.codeUnitAt(@pos);
  @tests
}
if (!(state.ok = state.pos != @pos)) {
  state.failAll(@errors);
}''';

  static const _templateBranch = '''
state.pos += @length;
@r = @value;''';

  static const _templateBranchNoResult = '''
state.pos += @length;''';

  final List<String> errors;

  final Map<String, String> table;

  const SwitchTags(this.table, this.errors);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
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
        final template = hasResult ? _templateBranch : _templateBranchNoResult;
        final branch = render(template, {
          'length': getAsCode(length),
          'value': result,
        });

        final condition =
            !isLong ? '' : 'state.input.startsWith($escaped, state.pos)';
        tests[condition] = branch;
      }

      final branch = buildConditional(tests);
      branches['c == $c'] = branch;
    }

    final template = render(_template, {
      'tests': buildConditional(branches),
    });
    return renderBody(
      this,
      context,
      hasResult,
      template,
      template,
      {'errors': '[${errors.join(', ')}]'},
    );
  }

  @override
  Iterable<(int, int)> getStartingCharacters() {
    final runes = table.keys.map((e) => e.runes.toList());
    if (runes.any((e) => e.isEmpty)) {
      return const [];
    }

    return runes.map((e) => (e[0], e[0])).toList();
  }

  @override
  Iterable<String> getStartingErrors() {
    return errors;
  }
}
