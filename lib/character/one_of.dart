import '../helper.dart' as helper;
import '../parser_builder.dart';

class OneOf extends ParserBuilder<String, int> {
  final String chars;

  const OneOf(this.chars);

  @override
  String get template => '''
{
  final pos = state.pos;
  final source = state.source;
  if (pos >= source.length) {
    final error = ErrorUnexpectedEof(pos);
    return state.fail(error);
  }
  final ch = source.readRune(state);
  final chars = const {{chars}};
  for (var i = 0; i < {{length}}; i++) {
    final c = chars[i];
    if (ch == c) {
      return Result(ch);
    }
  }
  state.pos = pos;
  final error = ErrorUnexpectedChar(pos, source);
  return state.fail(error);
}''';

  @override
  Map<String, Object?> get values => {
        'chars': helper.getAsCode(chars.runes.toList()),
        'length': helper.getAsCode(chars.runes.toList().length),
      };
}
