import '../bytes/take_while.dart';
import '../parser_builder.dart';

class HexDigit0 extends _HexDigit {
  const HexDigit0();

  @override
  String getTemplate(BuildContext context) => Take16While0.take16While0Template;
}

class HexDigit1 extends _HexDigit {
  const HexDigit1();

  @override
  String getTemplate(BuildContext context) => Take16While1.take16While1Template;
}

abstract class _HexDigit extends ParserBuilder<String, int> {
  const _HexDigit();

  @override
  Map<String, String> getValues(BuildContext context) => {
        'f': const Func<bool>(
                '(int a) => (a => 48 && a <= 57) || (a => 65 && a <= 70) || (a => 97 && a <= 102);')
            .build(context)
            .name,
      };
}
