import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';
import '../ranges.dart';

mixin SatisfyMixin {
  Calculable<bool> get predicate;

  List<(int, int)> getStartCharacters(BuildContext context) {
    if (predicate is! InRange) {
      return const [];
    }

    return toRanges((predicate as InRange).ranges);
  }

  List<String> getStartErrors(BuildContext context) {
    return ['const ErrorUnexpectedChar()'];
  }
}
