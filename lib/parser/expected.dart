import '../helper.dart';
import '../parser_builder.dart';

class Expected<I, O> extends ParserBuilder<I, O> {
  static const _template = r'''
final @failPos = state.failPos;
final @errorCount = state.errorCount;
@p1
if (state.ok) {
  @r = @r1;
} else {
  if (state.canHandleError(@failPos, @errorCount)) {
    if (state.pos == state.failPos) {
      state.clearErrors(@failPos, @errorCount);
      state.fail(const ErrorExpectedTags([@tag]));
    }
  }
}''';

  static const _templateNoResult = r'''
final @failPos = state.failPos;
final @errorCount = state.errorCount;
@p1
if (!state.ok) {
  if (state.canHandleError(@failPos, @errorCount)) {
    if (state.pos == state.failPos) {
      state.clearErrors(@failPos, @errorCount);
      state.fail(const ErrorExpectedTags([@tag]));
    }
  }
}''';

  final String tag;

  final ParserBuilder<I, O> p;

  const Expected(this.tag, this.p);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    return renderBody(
      this,
      context,
      hasResult,
      _template,
      _templateNoResult,
      {
        'tag': escapeString(tag),
      },
    );
  }

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return [(p, null)];
  }

  @override
  Iterable<String> getStartingErrors() {
    return ['const ErrorExpectedTags([${escapeString(tag)}])'];
  }
}
