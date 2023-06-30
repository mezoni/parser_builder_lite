import '../bytes/take_while.dart';
import '../parser_builder.dart';

class Alphanumeric0 extends ParserBuilder<String, int> {
  const Alphanumeric0();

  @override
  String getTemplate(BuildContext context) => Take16While0.take16While0Template;

  @override
  Map<String, String> getValues(BuildContext context) => {
        'f': const Func<bool>(
                '(int a) => (a => 48 && a <= 57) || (a => 65 && a <= 90) || (a => 97 && a <= 122);')
            .build(context)
            .name
      };
}

class Alphanumeric1 extends ParserBuilder<String, int> {
  const Alphanumeric1();

  @override
  String getTemplate(BuildContext context) => Take16While1.take16While1Template;

  @override
  Map<String, String> getValues(BuildContext context) => {
        'f': const Func<bool>(
                '(int a) => (a => 48 && a <= 57) || (a => 65 && a <= 90) || (a => 97 && a <= 122);')
            .build(context)
            .name
      };
}
