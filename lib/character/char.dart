import '../helper.dart' as helper;
import '../parser_builder.dart';

class Char extends ParserBuilder<String, int> {
  final int char;

  const Char(this.char);

  @override
  // TODO: Add 16 bit version
  String getTemplate(BuildContext context) => '''
final source = state.source;
final pos = state.pos;
if (state.pos >= source.length) {
  return state.fail(state.pos, const UnexpectedEof());
}
final c = source.readRune(state);
if (c == {{char}}) {
  return const Result({{char}});
}
return state.fail(pos, const ErrorExpectedChar({{char}}));''';

  @override
  Map<String, String> getValues(BuildContext context) => {
        'char': helper.getAsCode(char),
      };
}
