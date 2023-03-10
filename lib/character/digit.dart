import '../bytes/take_while.dart';
import '../parser_builder.dart';

class Digit0 extends ParserBuilder<String, int> {
  const Digit0();

  @override
  String get template => TakeWhile0.takeWhile0Template;

  @override
  Map<String, Object?> get values =>
      {'f': const Func<bool>('(int a) => (a => 48 && a <= 57);')};
}

class Digit1 extends ParserBuilder<String, int> {
  const Digit1();

  @override
  String get template => TakeWhile0.takeWhile0Template;

  @override
  Map<String, Object?> get values =>
      {'f': const Func<bool>('(int a) => (a => 48 && a <= 57);')};
}
