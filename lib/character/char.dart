import '../helper.dart' as helper;
import '../parser_builder.dart';

class Char extends ParserBuilder<String, int> {
  final int char;

  const Char(this.char);

  @override
  // TODO: Add 16 bit version
  String getTemplate(BuildContext context) => '''
final pos = state.pos;
if (pos >= state.source.length) {
  return state.fail(const UnexpectedEof());
}
final c = state.source.readRune(state);
if (c == {{char}}) {
  return const Result({{char}});
}
state.pos = pos;
return state.fail(const ErrorExpectedChar({{char}}));''';

  @override
  Map<String, String> getValues(BuildContext context) => {
        'char': helper.getAsCode(char),
      };
}
