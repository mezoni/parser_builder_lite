import 'calculable.dart';
import 'expr.dart';
import 'helper.dart';
import 'parser_builder.dart';

class InRange extends _Range {
  const InRange(super.ranges);

  @override
  bool get negate => false;
}

class NotInRange extends _Range {
  const NotInRange(super.ranges);

  @override
  bool get negate => true;
}

abstract class _Range implements Calculable<bool> {
  /// The list of ranges. Elements can have the following values:
  /// - int
  /// - String
  /// - (String, String)
  /// - (String, int)
  /// - (int, String)
  /// - (int, int)
  ///
  /// String values must be one character long.
  final List<Object> ranges;

  const _Range(this.ranges);

  bool get negate;

  @override
  String calculate(BuildContext context, List<String> arguments) {
    var newRanges = <(int, int)>[];
    for (final range in ranges) {
      int toInt(String value) {
        final runes = value.runes.toList();
        if (runes.length == 1) {
          return runes[0];
        }

        throw ArgumentError.value(range, 'range', ' Invalid range');
      }

      final newRange = switch (range) {
        final int i => (i, i),
        final String i => (toInt(i), toInt(i)),
        final (String, String) i => (toInt(i.$1), toInt(i.$2)),
        final (String, int) i => (toInt(i.$1), i.$2),
        final (int, String) i => (i.$1, toInt(i.$2)),
        final (int, int) i => (i, i),
        _ => throw '',
      } as (int, int);
      newRanges.add(newRange);
    }

    newRanges = normalizeRanges(newRanges);
    var source = newRanges
        .map((e) => e.$1 == e.$2
            ? '{{0}} == ${e.$1}'
            : '{{0}} >= ${e.$1} && {{0}} <= ${e.$2}')
        .join(' || ');
    if (negate) {
      source = '!($source)';
    }

    return Expr<bool>(source).calculate(context, arguments);
  }
}
