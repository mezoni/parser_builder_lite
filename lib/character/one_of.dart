import '../helper.dart' as helper;
import '../parser_builder.dart';

class OneOf extends ParserBuilder<String, int> {
  final String chars;

  const OneOf(this.chars);

  @override
  // TODO: Add 16 bit version
  String get template => '''
final pos = state.pos;
final source = state.source;
if (pos >= source.length) {
  return state.fail(pos, const ErrorUnexpectedEof());
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
return state.fail(pos, const ErrorUnexpectedChar());''';

  @override
  Map<String, Object?> get values => {
        'chars': helper.getAsCode(chars.runes.toList()),
        'length': helper.getAsCode(chars.runes.toList().length),
      };
}
