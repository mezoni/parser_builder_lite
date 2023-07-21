import '../parser_builder.dart';
import '../ranges.dart';
import 'satisfy.dart';

class OneOf extends ParserBuilder<String, int> {
  final String chars;

  const OneOf(this.chars);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    if (chars.isEmpty) {
      throw ArgumentError.value('', chars, 'Must not be empty');
    }

    final ranges = chars.runes.map((e) => (e, e)).toList();
    return Satisfy(InRange(ranges)).buildBody(context, hasResult);
  }

  @override
  Iterable<(int, int)> getStartingCharacters() {
    return chars.runes.map((e) => (e, e));
  }

  @override
  Iterable<String> getStartingErrors() {
    return const ['const ErrorUnexpectedChar()'];
  }
}
