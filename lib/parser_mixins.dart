import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';
import '../ranges.dart';

mixin SatisfyMixin<O> implements ParserBuilder<String, O> {
  Calculable<bool> get predicate;

  @override
  Iterable<(int, int)> getStartingCharacters() {
    if (predicate is! InRange || isOptional) {
      return const [];
    }

    return toRanges((predicate as InRange).ranges);
  }

  @override
  Iterable<String> getStartingErrors() {
    if (predicate is! InRange || isOptional) {
      return const [];
    }

    return ['const ErrorUnexpectedChar()'];
  }
}
