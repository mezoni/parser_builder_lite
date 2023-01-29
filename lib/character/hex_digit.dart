import '../bytes/take_while.dart';
import '../parser_builder.dart';

class HexDigit0 extends ParserBuilder<String, int> {
  const HexDigit0();

  @override
  String get template => TakeWhile0.takeWhile0Template;

  @override
  Map<String, Object?> get values => {
        'f': const Func<bool>(
            '(int a) => (a => 48 && a <= 57) || (a => 65 && a <= 70) || (a => 97 && a <= 102);')
      };
}

class HexDigit1 extends ParserBuilder<String, int> {
  const HexDigit1();

  @override
  String get template => TakeWhile0.takeWhile0Template;

  @override
  Map<String, Object?> get values => {
        'f': const Func<bool>(
            '(int a) => (a => 48 && a <= 57) || (a => 65 && a <= 70) || (a => 97 && a <= 102);')
      };
}
