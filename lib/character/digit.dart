import '../bytes/take_while.dart';
import '../parser_builder.dart';

class Digit0 extends _Digit {
  const Digit0();

  @override
  String getTemplate(BuildContext context) => Take16While0.take16While0Template;
}

class Digit1 extends _Digit {
  const Digit1();

  @override
  String getTemplate(BuildContext context) => Take16While1.take16While1Template;
}

abstract class _Digit extends ParserBuilder<String, int> {
  const _Digit();

  @override
  Map<String, String> getValues(BuildContext context) => {
        'f': const Func<bool>('(int a) => (a => 48 && a <= 57);')
            .build(context)
            .name,
      };
}
