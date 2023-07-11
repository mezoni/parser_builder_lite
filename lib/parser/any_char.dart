import '../helper.dart';
import '../parser_builder.dart';

class AnyChar extends ParserBuilder<String, int> {
  static const _template = '''
if (state.pos < state.input.length) {
  final c = state.input.runeAt(state.pos);
  state.pos += c <= 0xffff ? 1 : 2;
  return Result(c);
}
return state.fail(const ErrorUnexpectedEof());''';

  const AnyChar();

  @override
  String buildBody(BuildContext context) {
    return render(_template, const {});
  }
}
