import '../helper.dart' as helper;
import '../parser_builder.dart';

class NoneOf extends ParserBuilder<String, int> {
  final String chars;

  const NoneOf(this.chars);

  @override
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
    state.pos = pos;
    return state.fail(pos, const ErrorUnexpectedChar());
  }
}
return Result(ch);''';

  @override
  Map<String, Object?> get values => {
        'chars': helper.getAsCode(chars.runes.toList()),
        'length': helper.getAsCode(chars.runes.toList().length),
      };
}
