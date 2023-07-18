import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';
import '../ranges.dart';

mixin SatisfyMixin<I, O> implements ParserBuilder<I, O> {
  Calculable<bool> get predicate;

  @override
  List<(int, int)> getStartCharacters(BuildContext context) {
    if (predicate is! InRange || getIsOptional(context)) {
      return const [];
    }

    return toRanges((predicate as InRange).ranges);
  }

  @override
  List<String> getStartErrors(BuildContext context) {
    if (predicate is! InRange || getIsOptional(context)) {
      return const [];
    }

    return ['const ErrorUnexpectedChar()'];
  }
}
