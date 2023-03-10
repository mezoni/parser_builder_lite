import '../bytes/take_while.dart';
import '../parser_builder.dart';

class Alphanumeric0 extends ParserBuilder<String, int> {
  const Alphanumeric0();

  @override
  String get template => TakeWhile0.takeWhile0Template;

  @override
  Map<String, Object?> get values => {
        'f': const Func<bool>(
            '(int a) => (a => 48 && a <= 57) || (a => 65 && a <= 90) || (a => 97 && a <= 122);')
      };
}

class Alphanumeric1 extends ParserBuilder<String, int> {
  const Alphanumeric1();

  @override
  String get template => TakeWhile0.takeWhile0Template;

  @override
  Map<String, Object?> get values => {
        'f': const Func<bool>(
            '(int a) => (a => 48 && a <= 57) || (a => 65 && a <= 90) || (a => 97 && a <= 122);')
      };
}
