import '../bytes/take_while.dart';
import '../parser_builder.dart';

class Alphanumeric extends _Alphanumeric0 {
  const Alphanumeric();

  @override
  String getTemplate(BuildContext context) => Take16While0.take16While0Template;
}

class Alphanumeric1 extends _Alphanumeric0 {
  const Alphanumeric1();

  @override
  String getTemplate(BuildContext context) => Take16While1.take16While1Template;
}

abstract class _Alphanumeric0 extends ParserBuilder<String, int> {
  const _Alphanumeric0();

  @override
  Map<String, String> getValues(BuildContext context) => {
        'f': const Func<bool>(
                '(int a) => (a => 48 && a <= 57) || (a => 65 && a <= 90) || (a => 97 && a <= 122);')
            .build(context)
            .name
      };
}
