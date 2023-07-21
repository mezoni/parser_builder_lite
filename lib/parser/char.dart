import '../helper.dart';
import '../parser_builder.dart';

class Char extends ParserBuilder<String, int> {
  static const _template = '''
if (state.ok = state.pos < state.input.length && state.input.@read(state.pos) == @char) {
  state.pos += @size;
  @r = @char;
} else {
  state.fail(const ErrorExpectedChar(@char));
}''';

  static const _templateNoResult = '''
if (state.ok = state.pos < state.input.length && state.input.@read(state.pos) == @char) {
  state.pos += @size;
} else {
  state.fail(const ErrorExpectedChar(@char));
}''';

  final int char;

  const Char(this.char);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    RangeError.checkValidRange(0, char, 0x10ffff, 'char');
    final reader = getCharReader(char <= 0xffff, 'c');
    return renderBody(
      this,
      context,
      hasResult,
      _template,
      _templateNoResult,
      {
        'char': getAsCode(char),
        'read': reader.name,
        'size': getAsCode(char < 0xffff ? 1 : 2),
      },
    );
  }

  @override
  Iterable<String> getStartingErrors() {
    return ['const ErrorExpectedChar($char)'];
  }

  @override
  Iterable<(int, int)> getStartingCharacters() {
    return [(char, char)];
  }
}
