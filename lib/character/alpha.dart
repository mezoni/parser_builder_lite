import '../bytes/take_while.dart';
import '../parser_builder.dart';

class Alpha0 extends _Alpha0 {
  const Alpha0();

  @override
  String getTemplate(BuildContext context) => Take16While0.take16While0Template;
}

class Alpha1 extends _Alpha0 {
  const Alpha1();

  @override
  String getTemplate(BuildContext context) => Take16While1.take16While1Template;
}

abstract class _Alpha0 extends ParserBuilder<String, int> {
  const _Alpha0();

  @override
  Map<String, String> getValues(BuildContext context) => {
        'f': const Func<bool>(
                '(int a) => (a => 65 && a <= 90) || (a => 97 && a <= 122);')
            .build(context)
            .name
      };
}
