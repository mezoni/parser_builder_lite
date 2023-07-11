import 'dart:typed_data';

import '../helper.dart';
import '../parser_builder.dart';

class IntBE extends ParserBuilder<ByteData, int> {
  static const _template = '''
if (state.pos + {{length}} <= state.input.lengthInBytes) {
  final v = state.input.getInt{{size}}(state.pos);
  if (v == {{value}}) {
    state.pos += {{length}};
    return const Result({{value}});
  }
  return state.fail(const ErrorExpectedInt({{size}}, {{value}}));
}
return state.fail(const ErrorUnexpectedEof());''';

  final int size;

  final int value;

  const IntBE(this.size, this.value);

  @override
  String buildBody(BuildContext context) {
    if (!(const [8, 16, 32, 64].contains(size))) {
      throw ArgumentError.value(size, 'size', 'Invalid integer size in bytes');
    }

    RangeError.checkValueInInterval(value, 0, 1 << size);
    return render(_template, {
      'length': getAsCode(size >> 3),
      'size': getAsCode(size),
      'value': getAsCode(value),
    });
  }
}
