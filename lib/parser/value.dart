import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

class Value<I, O> extends ParserBuilder<I, O> {
  static const _template = '''
if (state.ok = true) {
  @r = @value;
}''';

  static const _templateParser = '''
@p1
if (state.ok) {
  @r = @value;
}''';

  static const _templateNoResult = '''
state.ok = true;''';

  static const _templateParserNoResult = '''
@p1''';

  final ParserBuilder<I, Object?>? p;

  final Calculable<O> value;

  const Value(this.value, [this.p]);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    return renderBody(
      this,
      context,
      hasResult,
      p == null ? _template : _templateParser,
      p == null ? _templateNoResult : _templateParserNoResult,
      {
        'value': value.calculate(context, ['state']),
      },
    );
  }

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return p == null ? const [] : [(p!, false)];
  }
}
