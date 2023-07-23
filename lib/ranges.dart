import 'calculable.dart';
import 'expr.dart';
import 'helper.dart';
import 'parser_builder.dart';

class InRange extends _Range {
  const InRange(super.ranges);

  @override
  bool get negate => false;
}

class InRangeExcept implements Calculable<bool> {
  final List<Object> ranges;

  final List<Object> except;

  const InRangeExcept(this.ranges, this.except);

  @override
  String calculate(BuildContext context, List<String> arguments) {
    return [
      NotInRange(except).calculate(context, arguments),
      InRange(ranges).calculate(context, arguments)
    ].join(' && ');
  }
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
    final newRanges = toRanges(ranges);
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
