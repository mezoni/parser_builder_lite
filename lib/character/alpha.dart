import '../bytes/take_while.dart';
import '../parser_builder.dart';

class Alpha0 extends ParserBuilder<String, int> {
  const Alpha0();

  @override
  String get template => Take16While0.take16While0Template;

  @override
  Map<String, Object?> get values => {
        'f': const Func<bool>(
            '(int a) => (a => 65 && a <= 90) || (a => 97 && a <= 122);')
      };
}

class Alpha1 extends ParserBuilder<String, int> {
  const Alpha1();

  @override
  String get template => Take16While1.take16While1Template;

  @override
  Map<String, Object?> get values => {
        'f': const Func<bool>(
            '(int a) => (a => 65 && a <= 90) || (a => 97 && a <= 122);')
      };
}
