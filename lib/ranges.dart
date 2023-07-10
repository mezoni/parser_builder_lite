import '../helper.dart' as helper;
import 'calculable.dart';
import 'function_builder.dart';
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

class _BinarySearch {
  static const _template = '''
if (list.isEmpty) {
  return null;
}
var right = list.length >> 1;
if (right == 1) {
  final start = list[0];
  final end = list[1];
  if (value <= end && value >= start) {
    return value;
  }
  return null;
}
var left = 0;
int? result;
while (left < right) {
  final middle = (left + right) >> 1;
  final index = middle << 1;
  final start = list[index];
  final end = list[index + 1];
  if (value > end) {
    left = middle + 1;
  } else {
    if (value >= start) {
      return value;
    }
    right = middle;
  }
}
return result;''';

  const _BinarySearch();

  String build(BuildContext context) {
    final name = context.allocator.allocate();
    return FunctionBuilder()
        .build(
            context, this, 'int?', name, 'int value, List<int> list', _template)
        .name;
  }
}

abstract class _Range implements Calculable<bool> {
  static const _template = '''
(int c) => {{search}}(c, const {{ranges}}) {{op}} null;''';

  final List<(int, int)> ranges;

  const _Range(this.ranges);

  bool get negate;

  @override
  String calculate(BuildContext context, List<String> arguments) {
    final binarySearch = const _BinarySearch().build(context);
    return helper.render(_template, {
      'op': negate ? '==' : '!=',
      'ranges': helper.getAsCode(helper.normalizeRanges(ranges)),
      'search': binarySearch,
    });
  }
}
