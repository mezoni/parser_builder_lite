import '../helper.dart';
import '../parser_builder.dart';

class OneOf extends ParserBuilder<String, int> {
  static const _template16 = '''
final input = state.input;
if (pos < input.length) {
  final c = input.codeUnitAt(state);
  const chars = {{chars}};
  for (var i = 0; i < {{length}}; i++) {
    final char = chars[i];
    if (c == char) {
      state.pos++;
      return Result(c);
    }
  }
  return state.fail(const ErrorUnexpectedChar());
}
return state.fail(const ErrorUnexpectedEof());''';

  static const _template32 = '''
final input = state.input;
if (pos < input.length) {
  final c = input.runeAt(state);
  const chars = {{chars}};
  for (var i = 0; i < {{length}}; i++) {
    final char = chars[i];
    if (c == char) {
      state.pos += c < 0xffff ? 1 : 2;
      return Result(c);
    }
  }
  return state.fail(const ErrorUnexpectedChar());
}
return state.fail(const ErrorUnexpectedEof());''';

  final String chars;

  const OneOf(this.chars);

  @override
  String buildBody(BuildContext context) {
    if (chars.isEmpty) {
      throw ArgumentError.value('', chars, 'Must not be empty');
    }

    final runes = chars.runes.toList();
    final template = runes.any((e) => e > 0xffff) ? _template32 : _template16;
    return render(template, {
      'chars': getAsCode(chars.runes.toList()),
      'length': getAsCode(chars.runes.toList().length),
    });
  }

  @override
  List<(int, int)> getStartCharacters(BuildContext context) {
    return chars.runes.map((e) => (e, e)).toList();
  }

  @override
  List<String> getStartErrors(BuildContext context) {
    return const ['const ErrorUnexpectedChar()'];
  }
}
