import '../helper.dart';
import '../parser_builder.dart';

class Char extends ParserBuilder<String, int> {
  static const _template16 = '''
if (state.pos < state.source.length) {
  final c = state.source.codeUnitAt(state.pos);
  if (c == {{char}}) {
    state.pos++;
    return const Result({{char}});
  }
  return state.fail(const ErrorExpectedChar({{char}}));
}
return state.fail(const ErrorUnexpectedEof());''';

  static const _template32 = '''
if (state.pos < state.source.length) {
  final c = state.source.runeAt(state.pos);
  if (c == {{char}}) {
    state.pos += c <= 0xffff ? 1 : 2;
    return const Result({{char}});
  }
  return state.fail(const ErrorExpectedChar({{char}}));
}
return state.fail(const ErrorUnexpectedEof());''';

  final int char;

  const Char(this.char);

  @override
  String buildBody(BuildContext context) {
    RangeError.checkValidRange(0, char, 0x10ffff, 'char');
    final template = char <= 0xffff ? _template16 : _template32;
    return render(template, {
      'char': getAsCode(char),
    });
  }
}
