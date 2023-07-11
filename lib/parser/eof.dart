import '../helper.dart';
import '../parser_builder.dart';

class Eof extends ParserBuilder<String, Object?> {
  static const _template = '''
if (state.pos >= state.input.length) {
  return const Result(null);
}
return state.fail(const ErrorExpectedEof());''';

  const Eof();

  @override
  String buildBody(BuildContext context) {
    return render(_template, const {});
  }
}
