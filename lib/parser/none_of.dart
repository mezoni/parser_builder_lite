import '../parser_builder.dart';
import '../ranges.dart';
import 'satisfy.dart';

class NoneOf extends ParserBuilder<String, int> {
  final String chars;

  const NoneOf(this.chars);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    if (chars.isEmpty) {
      throw ArgumentError.value('', chars, 'Must not be empty');
    }

    final ranges = chars.runes.map((e) => (e, e)).toList();
    return Satisfy(NotInRange(ranges)).buildBody(context, hasResult);
  }
}
