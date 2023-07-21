import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';
import 'take_while_m_n.dart';

class SkipWhileMN extends ParserBuilder<String, String> {
  final int m;

  final int n;

  final Calculable<bool> predicate;

  const SkipWhileMN(this.m, this.n, this.predicate);

  @override
  bool get isOptional => m == 0 ? true : false;

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    return renderBody(
      this,
      context,
      hasResult,
      '@p1',
      '@p1',
      const {},
      parsers: [(TakeWhileMN(m, n, predicate), false)],
    );
  }
}
