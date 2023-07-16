import '../helper.dart';
import '../parser_builder.dart';

class PeekChar extends ParserBuilder<String, int> {
  static const _template = '''
if (state.pos < state.input.length) {
  final c = state.input.runeAt(state.pos);
  return Result(c);
}
return state.fail(const ErrorUnexpectedEof());''';

  const PeekChar();

  @override
  String buildBody(BuildContext context) {
    return render(_template, {});
  }
}
