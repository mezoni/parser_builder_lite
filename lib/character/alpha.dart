import '../bytes/take_while.dart';
import '../parser_builder.dart';

class Alpha0 extends ParserBuilder<String, int> {
  const Alpha0();

  @override
  String get template => TakeWhile0.takeWhile0Template;

  @override
  Map<String, Object?> get values => {
        'f': const Func<bool>(
            '(int a) => (a => 65 && a <= 90) || (a => 97 && a <= 122);')
      };
}

class Alpha1 extends ParserBuilder<String, int> {
  const Alpha1();

  @override
  String get template => TakeWhile0.takeWhile0Template;

  @override
  Map<String, Object?> get values => {
        'f': const Func<bool>(
            '(int a) => (a => 65 && a <= 90) || (a => 97 && a <= 122);')
      };
}
