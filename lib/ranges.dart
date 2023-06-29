import '../helper.dart' as helper;
import 'parser_builder.dart';

class InRangeFunc extends _RangeFunc {
  const InRangeFunc(super.ranges);

  @override
  int get hashCode => ranges.hashCode;

  @override
  bool get negate => false;

  @override
  bool operator ==(other) {
    return other is InRangeFunc && ranges == other.ranges;
  }
}

class NotInRangeFunc extends _RangeFunc {
  const NotInRangeFunc(super.ranges);

  @override
  int get hashCode => ranges.hashCode;

  @override
  bool get negate => true;

  @override
  bool operator ==(other) {
    return other is InRangeFunc && ranges == other.ranges;
  }
}

class _BinarySearch extends FunctionBuilder<int?> {
  static const _template = '''
(int value, List<int> list) {
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
  return result;
}
''';

  const _BinarySearch();

  @override
  String getSource(BuildContext context) => _template;
}

abstract class _RangeFunc extends FunctionBuilder<bool> {
  final List<(int, int)> ranges;

  const _RangeFunc(this.ranges);

  bool get negate;

  @override
  String getSource(BuildContext context) {
    const template = '''
(int c) => {{search}}(c, const {{ranges}}) {{op}} null;''';
    final binarySearch = _buildBinarySearch(context);
    return helper.render(template, {
      'op': negate ? '==' : '!=',
      'ranges': helper.getAsCode(helper.normalizeRanges(ranges)),
      'search': binarySearch.name,
    });
  }

  BuildResult _buildBinarySearch(BuildContext context) {
    const binarySearch = _BinarySearch();
    final cache = context.initializeCache(
        'parser_builder_lite.ranges.in_range_func', <Object?, BuildResult>{});
    final found = cache[binarySearch];
    if (found != null) {
      return found;
    }

    final result = binarySearch.build(context);
    cache[binarySearch] = result;
    return result;
  }
}
