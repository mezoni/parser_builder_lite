// ignore_for_file: non_constant_identifier_names
// ignore_for_file: inference_failure_on_collection_literal
// ignore_for_file: unnecessary_cast

import 'package:test/test.dart' hide escape;

void main() {
  _test();
}

void _test() {
  // And
  _test_And$0();
  // And
  _test_And$1();
  // Char (16-bit)
  _test_Char16bit$0();
  // Char (32-bit)
  _test_Char32bit$0();
  // Choice (2 variants)
  _test_Choice2variants$0();
  // Choice (3 variants)
  _test_Choice3variants$0();
  // Char (16-bit)
  _test_Char16bit$1();
  // Char (32-bit)
  _test_Char32bit$1();
  // Delimited
  _test_Delimited$0();
  // Eof
  _test_Eof$0();
  // Expected
  _test_Expected$0();
  // Many
  _test_Many$0();
  // Many1
  _test_Many1$0();
  // ManyCount
  _test_ManyCount$0();
  // Many1Count
  _test_Many1Count$0();
  // ManyMN (0..3)
  _test_ManyMN03$0();
  // ManyMN (2..3)
  _test_ManyMN23$0();
  // Not
  _test_Not$0();
  // Preceded
  _test_Preceded$0();
  // Tag (short)
  _test_Tagshort$0();
  // Tag (long)
  _test_Taglong$0();
  // Tags
  _test_Tags$0();
  // TakeWhileMN (0..3)
  _test_TakeWhileMN03$0();
  // TakeWhileMN (1..2)
  _test_TakeWhileMN12$0();
  // TakeWhile
  _test_TakeWhile$0();
  // TakeWhile1
  _test_TakeWhile1$0();
  // Terminated
  _test_Terminated$0();
  // Tag (short)
  _test_Tagshort$1();
  // Tag (long)
  _test_Taglong$1();
  // Unterminated
  _test_Unterminated$0();
}

void _test_And$0() {
  // And
  test('And', () {
    final $state$0 = State('01');
    final $result$0 = _And$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 01');
    final $value$0 = $result$0!;
    expect($value$0, 48,
        reason: 'Testing \'result = value\' failed, input: 01');
    expect($state$0.pos, 1, reason: 'Testing \'state.pos\' failed, input: 01');
    final $state$1 = State('01');
    final $result$1 = _And_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 01');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 01');
    expect($state$1.pos, 1, reason: 'Testing \'state.pos\' failed, input: 01');
    final $state$2 = State('');
    final $result$2 = _And$0($state$2);
    expect($state$2.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$2, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$2.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$2.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$3 = State('');
    final $result$3 = _And_NoResult$0($state$3);
    expect($state$3.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$3, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$3.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$3.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$4 = State('1');
    final $result$4 = _And$0($state$4);
    expect($state$4.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 1');
    expect($result$4, null,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$4.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 1');
    expect($state$4.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 1');
    final $state$5 = State('1');
    final $result$5 = _And_NoResult$0($state$5);
    expect($state$5.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 1');
    expect($result$5, null,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$5.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$5.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 1');
    expect($state$5.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 1');
    final $state$6 = State('0');
    final $result$6 = _And$0($state$6);
    expect($state$6.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 0');
    expect($result$6, null,
        reason: 'Testing \'result == null\' failed, input: 0');
    expect($state$6.pos, 0, reason: 'Testing \'state.pos\' failed, input: 0');
    expect($state$6.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: 0');
    expect($state$6.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 0');
    expect($state$6.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 0');
    final $state$7 = State('0');
    final $result$7 = _And_NoResult$0($state$7);
    expect($state$7.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 0');
    expect($result$7, null,
        reason: 'Testing \'result == null\' failed, input: 0');
    expect($state$7.pos, 0, reason: 'Testing \'state.pos\' failed, input: 0');
    expect($state$7.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: 0');
    expect($state$7.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 0');
    expect($state$7.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 0');
  });
}

void _test_And$1() {
  // And
  test('And', () {
    final $state$0 = State('01');
    final $result$0 = _And$1($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 01');
    final $value$0 = $result$0!;
    expect($value$0, 48,
        reason: 'Testing \'result = value\' failed, input: 01');
    expect($state$0.pos, 1, reason: 'Testing \'state.pos\' failed, input: 01');
    final $state$1 = State('01');
    final $result$1 = _And_NoResult$1($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 01');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 01');
    expect($state$1.pos, 1, reason: 'Testing \'state.pos\' failed, input: 01');
    final $state$2 = State('😀');
    final $result$2 = _And$1($state$2);
    expect($state$2.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀');
    final $value$2 = $result$2!;
    expect($value$2, 128512,
        reason: 'Testing \'result = value\' failed, input: 😀');
    expect($state$2.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀');
    final $state$3 = State('😀');
    final $result$3 = _And_NoResult$1($state$3);
    expect($state$3.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀');
    final $value$3 = $result$3;
    expect($value$3, null,
        reason: 'Testing \'result == null\' failed, input: 😀');
    expect($state$3.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀');
    final $state$4 = State('');
    final $result$4 = _And$1($state$4);
    expect($state$4.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$4, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$4.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$4.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$5 = State('');
    final $result$5 = _And_NoResult$1($state$5);
    expect($state$5.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$5, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$5.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$5.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$5.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
  });
}

void _test_Char16bit$0() {
  // Char (16-bit)
  test('Char (16-bit)', () {
    final $state$0 = State('01');
    final $result$0 = _Char16bit$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 01');
    final $value$0 = $result$0!;
    expect($value$0, 48,
        reason: 'Testing \'result = value\' failed, input: 01');
    expect($state$0.pos, 1, reason: 'Testing \'state.pos\' failed, input: 01');
    final $state$1 = State('01');
    final $result$1 = _Char16bit_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 01');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 01');
    expect($state$1.pos, 1, reason: 'Testing \'state.pos\' failed, input: 01');
    final $state$2 = State('');
    final $result$2 = _Char16bit$0($state$2);
    expect($state$2.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$2, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$2.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$2.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$3 = State('');
    final $result$3 = _Char16bit_NoResult$0($state$3);
    expect($state$3.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$3, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$3.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$3.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$4 = State('😀');
    final $result$4 = _Char16bit$0($state$4);
    expect($state$4.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 😀');
    expect($result$4, null,
        reason: 'Testing \'result == null\' failed, input: 😀');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: 😀');
    expect($state$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 😀');
    expect($state$4.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 😀');
    expect($state$4.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 😀');
    final $state$5 = State('😀');
    final $result$5 = _Char16bit_NoResult$0($state$5);
    expect($state$5.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 😀');
    expect($result$5, null,
        reason: 'Testing \'result == null\' failed, input: 😀');
    expect($state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: 😀');
    expect($state$5.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 😀');
    expect($state$5.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 😀');
    expect($state$5.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 😀');
  });
}

void _test_Char32bit$0() {
  // Char (32-bit)
  test('Char (32-bit)', () {
    final $state$0 = State('😀');
    final $result$0 = _Char32bit$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀');
    final $value$0 = $result$0!;
    expect($value$0, 128512,
        reason: 'Testing \'result = value\' failed, input: 😀');
    expect($state$0.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀');
    final $state$1 = State('😀');
    final $result$1 = _Char32bit_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 😀');
    expect($state$1.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀');
    final $state$2 = State('');
    final $result$2 = _Char32bit$0($state$2);
    expect($state$2.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$2, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$2.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$2.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$3 = State('');
    final $result$3 = _Char32bit_NoResult$0($state$3);
    expect($state$3.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$3, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$3.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$3.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$4 = State('01');
    final $result$4 = _Char32bit$0($state$4);
    expect($state$4.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 01');
    expect($result$4, null,
        reason: 'Testing \'result == null\' failed, input: 01');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: 01');
    expect($state$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 01');
    expect($state$4.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 01');
    expect($state$4.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 01');
    final $state$5 = State('01');
    final $result$5 = _Char32bit_NoResult$0($state$5);
    expect($state$5.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 01');
    expect($result$5, null,
        reason: 'Testing \'result == null\' failed, input: 01');
    expect($state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: 01');
    expect($state$5.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 01');
    expect($state$5.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 01');
    expect($state$5.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 01');
  });
}

void _test_Choice2variants$0() {
  // Choice (2 variants)
  test('Choice (2 variants)', () {
    final $state$0 = State('01');
    final $result$0 = _Choice2variants$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 01');
    final $value$0 = $result$0!;
    expect($value$0, 48,
        reason: 'Testing \'result = value\' failed, input: 01');
    expect($state$0.pos, 1, reason: 'Testing \'state.pos\' failed, input: 01');
    final $state$1 = State('01');
    final $result$1 = _Choice2variants_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 01');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 01');
    expect($state$1.pos, 1, reason: 'Testing \'state.pos\' failed, input: 01');
    final $state$2 = State('12');
    final $result$2 = _Choice2variants$0($state$2);
    expect($state$2.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 12');
    final $value$2 = $result$2!;
    expect($value$2, 49,
        reason: 'Testing \'result = value\' failed, input: 12');
    expect($state$2.pos, 1, reason: 'Testing \'state.pos\' failed, input: 12');
    final $state$3 = State('12');
    final $result$3 = _Choice2variants_NoResult$0($state$3);
    expect($state$3.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 12');
    final $value$3 = $result$3;
    expect($value$3, null,
        reason: 'Testing \'result == null\' failed, input: 12');
    expect($state$3.pos, 1, reason: 'Testing \'state.pos\' failed, input: 12');
    final $state$4 = State('');
    final $result$4 = _Choice2variants$0($state$4);
    expect($state$4.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$4, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$4.errorCount, 2,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$4.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    expect($state$4.errors[1], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$5 = State('');
    final $result$5 = _Choice2variants_NoResult$0($state$5);
    expect($state$5.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$5, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$5.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$5.errorCount, 2,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$5.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    expect($state$5.errors[1], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$6 = State('2');
    final $result$6 = _Choice2variants$0($state$6);
    expect($state$6.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect($result$6, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$6.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$6.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$6.errorCount, 2,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect($state$6.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
    expect($state$6.errors[1], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
    final $state$7 = State('2');
    final $result$7 = _Choice2variants_NoResult$0($state$7);
    expect($state$7.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect($result$7, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$7.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$7.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$7.errorCount, 2,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect($state$7.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
    expect($state$7.errors[1], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
  });
}

void _test_Choice3variants$0() {
  // Choice (3 variants)
  test('Choice (3 variants)', () {
    final $state$0 = State('01');
    final $result$0 = _Choice3variants$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 01');
    final $value$0 = $result$0!;
    expect($value$0, 48,
        reason: 'Testing \'result = value\' failed, input: 01');
    expect($state$0.pos, 1, reason: 'Testing \'state.pos\' failed, input: 01');
    final $state$1 = State('01');
    final $result$1 = _Choice3variants_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 01');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 01');
    expect($state$1.pos, 1, reason: 'Testing \'state.pos\' failed, input: 01');
    final $state$2 = State('12');
    final $result$2 = _Choice3variants$0($state$2);
    expect($state$2.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 12');
    final $value$2 = $result$2!;
    expect($value$2, 49,
        reason: 'Testing \'result = value\' failed, input: 12');
    expect($state$2.pos, 1, reason: 'Testing \'state.pos\' failed, input: 12');
    final $state$3 = State('12');
    final $result$3 = _Choice3variants_NoResult$0($state$3);
    expect($state$3.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 12');
    final $value$3 = $result$3;
    expect($value$3, null,
        reason: 'Testing \'result == null\' failed, input: 12');
    expect($state$3.pos, 1, reason: 'Testing \'state.pos\' failed, input: 12');
    final $state$4 = State('23');
    final $result$4 = _Choice3variants$0($state$4);
    expect($state$4.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 23');
    final $value$4 = $result$4!;
    expect($value$4, 50,
        reason: 'Testing \'result = value\' failed, input: 23');
    expect($state$4.pos, 1, reason: 'Testing \'state.pos\' failed, input: 23');
    final $state$5 = State('23');
    final $result$5 = _Choice3variants_NoResult$0($state$5);
    expect($state$5.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 23');
    final $value$5 = $result$5;
    expect($value$5, null,
        reason: 'Testing \'result == null\' failed, input: 23');
    expect($state$5.pos, 1, reason: 'Testing \'state.pos\' failed, input: 23');
    final $state$6 = State('');
    final $result$6 = _Choice3variants$0($state$6);
    expect($state$6.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$6, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$6.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$6.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$6.errorCount, 3,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$6.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    expect($state$6.errors[1], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    expect($state$6.errors[2], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$7 = State('');
    final $result$7 = _Choice3variants_NoResult$0($state$7);
    expect($state$7.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$7, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$7.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$7.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$7.errorCount, 3,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$7.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    expect($state$7.errors[1], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    expect($state$7.errors[2], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$8 = State('3');
    final $result$8 = _Choice3variants$0($state$8);
    expect($state$8.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 3');
    expect($result$8, null,
        reason: 'Testing \'result == null\' failed, input: 3');
    expect($state$8.pos, 0, reason: 'Testing \'state.pos\' failed, input: 3');
    expect($state$8.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 3');
    expect($state$8.errorCount, 3,
        reason: 'Testing \'state.errorCount\' failed, input: 3');
    expect($state$8.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 3');
    expect($state$8.errors[1], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 3');
    expect($state$8.errors[2], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 3');
    final $state$9 = State('3');
    final $result$9 = _Choice3variants_NoResult$0($state$9);
    expect($state$9.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 3');
    expect($result$9, null,
        reason: 'Testing \'result == null\' failed, input: 3');
    expect($state$9.pos, 0, reason: 'Testing \'state.pos\' failed, input: 3');
    expect($state$9.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 3');
    expect($state$9.errorCount, 3,
        reason: 'Testing \'state.errorCount\' failed, input: 3');
    expect($state$9.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 3');
    expect($state$9.errors[1], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 3');
    expect($state$9.errors[2], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 3');
  });
}

void _test_Char16bit$1() {
  // Char (16-bit)
  test('Char (16-bit)', () {
    final $state$0 = State('12');
    final $result$0 = _Char16bit$1($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 12');
    final $value$0 = $result$0!;
    expect($value$0, 49,
        reason: 'Testing \'result = value\' failed, input: 12');
    expect($state$0.pos, 1, reason: 'Testing \'state.pos\' failed, input: 12');
    final $state$1 = State('12');
    final $result$1 = _Char16bit_NoResult$1($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 12');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 12');
    expect($state$1.pos, 1, reason: 'Testing \'state.pos\' failed, input: 12');
    final $state$2 = State('');
    final $result$2 = _Char16bit$1($state$2);
    expect($state$2.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$2, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$2.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$2.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$3 = State('');
    final $result$3 = _Char16bit_NoResult$1($state$3);
    expect($state$3.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$3, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$3.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$3.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$4 = State('2');
    final $result$4 = _Char16bit$1($state$4);
    expect($state$4.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect($result$4, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$4.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect($state$4.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
    final $state$5 = State('2');
    final $result$5 = _Char16bit_NoResult$1($state$5);
    expect($state$5.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect($result$5, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$5.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$5.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect($state$5.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
  });
}

void _test_Char32bit$1() {
  // Char (32-bit)
  test('Char (32-bit)', () {
    final $state$0 = State('😀`');
    final $result$0 = _Char32bit$1($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀`');
    final $value$0 = $result$0!;
    expect($value$0, 128512,
        reason: 'Testing \'result = value\' failed, input: 😀`');
    expect($state$0.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀`');
    final $state$1 = State('😀`');
    final $result$1 = _Char32bit_NoResult$1($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀`');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 😀`');
    expect($state$1.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀`');
    final $state$2 = State('');
    final $result$2 = _Char32bit$1($state$2);
    expect($state$2.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$2, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$2.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$2.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$3 = State('');
    final $result$3 = _Char32bit_NoResult$1($state$3);
    expect($state$3.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$3, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$3.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$3.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$4 = State('2');
    final $result$4 = _Char32bit$1($state$4);
    expect($state$4.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect($result$4, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$4.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect($state$4.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
    final $state$5 = State('2');
    final $result$5 = _Char32bit_NoResult$1($state$5);
    expect($state$5.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect($result$5, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$5.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$5.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect($state$5.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
  });
}

void _test_Delimited$0() {
  // Delimited
  test('Delimited', () {
    final $state$0 = State('123');
    final $result$0 = _Delimited$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 123');
    final $value$0 = $result$0!;
    expect($value$0, 50,
        reason: 'Testing \'result = value\' failed, input: 123');
    expect($state$0.pos, 3, reason: 'Testing \'state.pos\' failed, input: 123');
    final $state$1 = State('123');
    final $result$1 = _Delimited_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 123');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 123');
    expect($state$1.pos, 3, reason: 'Testing \'state.pos\' failed, input: 123');
    final $state$2 = State('');
    final $result$2 = _Delimited$0($state$2);
    expect($state$2.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$2, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$2.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$2.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$3 = State('');
    final $result$3 = _Delimited_NoResult$0($state$3);
    expect($state$3.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$3, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$3.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$3.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$4 = State('1');
    final $result$4 = _Delimited$0($state$4);
    expect($state$4.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 1');
    expect($result$4, null,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$4.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$4.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 1');
    expect($state$4.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 1');
    final $state$5 = State('1');
    final $result$5 = _Delimited_NoResult$0($state$5);
    expect($state$5.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 1');
    expect($result$5, null,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$5.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$5.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 1');
    expect($state$5.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 1');
    final $state$6 = State('12');
    final $result$6 = _Delimited$0($state$6);
    expect($state$6.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 12');
    expect($result$6, null,
        reason: 'Testing \'result == null\' failed, input: 12');
    expect($state$6.pos, 0, reason: 'Testing \'state.pos\' failed, input: 12');
    expect($state$6.failPos, 2,
        reason: 'Testing \'state.failPos\' failed, input: 12');
    expect($state$6.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 12');
    expect($state$6.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 12');
    final $state$7 = State('12');
    final $result$7 = _Delimited_NoResult$0($state$7);
    expect($state$7.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 12');
    expect($result$7, null,
        reason: 'Testing \'result == null\' failed, input: 12');
    expect($state$7.pos, 0, reason: 'Testing \'state.pos\' failed, input: 12');
    expect($state$7.failPos, 2,
        reason: 'Testing \'state.failPos\' failed, input: 12');
    expect($state$7.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 12');
    expect($state$7.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 12');
    final $state$8 = State('2');
    final $result$8 = _Delimited$0($state$8);
    expect($state$8.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect($result$8, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$8.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$8.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$8.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect($state$8.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
    final $state$9 = State('2');
    final $result$9 = _Delimited_NoResult$0($state$9);
    expect($state$9.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect($result$9, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$9.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$9.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$9.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect($state$9.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
  });
}

void _test_Eof$0() {
  // Eof
  test('Eof', () {
    final $state$0 = State('');
    final $result$0 = _Eof$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: ');
    final $value$0 = $result$0;
    expect($value$0, null,
        reason: 'Testing \'result = value\' failed, input: ');
    expect($state$0.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    final $state$1 = State('');
    final $result$1 = _Eof_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: ');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    final $state$2 = State('1');
    final $result$2 = _Eof$0($state$2);
    expect($state$2.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 1');
    expect($result$2, null,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$2.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 1');
    expect($state$2.errors[0], isA<ErrorExpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: 1');
    final $state$3 = State('1');
    final $result$3 = _Eof_NoResult$0($state$3);
    expect($state$3.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 1');
    expect($result$3, null,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$3.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 1');
    expect($state$3.errors[0], isA<ErrorExpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: 1');
  });
}

void _test_Expected$0() {
  // Expected
  test('Expected', () {
    final $state$0 = State('123');
    final $result$0 = _Expected$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 123');
    final $value$0 = $result$0!;
    expect($value$0, (0x31, 0x32),
        reason: 'Testing \'result\' failed, input: 123');
    expect($state$0.pos, 2, reason: 'Testing \'state.pos\' failed, input: 123');
    final $state$1 = State('123');
    final $result$1 = _Expected_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 123');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 123');
    expect($state$1.pos, 2, reason: 'Testing \'state.pos\' failed, input: 123');
    final $state$2 = State('');
    final $result$2 = _Expected$0($state$2);
    expect($state$2.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$2, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$2.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$2.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: ');
    expect(($state$2.errors[0] as ErrorExpectedTags).tags[0], 'expr',
        reason: 'Testing \'ErrorExpectedTags).tags\' failed, input: ');
    final $state$3 = State('');
    final $result$3 = _Expected_NoResult$0($state$3);
    expect($state$3.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$3, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$3.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$3.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: ');
    expect(($state$3.errors[0] as ErrorExpectedTags).tags[0], 'expr',
        reason: 'Testing \'ErrorExpectedTags).tags\' failed, input: ');
    final $state$4 = State('1');
    final $result$4 = _Expected$0($state$4);
    expect($state$4.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 1');
    expect($result$4, null,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$4.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$4.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 1');
    expect($state$4.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 1');
    final $state$5 = State('1');
    final $result$5 = _Expected_NoResult$0($state$5);
    expect($state$5.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 1');
    expect($result$5, null,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$5.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$5.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 1');
    expect($state$5.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 1');
  });
}

void _test_Many$0() {
  // Many
  test('Many', () {
    final $state$0 = State('1112');
    final $result$0 = _Many$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 1112');
    final $value$0 = $result$0!;
    expect($value$0, [49, 49, 49],
        reason: 'Testing \'result = value\' failed, input: 1112');
    expect($state$0.pos, 3,
        reason: 'Testing \'state.pos\' failed, input: 1112');
    final $state$1 = State('1112');
    final $result$1 = _Many_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 1112');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 1112');
    expect($state$1.pos, 3,
        reason: 'Testing \'state.pos\' failed, input: 1112');
    final $state$2 = State('');
    final $result$2 = _Many$0($state$2);
    expect($state$2.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: ');
    final $value$2 = $result$2!;
    expect($value$2, [], reason: 'Testing \'result = value\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    final $state$3 = State('');
    final $result$3 = _Many_NoResult$0($state$3);
    expect($state$3.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: ');
    final $value$3 = $result$3;
    expect($value$3, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    final $state$4 = State('2');
    final $result$4 = _Many$0($state$4);
    expect($state$4.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 2');
    final $value$4 = $result$4!;
    expect($value$4, [], reason: 'Testing \'result = value\' failed, input: 2');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    final $state$5 = State('2');
    final $result$5 = _Many_NoResult$0($state$5);
    expect($state$5.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 2');
    final $value$5 = $result$5;
    expect($value$5, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
  });
}

void _test_Many1$0() {
  // Many1
  test('Many1', () {
    final $state$0 = State('1112');
    final $result$0 = _Many1$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 1112');
    final $value$0 = $result$0!;
    expect($value$0, [49, 49, 49],
        reason: 'Testing \'result = value\' failed, input: 1112');
    expect($state$0.pos, 3,
        reason: 'Testing \'state.pos\' failed, input: 1112');
    final $state$1 = State('1112');
    final $result$1 = _Many1_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 1112');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 1112');
    expect($state$1.pos, 3,
        reason: 'Testing \'state.pos\' failed, input: 1112');
    final $state$2 = State('');
    final $result$2 = _Many1$0($state$2);
    expect($state$2.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$2, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$2.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$2.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$3 = State('');
    final $result$3 = _Many1_NoResult$0($state$3);
    expect($state$3.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$3, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$3.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$3.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$4 = State('2');
    final $result$4 = _Many1$0($state$4);
    expect($state$4.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect($result$4, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$4.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect($state$4.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
    final $state$5 = State('2');
    final $result$5 = _Many1_NoResult$0($state$5);
    expect($state$5.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect($result$5, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$5.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$5.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect($state$5.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
  });
}

void _test_ManyCount$0() {
  // ManyCount
  test('ManyCount', () {
    final $state$0 = State('1112');
    final $result$0 = _ManyCount$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 1112');
    final $value$0 = $result$0!;
    expect($value$0, 3,
        reason: 'Testing \'result = value\' failed, input: 1112');
    expect($state$0.pos, 3,
        reason: 'Testing \'state.pos\' failed, input: 1112');
    final $state$1 = State('1112');
    final $result$1 = _ManyCount_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 1112');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 1112');
    expect($state$1.pos, 3,
        reason: 'Testing \'state.pos\' failed, input: 1112');
    final $state$2 = State('');
    final $result$2 = _ManyCount$0($state$2);
    expect($state$2.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: ');
    final $value$2 = $result$2!;
    expect($value$2, 0, reason: 'Testing \'result = value\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    final $state$3 = State('');
    final $result$3 = _ManyCount_NoResult$0($state$3);
    expect($state$3.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: ');
    final $value$3 = $result$3;
    expect($value$3, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    final $state$4 = State('2');
    final $result$4 = _ManyCount$0($state$4);
    expect($state$4.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 2');
    final $value$4 = $result$4!;
    expect($value$4, 0, reason: 'Testing \'result = value\' failed, input: 2');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    final $state$5 = State('2');
    final $result$5 = _ManyCount_NoResult$0($state$5);
    expect($state$5.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 2');
    final $value$5 = $result$5;
    expect($value$5, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
  });
}

void _test_Many1Count$0() {
  // Many1Count
  test('Many1Count', () {
    final $state$0 = State('1112');
    final $result$0 = _Many1Count$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 1112');
    final $value$0 = $result$0!;
    expect($value$0, 3,
        reason: 'Testing \'result = value\' failed, input: 1112');
    expect($state$0.pos, 3,
        reason: 'Testing \'state.pos\' failed, input: 1112');
    final $state$1 = State('1112');
    final $result$1 = _Many1Count_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 1112');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 1112');
    expect($state$1.pos, 3,
        reason: 'Testing \'state.pos\' failed, input: 1112');
    final $state$2 = State('');
    final $result$2 = _Many1Count$0($state$2);
    expect($state$2.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$2, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$2.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$2.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$3 = State('');
    final $result$3 = _Many1Count_NoResult$0($state$3);
    expect($state$3.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$3, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$3.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$3.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$4 = State('2');
    final $result$4 = _Many1Count$0($state$4);
    expect($state$4.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect($result$4, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$4.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect($state$4.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
    final $state$5 = State('2');
    final $result$5 = _Many1Count_NoResult$0($state$5);
    expect($state$5.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect($result$5, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$5.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$5.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect($state$5.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
  });
}

void _test_ManyMN03$0() {
  // ManyMN (0..3)
  test('ManyMN (0..3)', () {
    final $state$0 = State('12');
    final $result$0 = _ManyMN03$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 12');
    final $value$0 = $result$0!;
    expect($value$0, [49],
        reason: 'Testing \'result = value\' failed, input: 12');
    expect($state$0.pos, 1, reason: 'Testing \'state.pos\' failed, input: 12');
    final $state$1 = State('12');
    final $result$1 = _ManyMN03_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 12');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 12');
    expect($state$1.pos, 1, reason: 'Testing \'state.pos\' failed, input: 12');
    final $state$2 = State('112');
    final $result$2 = _ManyMN03$0($state$2);
    expect($state$2.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 112');
    final $value$2 = $result$2!;
    expect($value$2, [49, 49],
        reason: 'Testing \'result = value\' failed, input: 112');
    expect($state$2.pos, 2, reason: 'Testing \'state.pos\' failed, input: 112');
    final $state$3 = State('112');
    final $result$3 = _ManyMN03_NoResult$0($state$3);
    expect($state$3.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 112');
    final $value$3 = $result$3;
    expect($value$3, null,
        reason: 'Testing \'result == null\' failed, input: 112');
    expect($state$3.pos, 2, reason: 'Testing \'state.pos\' failed, input: 112');
    final $state$4 = State('11112');
    final $result$4 = _ManyMN03$0($state$4);
    expect($state$4.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 11112');
    final $value$4 = $result$4!;
    expect($value$4, [49, 49, 49],
        reason: 'Testing \'result = value\' failed, input: 11112');
    expect($state$4.pos, 3,
        reason: 'Testing \'state.pos\' failed, input: 11112');
    final $state$5 = State('11112');
    final $result$5 = _ManyMN03_NoResult$0($state$5);
    expect($state$5.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 11112');
    final $value$5 = $result$5;
    expect($value$5, null,
        reason: 'Testing \'result == null\' failed, input: 11112');
    expect($state$5.pos, 3,
        reason: 'Testing \'state.pos\' failed, input: 11112');
    final $state$6 = State('2');
    final $result$6 = _ManyMN03$0($state$6);
    expect($state$6.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 2');
    final $value$6 = $result$6!;
    expect($value$6, [], reason: 'Testing \'result = value\' failed, input: 2');
    expect($state$6.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    final $state$7 = State('2');
    final $result$7 = _ManyMN03_NoResult$0($state$7);
    expect($state$7.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 2');
    final $value$7 = $result$7;
    expect($value$7, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$7.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    final $state$8 = State('');
    final $result$8 = _ManyMN03$0($state$8);
    expect($state$8.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: ');
    final $value$8 = $result$8!;
    expect($value$8, [], reason: 'Testing \'result = value\' failed, input: ');
    expect($state$8.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    final $state$9 = State('');
    final $result$9 = _ManyMN03_NoResult$0($state$9);
    expect($state$9.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: ');
    final $value$9 = $result$9;
    expect($value$9, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$9.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
  });
}

void _test_ManyMN23$0() {
  // ManyMN (2..3)
  test('ManyMN (2..3)', () {
    final $state$0 = State('112');
    final $result$0 = _ManyMN23$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 112');
    final $value$0 = $result$0!;
    expect($value$0, [49, 49],
        reason: 'Testing \'result = value\' failed, input: 112');
    expect($state$0.pos, 2, reason: 'Testing \'state.pos\' failed, input: 112');
    final $state$1 = State('112');
    final $result$1 = _ManyMN23_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 112');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 112');
    expect($state$1.pos, 2, reason: 'Testing \'state.pos\' failed, input: 112');
    final $state$2 = State('11112');
    final $result$2 = _ManyMN23$0($state$2);
    expect($state$2.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 11112');
    final $value$2 = $result$2!;
    expect($value$2, [49, 49, 49],
        reason: 'Testing \'result = value\' failed, input: 11112');
    expect($state$2.pos, 3,
        reason: 'Testing \'state.pos\' failed, input: 11112');
    final $state$3 = State('11112');
    final $result$3 = _ManyMN23_NoResult$0($state$3);
    expect($state$3.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 11112');
    final $value$3 = $result$3;
    expect($value$3, null,
        reason: 'Testing \'result == null\' failed, input: 11112');
    expect($state$3.pos, 3,
        reason: 'Testing \'state.pos\' failed, input: 11112');
    final $state$4 = State('');
    final $result$4 = _ManyMN23$0($state$4);
    expect($state$4.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$4, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$4.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$4.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$5 = State('');
    final $result$5 = _ManyMN23_NoResult$0($state$5);
    expect($state$5.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$5, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$5.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$5.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$5.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$6 = State('1');
    final $result$6 = _ManyMN23$0($state$6);
    expect($state$6.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 1');
    expect($result$6, null,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$6.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$6.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$6.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 1');
    expect($state$6.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 1');
    final $state$7 = State('1');
    final $result$7 = _ManyMN23_NoResult$0($state$7);
    expect($state$7.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 1');
    expect($result$7, null,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$7.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$7.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$7.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 1');
    expect($state$7.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 1');
    final $state$8 = State('2');
    final $result$8 = _ManyMN23$0($state$8);
    expect($state$8.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect($result$8, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$8.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$8.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$8.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect($state$8.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
    final $state$9 = State('2');
    final $result$9 = _ManyMN23_NoResult$0($state$9);
    expect($state$9.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect($result$9, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$9.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$9.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$9.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect($state$9.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
  });
}

void _test_Not$0() {
  // Not
  test('Not', () {
    final $state$0 = State('02');
    final $result$0 = _Not$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 02');
    final $value$0 = $result$0!;
    expect($value$0, 48,
        reason: 'Testing \'result = value\' failed, input: 02');
    expect($state$0.pos, 1, reason: 'Testing \'state.pos\' failed, input: 02');
    final $state$1 = State('02');
    final $result$1 = _Not_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 02');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 02');
    expect($state$1.pos, 1, reason: 'Testing \'state.pos\' failed, input: 02');
    final $state$2 = State('0');
    final $result$2 = _Not$0($state$2);
    expect($state$2.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 0');
    final $value$2 = $result$2!;
    expect($value$2, 48, reason: 'Testing \'result = value\' failed, input: 0');
    expect($state$2.pos, 1, reason: 'Testing \'state.pos\' failed, input: 0');
    final $state$3 = State('0');
    final $result$3 = _Not_NoResult$0($state$3);
    expect($state$3.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 0');
    final $value$3 = $result$3;
    expect($value$3, null,
        reason: 'Testing \'result == null\' failed, input: 0');
    expect($state$3.pos, 1, reason: 'Testing \'state.pos\' failed, input: 0');
    final $state$4 = State('');
    final $result$4 = _Not$0($state$4);
    expect($state$4.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$4, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$4.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$4.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$5 = State('');
    final $result$5 = _Not_NoResult$0($state$5);
    expect($state$5.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$5, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$5.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$5.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$5.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$6 = State('1');
    final $result$6 = _Not$0($state$6);
    expect($state$6.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 1');
    expect($result$6, null,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$6.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$6.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$6.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 1');
    expect($state$6.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 1');
    final $state$7 = State('1');
    final $result$7 = _Not_NoResult$0($state$7);
    expect($state$7.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 1');
    expect($result$7, null,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$7.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$7.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$7.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 1');
    expect($state$7.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 1');
    final $state$8 = State('01');
    final $result$8 = _Not$0($state$8);
    expect($state$8.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 01');
    expect($result$8, null,
        reason: 'Testing \'result == null\' failed, input: 01');
    expect($state$8.pos, 0, reason: 'Testing \'state.pos\' failed, input: 01');
    expect($state$8.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: 01');
    expect($state$8.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 01');
    expect($state$8.errors[0], isA<ErrorUnexpectedInput>(),
        reason: 'Testing \'state.error\' failed, input: 01');
    expect(($state$8.errors[0] as ErrorUnexpectedInput).length, 1,
        reason: 'Testing \'ErrorUnexpectedInput.length\' failed, input: 01');
    final $state$9 = State('01');
    final $result$9 = _Not_NoResult$0($state$9);
    expect($state$9.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 01');
    expect($result$9, null,
        reason: 'Testing \'result == null\' failed, input: 01');
    expect($state$9.pos, 0, reason: 'Testing \'state.pos\' failed, input: 01');
    expect($state$9.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: 01');
    expect($state$9.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 01');
    expect($state$9.errors[0], isA<ErrorUnexpectedInput>(),
        reason: 'Testing \'state.error\' failed, input: 01');
    expect(($state$9.errors[0] as ErrorUnexpectedInput).length, 1,
        reason: 'Testing \'ErrorUnexpectedInput.length\' failed, input: 01');
  });
}

void _test_Preceded$0() {
  // Preceded
  test('Preceded', () {
    final $state$0 = State('123');
    final $result$0 = _Preceded$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 123');
    final $value$0 = $result$0!;
    expect($value$0, 50,
        reason: 'Testing \'result = value\' failed, input: 123');
    expect($state$0.pos, 2, reason: 'Testing \'state.pos\' failed, input: 123');
    final $state$1 = State('123');
    final $result$1 = _Preceded_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 123');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 123');
    expect($state$1.pos, 2, reason: 'Testing \'state.pos\' failed, input: 123');
    final $state$2 = State('');
    final $result$2 = _Preceded$0($state$2);
    expect($state$2.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$2, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$2.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$2.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$3 = State('');
    final $result$3 = _Preceded_NoResult$0($state$3);
    expect($state$3.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$3, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$3.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$3.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$4 = State('1');
    final $result$4 = _Preceded$0($state$4);
    expect($state$4.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 1');
    expect($result$4, null,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$4.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$4.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 1');
    expect($state$4.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 1');
    final $state$5 = State('1');
    final $result$5 = _Preceded_NoResult$0($state$5);
    expect($state$5.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 1');
    expect($result$5, null,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$5.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$5.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 1');
    expect($state$5.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 1');
    final $state$6 = State('2');
    final $result$6 = _Preceded$0($state$6);
    expect($state$6.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect($result$6, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$6.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$6.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$6.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect($state$6.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
    final $state$7 = State('2');
    final $result$7 = _Preceded_NoResult$0($state$7);
    expect($state$7.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect($result$7, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$7.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$7.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$7.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect($state$7.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
  });
}

void _test_Tagshort$0() {
  // Tag (short)
  test('Tag (short)', () {
    final $state$0 = State('01');
    final $result$0 = _Tagshort$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 01');
    final $value$0 = $result$0!;
    expect($value$0, '0',
        reason: 'Testing \'result = value\' failed, input: 01');
    expect($state$0.pos, 1, reason: 'Testing \'state.pos\' failed, input: 01');
    final $state$1 = State('01');
    final $result$1 = _Tagshort_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 01');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 01');
    expect($state$1.pos, 1, reason: 'Testing \'state.pos\' failed, input: 01');
    final $state$2 = State('');
    final $result$2 = _Tagshort$0($state$2);
    expect($state$2.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$2, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$2.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$2.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$3 = State('');
    final $result$3 = _Tagshort_NoResult$0($state$3);
    expect($state$3.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$3, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$3.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$3.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$4 = State('2');
    final $result$4 = _Tagshort$0($state$4);
    expect($state$4.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect($result$4, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$4.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect($state$4.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: 2');
    final $state$5 = State('2');
    final $result$5 = _Tagshort_NoResult$0($state$5);
    expect($state$5.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect($result$5, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$5.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$5.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect($state$5.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: 2');
  });
}

void _test_Taglong$0() {
  // Tag (long)
  test('Tag (long)', () {
    final $state$0 = State('😀1');
    final $result$0 = _Taglong$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀1');
    final $value$0 = $result$0!;
    expect($value$0, '😀',
        reason: 'Testing \'result = value\' failed, input: 😀1');
    expect($state$0.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀1');
    final $state$1 = State('😀1');
    final $result$1 = _Taglong_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀1');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 😀1');
    expect($state$1.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀1');
    final $state$2 = State('');
    final $result$2 = _Taglong$0($state$2);
    expect($state$2.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$2, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$2.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$2.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$3 = State('');
    final $result$3 = _Taglong_NoResult$0($state$3);
    expect($state$3.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$3, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$3.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$3.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$4 = State('2');
    final $result$4 = _Taglong$0($state$4);
    expect($state$4.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect($result$4, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$4.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect($state$4.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: 2');
    final $state$5 = State('2');
    final $result$5 = _Taglong_NoResult$0($state$5);
    expect($state$5.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect($result$5, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$5.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$5.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect($state$5.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: 2');
  });
}

void _test_Tags$0() {
  // Tags
  test('Tags', () {
    final $state$0 = State('abcd');
    final $result$0 = _Tags$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: abcd');
    final $value$0 = $result$0!;
    expect($value$0, 'abc',
        reason: 'Testing \'result = value\' failed, input: abcd');
    expect($state$0.pos, 3,
        reason: 'Testing \'state.pos\' failed, input: abcd');
    final $state$1 = State('abcd');
    final $result$1 = _Tags_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: abcd');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: abcd');
    expect($state$1.pos, 3,
        reason: 'Testing \'state.pos\' failed, input: abcd');
    final $state$2 = State('abd');
    final $result$2 = _Tags$0($state$2);
    expect($state$2.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: abd');
    final $value$2 = $result$2!;
    expect($value$2, 'ab',
        reason: 'Testing \'result = value\' failed, input: abd');
    expect($state$2.pos, 2, reason: 'Testing \'state.pos\' failed, input: abd');
    final $state$3 = State('abd');
    final $result$3 = _Tags_NoResult$0($state$3);
    expect($state$3.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: abd');
    final $value$3 = $result$3;
    expect($value$3, null,
        reason: 'Testing \'result == null\' failed, input: abd');
    expect($state$3.pos, 2, reason: 'Testing \'state.pos\' failed, input: abd');
    final $state$4 = State('ad');
    final $result$4 = _Tags$0($state$4);
    expect($state$4.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: ad');
    final $value$4 = $result$4!;
    expect($value$4, 'a',
        reason: 'Testing \'result = value\' failed, input: ad');
    expect($state$4.pos, 1, reason: 'Testing \'state.pos\' failed, input: ad');
    final $state$5 = State('ad');
    final $result$5 = _Tags_NoResult$0($state$5);
    expect($state$5.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: ad');
    final $value$5 = $result$5;
    expect($value$5, null,
        reason: 'Testing \'result == null\' failed, input: ad');
    expect($state$5.pos, 1, reason: 'Testing \'state.pos\' failed, input: ad');
    final $state$6 = State('bcd');
    final $result$6 = _Tags$0($state$6);
    expect($state$6.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: bcd');
    final $value$6 = $result$6!;
    expect($value$6, 'bc',
        reason: 'Testing \'result = value\' failed, input: bcd');
    expect($state$6.pos, 2, reason: 'Testing \'state.pos\' failed, input: bcd');
    final $state$7 = State('bcd');
    final $result$7 = _Tags_NoResult$0($state$7);
    expect($state$7.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: bcd');
    final $value$7 = $result$7;
    expect($value$7, null,
        reason: 'Testing \'result == null\' failed, input: bcd');
    expect($state$7.pos, 2, reason: 'Testing \'state.pos\' failed, input: bcd');
    final $state$8 = State('bd');
    final $result$8 = _Tags$0($state$8);
    expect($state$8.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: bd');
    final $value$8 = $result$8!;
    expect($value$8, 'b',
        reason: 'Testing \'result = value\' failed, input: bd');
    expect($state$8.pos, 1, reason: 'Testing \'state.pos\' failed, input: bd');
    final $state$9 = State('bd');
    final $result$9 = _Tags_NoResult$0($state$9);
    expect($state$9.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: bd');
    final $value$9 = $result$9;
    expect($value$9, null,
        reason: 'Testing \'result == null\' failed, input: bd');
    expect($state$9.pos, 1, reason: 'Testing \'state.pos\' failed, input: bd');
    final $state$10 = State('cd');
    final $result$10 = _Tags$0($state$10);
    expect($state$10.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: cd');
    final $value$10 = $result$10!;
    expect($value$10, 'c',
        reason: 'Testing \'result = value\' failed, input: cd');
    expect($state$10.pos, 1, reason: 'Testing \'state.pos\' failed, input: cd');
    final $state$11 = State('cd');
    final $result$11 = _Tags_NoResult$0($state$11);
    expect($state$11.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: cd');
    final $value$11 = $result$11;
    expect($value$11, null,
        reason: 'Testing \'result == null\' failed, input: cd');
    expect($state$11.pos, 1, reason: 'Testing \'state.pos\' failed, input: cd');
    final $state$12 = State('😀');
    final $result$12 = _Tags$0($state$12);
    expect($state$12.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀');
    final $value$12 = $result$12!;
    expect($value$12, '😀',
        reason: 'Testing \'result = value\' failed, input: 😀');
    expect($state$12.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀');
    final $state$13 = State('😀');
    final $result$13 = _Tags_NoResult$0($state$13);
    expect($state$13.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀');
    final $value$13 = $result$13;
    expect($value$13, null,
        reason: 'Testing \'result == null\' failed, input: 😀');
    expect($state$13.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀');
    final $state$14 = State('😀😀');
    final $result$14 = _Tags$0($state$14);
    expect($state$14.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀😀');
    final $value$14 = $result$14!;
    expect($value$14, '😀😀',
        reason: 'Testing \'result = value\' failed, input: 😀😀');
    expect($state$14.pos, 4,
        reason: 'Testing \'state.pos\' failed, input: 😀😀');
    final $state$15 = State('😀😀');
    final $result$15 = _Tags_NoResult$0($state$15);
    expect($state$15.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀😀');
    final $value$15 = $result$15;
    expect($value$15, null,
        reason: 'Testing \'result == null\' failed, input: 😀😀');
    expect($state$15.pos, 4,
        reason: 'Testing \'state.pos\' failed, input: 😀😀');
    final $state$16 = State('');
    final $result$16 = _Tags$0($state$16);
    expect($state$16.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$16, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$16.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$16.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$16.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$16.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$17 = State('');
    final $result$17 = _Tags_NoResult$0($state$17);
    expect($state$17.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$17, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$17.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$17.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$17.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$17.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$18 = State('x');
    final $result$18 = _Tags$0($state$18);
    expect($state$18.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: x');
    expect($result$18, null,
        reason: 'Testing \'result == null\' failed, input: x');
    expect($state$18.pos, 0, reason: 'Testing \'state.pos\' failed, input: x');
    expect($state$18.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: x');
    expect($state$18.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: x');
    expect($state$18.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: x');
    final $state$19 = State('x');
    final $result$19 = _Tags_NoResult$0($state$19);
    expect($state$19.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: x');
    expect($result$19, null,
        reason: 'Testing \'result == null\' failed, input: x');
    expect($state$19.pos, 0, reason: 'Testing \'state.pos\' failed, input: x');
    expect($state$19.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: x');
    expect($state$19.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: x');
    expect($state$19.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: x');
  });
}

void _test_TakeWhileMN03$0() {
  // TakeWhileMN (0..3)
  test('TakeWhileMN (0..3)', () {
    final $state$0 = State('😀😀😀😀');
    final $result$0 = _TakeWhileMN03$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀😀😀😀');
    final $value$0 = $result$0!;
    expect($value$0, '😀😀😀',
        reason: 'Testing \'result = value\' failed, input: 😀😀😀😀');
    expect($state$0.pos, 6,
        reason: 'Testing \'state.pos\' failed, input: 😀😀😀😀');
    final $state$1 = State('😀😀😀😀');
    final $result$1 = _TakeWhileMN03_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀😀😀😀');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 😀😀😀😀');
    expect($state$1.pos, 6,
        reason: 'Testing \'state.pos\' failed, input: 😀😀😀😀');
    final $state$2 = State('😀😀');
    final $result$2 = _TakeWhileMN03$0($state$2);
    expect($state$2.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀😀');
    final $value$2 = $result$2!;
    expect($value$2, '😀😀',
        reason: 'Testing \'result = value\' failed, input: 😀😀');
    expect($state$2.pos, 4,
        reason: 'Testing \'state.pos\' failed, input: 😀😀');
    final $state$3 = State('😀😀');
    final $result$3 = _TakeWhileMN03_NoResult$0($state$3);
    expect($state$3.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀😀');
    final $value$3 = $result$3;
    expect($value$3, null,
        reason: 'Testing \'result == null\' failed, input: 😀😀');
    expect($state$3.pos, 4,
        reason: 'Testing \'state.pos\' failed, input: 😀😀');
    final $state$4 = State('😀');
    final $result$4 = _TakeWhileMN03$0($state$4);
    expect($state$4.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀');
    final $value$4 = $result$4!;
    expect($value$4, '😀',
        reason: 'Testing \'result = value\' failed, input: 😀');
    expect($state$4.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀');
    final $state$5 = State('😀');
    final $result$5 = _TakeWhileMN03_NoResult$0($state$5);
    expect($state$5.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀');
    final $value$5 = $result$5;
    expect($value$5, null,
        reason: 'Testing \'result == null\' failed, input: 😀');
    expect($state$5.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀');
    final $state$6 = State('');
    final $result$6 = _TakeWhileMN03$0($state$6);
    expect($state$6.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: ');
    final $value$6 = $result$6!;
    expect($value$6, '', reason: 'Testing \'result = value\' failed, input: ');
    expect($state$6.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    final $state$7 = State('');
    final $result$7 = _TakeWhileMN03_NoResult$0($state$7);
    expect($state$7.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: ');
    final $value$7 = $result$7;
    expect($value$7, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$7.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    final $state$8 = State('a');
    final $result$8 = _TakeWhileMN03$0($state$8);
    expect($state$8.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: a');
    final $value$8 = $result$8!;
    expect($value$8, '', reason: 'Testing \'result = value\' failed, input: a');
    expect($state$8.pos, 0, reason: 'Testing \'state.pos\' failed, input: a');
    final $state$9 = State('a');
    final $result$9 = _TakeWhileMN03_NoResult$0($state$9);
    expect($state$9.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: a');
    final $value$9 = $result$9;
    expect($value$9, null,
        reason: 'Testing \'result == null\' failed, input: a');
    expect($state$9.pos, 0, reason: 'Testing \'state.pos\' failed, input: a');
  });
}

void _test_TakeWhileMN12$0() {
  // TakeWhileMN (1..2)
  test('TakeWhileMN (1..2)', () {
    final $state$0 = State('😀😀😀😀');
    final $result$0 = _TakeWhileMN12$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀😀😀😀');
    final $value$0 = $result$0!;
    expect($value$0, '😀😀',
        reason: 'Testing \'result = value\' failed, input: 😀😀😀😀');
    expect($state$0.pos, 4,
        reason: 'Testing \'state.pos\' failed, input: 😀😀😀😀');
    final $state$1 = State('😀😀😀😀');
    final $result$1 = _TakeWhileMN12_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀😀😀😀');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 😀😀😀😀');
    expect($state$1.pos, 4,
        reason: 'Testing \'state.pos\' failed, input: 😀😀😀😀');
    final $state$2 = State('😀');
    final $result$2 = _TakeWhileMN12$0($state$2);
    expect($state$2.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀');
    final $value$2 = $result$2!;
    expect($value$2, '😀',
        reason: 'Testing \'result = value\' failed, input: 😀');
    expect($state$2.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀');
    final $state$3 = State('😀');
    final $result$3 = _TakeWhileMN12_NoResult$0($state$3);
    expect($state$3.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀');
    final $value$3 = $result$3;
    expect($value$3, null,
        reason: 'Testing \'result == null\' failed, input: 😀');
    expect($state$3.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀');
    final $state$4 = State('');
    final $result$4 = _TakeWhileMN12$0($state$4);
    expect($state$4.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$4, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$4.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$4.errors[0], isA<ErrorUnexpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$5 = State('');
    final $result$5 = _TakeWhileMN12_NoResult$0($state$5);
    expect($state$5.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$5, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$5.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$5.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$5.errors[0], isA<ErrorUnexpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$6 = State('1');
    final $result$6 = _TakeWhileMN12$0($state$6);
    expect($state$6.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 1');
    expect($result$6, null,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$6.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$6.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$6.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 1');
    expect($state$6.errors[0], isA<ErrorUnexpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 1');
    final $state$7 = State('1');
    final $result$7 = _TakeWhileMN12_NoResult$0($state$7);
    expect($state$7.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 1');
    expect($result$7, null,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$7.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$7.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$7.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 1');
    expect($state$7.errors[0], isA<ErrorUnexpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 1');
  });
}

void _test_TakeWhile$0() {
  // TakeWhile
  test('TakeWhile', () {
    final $state$0 = State('😀');
    final $result$0 = _TakeWhile$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀');
    final $value$0 = $result$0!;
    expect($value$0, '😀',
        reason: 'Testing \'result = value\' failed, input: 😀');
    expect($state$0.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀');
    final $state$1 = State('😀');
    final $result$1 = _TakeWhile_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 😀');
    expect($state$1.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀');
    final $state$2 = State('😀😀');
    final $result$2 = _TakeWhile$0($state$2);
    expect($state$2.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀😀');
    final $value$2 = $result$2!;
    expect($value$2, '😀😀',
        reason: 'Testing \'result = value\' failed, input: 😀😀');
    expect($state$2.pos, 4,
        reason: 'Testing \'state.pos\' failed, input: 😀😀');
    final $state$3 = State('😀😀');
    final $result$3 = _TakeWhile_NoResult$0($state$3);
    expect($state$3.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀😀');
    final $value$3 = $result$3;
    expect($value$3, null,
        reason: 'Testing \'result == null\' failed, input: 😀😀');
    expect($state$3.pos, 4,
        reason: 'Testing \'state.pos\' failed, input: 😀😀');
    final $state$4 = State('');
    final $result$4 = _TakeWhile$0($state$4);
    expect($state$4.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: ');
    final $value$4 = $result$4!;
    expect($value$4, '', reason: 'Testing \'result = value\' failed, input: ');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    final $state$5 = State('');
    final $result$5 = _TakeWhile_NoResult$0($state$5);
    expect($state$5.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: ');
    final $value$5 = $result$5;
    expect($value$5, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    final $state$6 = State('a');
    final $result$6 = _TakeWhile$0($state$6);
    expect($state$6.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: a');
    final $value$6 = $result$6!;
    expect($value$6, '', reason: 'Testing \'result = value\' failed, input: a');
    expect($state$6.pos, 0, reason: 'Testing \'state.pos\' failed, input: a');
    final $state$7 = State('a');
    final $result$7 = _TakeWhile_NoResult$0($state$7);
    expect($state$7.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: a');
    final $value$7 = $result$7;
    expect($value$7, null,
        reason: 'Testing \'result == null\' failed, input: a');
    expect($state$7.pos, 0, reason: 'Testing \'state.pos\' failed, input: a');
  });
}

void _test_TakeWhile1$0() {
  // TakeWhile1
  test('TakeWhile1', () {
    final $state$0 = State('😀');
    final $result$0 = _TakeWhile1$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀');
    final $value$0 = $result$0!;
    expect($value$0, '😀',
        reason: 'Testing \'result = value\' failed, input: 😀');
    expect($state$0.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀');
    final $state$1 = State('😀');
    final $result$1 = _TakeWhile1_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 😀');
    expect($state$1.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀');
    final $state$2 = State('😀😀');
    final $result$2 = _TakeWhile1$0($state$2);
    expect($state$2.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀😀');
    final $value$2 = $result$2!;
    expect($value$2, '😀😀',
        reason: 'Testing \'result = value\' failed, input: 😀😀');
    expect($state$2.pos, 4,
        reason: 'Testing \'state.pos\' failed, input: 😀😀');
    final $state$3 = State('😀😀');
    final $result$3 = _TakeWhile1_NoResult$0($state$3);
    expect($state$3.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 😀😀');
    final $value$3 = $result$3;
    expect($value$3, null,
        reason: 'Testing \'result == null\' failed, input: 😀😀');
    expect($state$3.pos, 4,
        reason: 'Testing \'state.pos\' failed, input: 😀😀');
    final $state$4 = State('');
    final $result$4 = _TakeWhile1$0($state$4);
    expect($state$4.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$4, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$4.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$4.errors[0], isA<ErrorUnexpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$5 = State('');
    final $result$5 = _TakeWhile1_NoResult$0($state$5);
    expect($state$5.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$5, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$5.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$5.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$5.errors[0], isA<ErrorUnexpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$6 = State('a');
    final $result$6 = _TakeWhile1$0($state$6);
    expect($state$6.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: a');
    expect($result$6, null,
        reason: 'Testing \'result == null\' failed, input: a');
    expect($state$6.pos, 0, reason: 'Testing \'state.pos\' failed, input: a');
    expect($state$6.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: a');
    expect($state$6.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: a');
    expect($state$6.errors[0], isA<ErrorUnexpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: a');
    final $state$7 = State('a');
    final $result$7 = _TakeWhile1_NoResult$0($state$7);
    expect($state$7.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: a');
    expect($result$7, null,
        reason: 'Testing \'result == null\' failed, input: a');
    expect($state$7.pos, 0, reason: 'Testing \'state.pos\' failed, input: a');
    expect($state$7.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: a');
    expect($state$7.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: a');
    expect($state$7.errors[0], isA<ErrorUnexpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: a');
  });
}

void _test_Terminated$0() {
  // Terminated
  test('Terminated', () {
    final $state$0 = State('123');
    final $result$0 = _Terminated$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 123');
    final $value$0 = $result$0!;
    expect($value$0, 49,
        reason: 'Testing \'result = value\' failed, input: 123');
    expect($state$0.pos, 2, reason: 'Testing \'state.pos\' failed, input: 123');
    final $state$1 = State('123');
    final $result$1 = _Terminated_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 123');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 123');
    expect($state$1.pos, 2, reason: 'Testing \'state.pos\' failed, input: 123');
    final $state$2 = State('');
    final $result$2 = _Terminated$0($state$2);
    expect($state$2.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$2, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$2.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$2.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$3 = State('');
    final $result$3 = _Terminated_NoResult$0($state$3);
    expect($state$3.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$3, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$3.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$3.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$4 = State('1');
    final $result$4 = _Terminated$0($state$4);
    expect($state$4.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 1');
    expect($result$4, null,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$4.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$4.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 1');
    expect($state$4.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 1');
    final $state$5 = State('1');
    final $result$5 = _Terminated_NoResult$0($state$5);
    expect($state$5.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 1');
    expect($result$5, null,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$5.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$5.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 1');
    expect($state$5.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 1');
    final $state$6 = State('2');
    final $result$6 = _Terminated$0($state$6);
    expect($state$6.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect($result$6, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$6.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$6.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$6.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect($state$6.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
    final $state$7 = State('2');
    final $result$7 = _Terminated_NoResult$0($state$7);
    expect($state$7.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect($result$7, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$7.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$7.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$7.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect($state$7.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
  });
}

void _test_Tagshort$1() {
  // Tag (short)
  test('Tag (short)', () {
    final $state$0 = State('12');
    final $result$0 = _Tagshort$1($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 12');
    final $value$0 = $result$0!;
    expect($value$0, '1',
        reason: 'Testing \'result = value\' failed, input: 12');
    expect($state$0.pos, 1, reason: 'Testing \'state.pos\' failed, input: 12');
    final $state$1 = State('12');
    final $result$1 = _Tagshort_NoResult$1($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 12');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 12');
    expect($state$1.pos, 1, reason: 'Testing \'state.pos\' failed, input: 12');
    final $state$2 = State('1');
    final $result$2 = _Tagshort$1($state$2);
    expect($state$2.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 1');
    final $value$2 = $result$2!;
    expect($value$2, '1',
        reason: 'Testing \'result = value\' failed, input: 1');
    expect($state$2.pos, 1, reason: 'Testing \'state.pos\' failed, input: 1');
    final $state$3 = State('1');
    final $result$3 = _Tagshort_NoResult$1($state$3);
    expect($state$3.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 1');
    final $value$3 = $result$3;
    expect($value$3, null,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$3.pos, 1, reason: 'Testing \'state.pos\' failed, input: 1');
    final $state$4 = State('');
    final $result$4 = _Tagshort$1($state$4);
    expect($state$4.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$4, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$4.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$4.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$5 = State('');
    final $result$5 = _Tagshort_NoResult$1($state$5);
    expect($state$5.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$5, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$5.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$5.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$5.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$6 = State('2');
    final $result$6 = _Tagshort$1($state$6);
    expect($state$6.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect($result$6, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$6.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$6.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$6.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect($state$6.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: 2');
    final $state$7 = State('2');
    final $result$7 = _Tagshort_NoResult$1($state$7);
    expect($state$7.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 2');
    expect($result$7, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$7.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$7.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$7.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 2');
    expect($state$7.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: 2');
  });
}

void _test_Taglong$1() {
  // Tag (long)
  test('Tag (long)', () {
    final $state$0 = State('1234567890');
    final $result$0 = _Taglong$1($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 1234567890');
    final $value$0 = $result$0!;
    expect($value$0, '123456789',
        reason: 'Testing \'result = value\' failed, input: 1234567890');
    expect($state$0.pos, 9,
        reason: 'Testing \'state.pos\' failed, input: 1234567890');
    final $state$1 = State('1234567890');
    final $result$1 = _Taglong_NoResult$1($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 1234567890');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: 1234567890');
    expect($state$1.pos, 9,
        reason: 'Testing \'state.pos\' failed, input: 1234567890');
    final $state$2 = State('123456789');
    final $result$2 = _Taglong$1($state$2);
    expect($state$2.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 123456789');
    final $value$2 = $result$2!;
    expect($value$2, '123456789',
        reason: 'Testing \'result = value\' failed, input: 123456789');
    expect($state$2.pos, 9,
        reason: 'Testing \'state.pos\' failed, input: 123456789');
    final $state$3 = State('123456789');
    final $result$3 = _Taglong_NoResult$1($state$3);
    expect($state$3.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 123456789');
    final $value$3 = $result$3;
    expect($value$3, null,
        reason: 'Testing \'result == null\' failed, input: 123456789');
    expect($state$3.pos, 9,
        reason: 'Testing \'state.pos\' failed, input: 123456789');
    final $state$4 = State('');
    final $result$4 = _Taglong$1($state$4);
    expect($state$4.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$4, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$4.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$4.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$5 = State('');
    final $result$5 = _Taglong_NoResult$1($state$5);
    expect($state$5.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$5, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$5.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$5.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$5.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$6 = State('12345678');
    final $result$6 = _Taglong$1($state$6);
    expect($state$6.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 12345678');
    expect($result$6, null,
        reason: 'Testing \'result == null\' failed, input: 12345678');
    expect($state$6.pos, 0,
        reason: 'Testing \'state.pos\' failed, input: 12345678');
    expect($state$6.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 12345678');
    expect($state$6.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 12345678');
    expect($state$6.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: 12345678');
    final $state$7 = State('12345678');
    final $result$7 = _Taglong_NoResult$1($state$7);
    expect($state$7.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: 12345678');
    expect($result$7, null,
        reason: 'Testing \'result == null\' failed, input: 12345678');
    expect($state$7.pos, 0,
        reason: 'Testing \'state.pos\' failed, input: 12345678');
    expect($state$7.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 12345678');
    expect($state$7.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: 12345678');
    expect($state$7.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: 12345678');
  });
}

void _test_Unterminated$0() {
  // Unterminated
  test('Unterminated', () {
    final $state$0 = State('"123"');
    final $result$0 = _Unterminated$0($state$0);
    expect($state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: "123"');
    final $value$0 = $result$0!;
    expect($value$0, '123', reason: 'Testing \'result\' failed, input: "123"');
    expect($state$0.pos, 5,
        reason: 'Testing \'state.pos\' failed, input: "123"');
    final $state$1 = State('"123"');
    final $result$1 = _Unterminated_NoResult$0($state$1);
    expect($state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: "123"');
    final $value$1 = $result$1;
    expect($value$1, null,
        reason: 'Testing \'result == null\' failed, input: "123"');
    expect($state$1.pos, 5,
        reason: 'Testing \'state.pos\' failed, input: "123"');
    final $state$2 = State('');
    final $result$2 = _Unterminated$0($state$2);
    expect($state$2.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$2, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$2.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$2.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$3 = State('');
    final $result$3 = _Unterminated_NoResult$0($state$3);
    expect($state$3.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: ');
    expect($result$3, null,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$3.errorCount, 1,
        reason: 'Testing \'state.errorCount\' failed, input: ');
    expect($state$3.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$4 = State('"123');
    final $result$4 = _Unterminated$0($state$4);
    expect($state$4.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: "123');
    expect($result$4, null,
        reason: 'Testing \'result == null\' failed, input: "123');
    expect($state$4.pos, 0,
        reason: 'Testing \'state.pos\' failed, input: "123');
    expect($state$4.failPos, 4,
        reason: 'Testing \'state.failPos\' failed, input: "123');
    expect($state$4.errorCount, 2,
        reason: 'Testing \'state.errorCount\' failed, input: "123');
    expect($state$4.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: "123');
    expect($state$4.errors[1], isA<ErrorMessage>(),
        reason: 'Testing \'state.error\' failed, input: "123');
    expect(($state$4.errors[1] as ErrorMessage).message, 'unterminated',
        reason: 'Testing \'ErrorMessage.message\' failed, input: "123');
    expect(($state$4.errors[1] as ErrorMessage).length, -4,
        reason: 'Testing \'ErrorMessage.length\' failed, input: "123');
    final $state$5 = State('"123');
    final $result$5 = _Unterminated_NoResult$0($state$5);
    expect($state$5.ok, false,
        reason: 'Testing \'state.ok == false\' failed, input: "123');
    expect($result$5, null,
        reason: 'Testing \'result == null\' failed, input: "123');
    expect($state$5.pos, 0,
        reason: 'Testing \'state.pos\' failed, input: "123');
    expect($state$5.failPos, 4,
        reason: 'Testing \'state.failPos\' failed, input: "123');
    expect($state$5.errorCount, 2,
        reason: 'Testing \'state.errorCount\' failed, input: "123');
    expect($state$5.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: "123');
    expect($state$5.errors[1], isA<ErrorMessage>(),
        reason: 'Testing \'state.error\' failed, input: "123');
    expect(($state$5.errors[1] as ErrorMessage).message, 'unterminated',
        reason: 'Testing \'ErrorMessage.message\' failed, input: "123');
    expect(($state$5.errors[1] as ErrorMessage).length, -4,
        reason: 'Testing \'ErrorMessage.length\' failed, input: "123');
  });
}

int? _And$0(State<String> state) {
  int? $0;
  final pos$0 = state.pos;
  int? $1;
  if (state.ok = state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 48) {
    state.pos += 1;
    $1 = 48;
  } else {
    state.fail(const ErrorExpectedChar(48));
  }
  if (state.ok) {
    final pos$1 = state.pos;
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 49) {
      state.pos += 1;
    } else {
      state.fail(const ErrorExpectedChar(49));
    }
    if (state.ok) {
      state.pos = pos$1;
    }
    if (state.ok) {
      $0 = $1;
    } else {
      state.pos = pos$0;
    }
  }
  return $0;
}

Object? _And_NoResult$0(State<String> state) {
  Object? $0;
  final pos$0 = state.pos;
  if (state.ok = state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 48) {
    state.pos += 1;
  } else {
    state.fail(const ErrorExpectedChar(48));
  }
  if (state.ok) {
    final pos$1 = state.pos;
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 49) {
      state.pos += 1;
    } else {
      state.fail(const ErrorExpectedChar(49));
    }
    if (state.ok) {
      state.pos = pos$1;
    }
    if (!state.ok) {
      state.pos = pos$0;
    }
  }
  return $0;
}

int? _And$1(State<String> state) {
  int? $0;
  if (state.ok = state.pos < state.input.length) {
    final c = state.input.runeAt(state.pos);
    state.pos += c <= 0xffff ? 1 : 2;
    $0 = c;
  } else {
    state.fail(const ErrorUnexpectedEof());
  }
  return $0;
}

Object? _And_NoResult$1(State<String> state) {
  Object? $0;
  if (state.ok = state.pos < state.input.length) {
    final c = state.input.runeAt(state.pos);
    state.pos += c <= 0xffff ? 1 : 2;
  } else {
    state.fail(const ErrorUnexpectedEof());
  }
  return $0;
}

int? _Char16bit$0(State<String> state) {
  int? $0;
  if (state.ok = state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 48) {
    state.pos += 1;
    $0 = 48;
  } else {
    state.fail(const ErrorExpectedChar(48));
  }
  return $0;
}

Object? _Char16bit_NoResult$0(State<String> state) {
  Object? $0;
  if (state.ok = state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 48) {
    state.pos += 1;
  } else {
    state.fail(const ErrorExpectedChar(48));
  }
  return $0;
}

int? _Char32bit$0(State<String> state) {
  int? $0;
  if (state.ok = state.pos < state.input.length &&
      state.input.runeAt(state.pos) == 128512) {
    state.pos += 2;
    $0 = 128512;
  } else {
    state.fail(const ErrorExpectedChar(128512));
  }
  return $0;
}

Object? _Char32bit_NoResult$0(State<String> state) {
  Object? $0;
  if (state.ok = state.pos < state.input.length &&
      state.input.runeAt(state.pos) == 128512) {
    state.pos += 2;
  } else {
    state.fail(const ErrorExpectedChar(128512));
  }
  return $0;
}

int? _Choice2variants$0(State<String> state) {
  int? $0;
  int? $1;
  if (state.ok = state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 48) {
    state.pos += 1;
    $1 = 48;
  } else {
    state.fail(const ErrorExpectedChar(48));
  }
  if (state.ok) {
    $0 = $1;
  } else {
    int? $2;
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 49) {
      state.pos += 1;
      $2 = 49;
    } else {
      state.fail(const ErrorExpectedChar(49));
    }
    if (state.ok) {
      $0 = $2;
    }
  }
  return $0;
}

Object? _Choice2variants_NoResult$0(State<String> state) {
  Object? $0;
  if (state.ok = state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 48) {
    state.pos += 1;
  } else {
    state.fail(const ErrorExpectedChar(48));
  }
  if (!state.ok) {
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 49) {
      state.pos += 1;
    } else {
      state.fail(const ErrorExpectedChar(49));
    }
  }
  return $0;
}

int? _Choice3variants$0(State<String> state) {
  int? $0;
  int? $1;
  if (state.ok = state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 48) {
    state.pos += 1;
    $1 = 48;
  } else {
    state.fail(const ErrorExpectedChar(48));
  }
  if (state.ok) {
    $0 = $1;
  } else {
    int? $2;
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 49) {
      state.pos += 1;
      $2 = 49;
    } else {
      state.fail(const ErrorExpectedChar(49));
    }
    if (state.ok) {
      $0 = $2;
    } else {
      int? $3;
      if (state.ok = state.pos < state.input.length &&
          state.input.codeUnitAt(state.pos) == 50) {
        state.pos += 1;
        $3 = 50;
      } else {
        state.fail(const ErrorExpectedChar(50));
      }
      if (state.ok) {
        $0 = $3;
      }
    }
  }
  return $0;
}

Object? _Choice3variants_NoResult$0(State<String> state) {
  Object? $0;
  if (state.ok = state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 48) {
    state.pos += 1;
  } else {
    state.fail(const ErrorExpectedChar(48));
  }
  if (!state.ok) {
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 49) {
      state.pos += 1;
    } else {
      state.fail(const ErrorExpectedChar(49));
    }
    if (!state.ok) {
      if (state.ok = state.pos < state.input.length &&
          state.input.codeUnitAt(state.pos) == 50) {
        state.pos += 1;
      } else {
        state.fail(const ErrorExpectedChar(50));
      }
    }
  }
  return $0;
}

int? _Char16bit$1(State<String> state) {
  int? $0;
  if (state.ok = state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 49) {
    state.pos += 1;
    $0 = 49;
  } else {
    state.fail(const ErrorExpectedChar(49));
  }
  return $0;
}

Object? _Char16bit_NoResult$1(State<String> state) {
  Object? $0;
  if (state.ok = state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 49) {
    state.pos += 1;
  } else {
    state.fail(const ErrorExpectedChar(49));
  }
  return $0;
}

int? _Char32bit$1(State<String> state) {
  int? $0;
  if (state.ok = state.pos < state.input.length &&
      state.input.runeAt(state.pos) == 128512) {
    state.pos += 2;
    $0 = 128512;
  } else {
    state.fail(const ErrorExpectedChar(128512));
  }
  return $0;
}

Object? _Char32bit_NoResult$1(State<String> state) {
  Object? $0;
  if (state.ok = state.pos < state.input.length &&
      state.input.runeAt(state.pos) == 128512) {
    state.pos += 2;
  } else {
    state.fail(const ErrorExpectedChar(128512));
  }
  return $0;
}

int? _Delimited$0(State<String> state) {
  int? $0;
  final pos$0 = state.pos;
  if (state.ok = state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 49) {
    state.pos += 1;
  } else {
    state.fail(const ErrorExpectedChar(49));
  }
  if (state.ok) {
    int? $1;
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 50) {
      state.pos += 1;
      $1 = 50;
    } else {
      state.fail(const ErrorExpectedChar(50));
    }
    if (state.ok) {
      if (state.ok = state.pos < state.input.length &&
          state.input.codeUnitAt(state.pos) == 51) {
        state.pos += 1;
      } else {
        state.fail(const ErrorExpectedChar(51));
      }
      if (state.ok) {
        $0 = $1;
      }
    }
  }
  if (!state.ok) {
    state.pos = pos$0;
  }
  return $0;
}

Object? _Delimited_NoResult$0(State<String> state) {
  Object? $0;
  final pos$0 = state.pos;
  if (state.ok = state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 49) {
    state.pos += 1;
  } else {
    state.fail(const ErrorExpectedChar(49));
  }
  if (state.ok) {
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 50) {
      state.pos += 1;
    } else {
      state.fail(const ErrorExpectedChar(50));
    }
    if (state.ok) {
      if (state.ok = state.pos < state.input.length &&
          state.input.codeUnitAt(state.pos) == 51) {
        state.pos += 1;
      } else {
        state.fail(const ErrorExpectedChar(51));
      }
    }
  }
  if (!state.ok) {
    state.pos = pos$0;
  }
  return $0;
}

Object? _Eof$0(State<String> state) {
  Object? $0;
  if (!(state.ok = state.pos >= state.input.length)) {
    state.fail(const ErrorExpectedEof());
  }
  return $0;
}

Object? _Eof_NoResult$0(State<String> state) {
  Object? $0;
  if (!(state.ok = state.pos >= state.input.length)) {
    state.fail(const ErrorExpectedEof());
  }
  return $0;
}

(int, int)? _Expected$0(State<String> state) {
  (int, int)? $0;
  final failPos$0 = state.failPos;
  final errorCount$0 = state.errorCount;
  (int, int)? $1;
  final pos$0 = state.pos;
  int? $2;
  if (state.ok = state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 49) {
    state.pos += 1;
    $2 = 49;
  } else {
    state.fail(const ErrorExpectedChar(49));
  }
  if (state.ok) {
    int? $3;
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 50) {
      state.pos += 1;
      $3 = 50;
    } else {
      state.fail(const ErrorExpectedChar(50));
    }
    if (state.ok) {
      $1 = ($2!, $3!);
    } else {
      state.pos = pos$0;
    }
  }
  if (state.ok) {
    $0 = $1;
  } else if (state.failPos >= failPos$0) {
    final (bool, List<ParseError>?) v;
    v = state.pos != state.failPos
        ? const (false, null)
        : const (
            true,
            [
              ErrorExpectedTags(['expr'])
            ]
          );
    if (v.$1) {
      state.errorCount = state.failPos > failPos$0 ? 0 : errorCount$0;
    }
    if (v.$2 != null) {
      final list = v.$2!;
      for (var i = 0; i < list.length; i++) {
        state.errors[state.errorCount++] = list[i];
      }
    }
  }
  return $0;
}

Object? _Expected_NoResult$0(State<String> state) {
  Object? $0;
  final failPos$0 = state.failPos;
  final errorCount$0 = state.errorCount;
  final pos$0 = state.pos;
  if (state.ok = state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 49) {
    state.pos += 1;
  } else {
    state.fail(const ErrorExpectedChar(49));
  }
  if (state.ok) {
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 50) {
      state.pos += 1;
    } else {
      state.fail(const ErrorExpectedChar(50));
    }
    if (!state.ok) {
      state.pos = pos$0;
    }
  }
  if (!state.ok && state.failPos >= failPos$0) {
    final (bool, List<ParseError>?) v;
    v = state.pos != state.failPos
        ? const (false, null)
        : const (
            true,
            [
              ErrorExpectedTags(['expr'])
            ]
          );
    if (v.$1) {
      state.errorCount = state.failPos > failPos$0 ? 0 : errorCount$0;
    }
    if (v.$2 != null) {
      final list = v.$2!;
      for (var i = 0; i < list.length; i++) {
        state.errors[state.errorCount++] = list[i];
      }
    }
  }
  return $0;
}

List<int>? _Many$0(State<String> state) {
  List<int>? $0;
  final list$0 = <int>[];
  while (true) {
    int? $1;
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 49) {
      state.pos += 1;
      $1 = 49;
    } else {
      state.fail(const ErrorExpectedChar(49));
    }
    if (!state.ok) {
      break;
    }
    list$0.add($1!);
  }
  if (state.ok = true) {
    $0 = list$0;
  }
  return $0;
}

Object? _Many_NoResult$0(State<String> state) {
  Object? $0;
  while (true) {
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 49) {
      state.pos += 1;
    } else {
      state.fail(const ErrorExpectedChar(49));
    }
    if (!state.ok) {
      break;
    }
  }
  state.ok = true;
  return $0;
}

List<int>? _Many1$0(State<String> state) {
  List<int>? $0;
  final list$0 = <int>[];
  while (true) {
    int? $1;
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 49) {
      state.pos += 1;
      $1 = 49;
    } else {
      state.fail(const ErrorExpectedChar(49));
    }
    if (!state.ok) {
      break;
    }
    list$0.add($1!);
  }
  if (state.ok = list$0.isNotEmpty) {
    $0 = list$0;
  }
  return $0;
}

Object? _Many1_NoResult$0(State<String> state) {
  Object? $0;
  var count$0 = 0;
  while (true) {
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 49) {
      state.pos += 1;
    } else {
      state.fail(const ErrorExpectedChar(49));
    }
    if (!state.ok) {
      break;
    }
    count$0++;
  }
  state.ok = count$0 != 0;
  return $0;
}

int? _ManyCount$0(State<String> state) {
  int? $0;
  var count$0 = 0;
  while (true) {
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 49) {
      state.pos += 1;
    } else {
      state.fail(const ErrorExpectedChar(49));
    }
    if (!state.ok) {
      break;
    }
    count$0++;
  }
  if (state.ok = true) {
    $0 = count$0;
  }
  return $0;
}

Object? _ManyCount_NoResult$0(State<String> state) {
  Object? $0;
  while (true) {
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 49) {
      state.pos += 1;
    } else {
      state.fail(const ErrorExpectedChar(49));
    }
    if (!state.ok) {
      break;
    }
  }
  state.ok = true;
  return $0;
}

int? _Many1Count$0(State<String> state) {
  int? $0;
  var count$0 = 0;
  while (true) {
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 49) {
      state.pos += 1;
    } else {
      state.fail(const ErrorExpectedChar(49));
    }
    if (!state.ok) {
      break;
    }
    count$0++;
  }
  if (state.ok = count$0 != 0) {
    $0 = count$0;
  }
  return $0;
}

Object? _Many1Count_NoResult$0(State<String> state) {
  Object? $0;
  var count$0 = 0;
  while (true) {
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 49) {
      state.pos += 1;
    } else {
      state.fail(const ErrorExpectedChar(49));
    }
    if (!state.ok) {
      break;
    }
    count$0++;
  }
  state.ok = count$0 != 0;
  return $0;
}

List<int>? _ManyMN03$0(State<String> state) {
  List<int>? $0;
  final list$0 = <int>[];
  while (list$0.length < 3) {
    int? $1;
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 49) {
      state.pos += 1;
      $1 = 49;
    } else {
      state.fail(const ErrorExpectedChar(49));
    }
    if (!state.ok) {
      break;
    }
    list$0.add($1!);
  }
  if (state.ok = true) {
    $0 = list$0;
  }
  return $0;
}

Object? _ManyMN03_NoResult$0(State<String> state) {
  Object? $0;
  var count$0 = 0;
  while (count$0 < 3) {
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 49) {
      state.pos += 1;
    } else {
      state.fail(const ErrorExpectedChar(49));
    }
    if (!state.ok) {
      break;
    }
    count$0++;
  }
  state.ok = true;
  return $0;
}

List<int>? _ManyMN23$0(State<String> state) {
  List<int>? $0;
  final pos$0 = state.pos;
  final list$0 = <int>[];
  while (list$0.length < 3) {
    int? $1;
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 49) {
      state.pos += 1;
      $1 = 49;
    } else {
      state.fail(const ErrorExpectedChar(49));
    }
    if (!state.ok) {
      break;
    }
    list$0.add($1!);
  }
  if (state.ok = list$0.length >= 2) {
    $0 = list$0;
  } else {
    state.pos = pos$0;
  }
  return $0;
}

Object? _ManyMN23_NoResult$0(State<String> state) {
  Object? $0;
  final pos$0 = state.pos;
  var count$0 = 0;
  while (count$0 < 3) {
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 49) {
      state.pos += 1;
    } else {
      state.fail(const ErrorExpectedChar(49));
    }
    if (!state.ok) {
      break;
    }
    count$0++;
  }
  if (!(state.ok = count$0 >= 2)) {
    state.pos = pos$0;
  }
  return $0;
}

int? _Not$0(State<String> state) {
  int? $0;
  final pos$0 = state.pos;
  int? $1;
  if (state.ok = state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 48) {
    state.pos += 1;
    $1 = 48;
  } else {
    state.fail(const ErrorExpectedChar(48));
  }
  if (state.ok) {
    final pos$1 = state.pos;
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 49) {
      state.pos += 1;
    } else {
      state.fail(const ErrorExpectedChar(49));
    }
    state.ok = !state.ok;
    if (!state.ok) {
      final length = state.pos - pos$1;
      state.pos = pos$1;
      state.fail(ErrorUnexpectedInput(length));
    }
    if (state.ok) {
      $0 = $1;
    } else {
      state.pos = pos$0;
    }
  }
  return $0;
}

Object? _Not_NoResult$0(State<String> state) {
  Object? $0;
  final pos$0 = state.pos;
  if (state.ok = state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 48) {
    state.pos += 1;
  } else {
    state.fail(const ErrorExpectedChar(48));
  }
  if (state.ok) {
    final pos$1 = state.pos;
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 49) {
      state.pos += 1;
    } else {
      state.fail(const ErrorExpectedChar(49));
    }
    state.ok = !state.ok;
    if (!state.ok) {
      final length = state.pos - pos$1;
      state.pos = pos$1;
      state.fail(ErrorUnexpectedInput(length));
    }
    if (!state.ok) {
      state.pos = pos$0;
    }
  }
  return $0;
}

int? _Preceded$0(State<String> state) {
  int? $0;
  final pos$0 = state.pos;
  if (state.ok = state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 49) {
    state.pos += 1;
  } else {
    state.fail(const ErrorExpectedChar(49));
  }
  if (state.ok) {
    int? $1;
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 50) {
      state.pos += 1;
      $1 = 50;
    } else {
      state.fail(const ErrorExpectedChar(50));
    }
    if (state.ok) {
      $0 = $1;
    } else {
      state.pos = pos$0;
    }
  }
  return $0;
}

Object? _Preceded_NoResult$0(State<String> state) {
  Object? $0;
  final pos$0 = state.pos;
  if (state.ok = state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 49) {
    state.pos += 1;
  } else {
    state.fail(const ErrorExpectedChar(49));
  }
  if (state.ok) {
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 50) {
      state.pos += 1;
    } else {
      state.fail(const ErrorExpectedChar(50));
    }
    if (!state.ok) {
      state.pos = pos$0;
    }
  }
  return $0;
}

String? _Tagshort$0(State<String> state) {
  String? $0;
  const tag$0 = '0';
  if (state.ok = state.pos + 1 <= state.input.length &&
      state.input.codeUnitAt(state.pos) == 48) {
    state.pos += 1;
    $0 = tag$0;
  } else {
    state.fail(const ErrorExpectedTags([tag$0]));
  }
  return $0;
}

Object? _Tagshort_NoResult$0(State<String> state) {
  Object? $0;
  const tag$0 = '0';
  if (state.ok = state.pos + 1 <= state.input.length &&
      state.input.codeUnitAt(state.pos) == 48) {
    state.pos += 1;
  } else {
    state.fail(const ErrorExpectedTags([tag$0]));
  }
  return $0;
}

String? _Taglong$0(State<String> state) {
  String? $0;
  const tag$0 = '😀';
  if (state.ok = state.pos + 2 <= state.input.length &&
      state.input.codeUnitAt(state.pos) == 55357 &&
      state.input.codeUnitAt(state.pos + 1) == 56832) {
    state.pos += 2;
    $0 = tag$0;
  } else {
    state.fail(const ErrorExpectedTags([tag$0]));
  }
  return $0;
}

Object? _Taglong_NoResult$0(State<String> state) {
  Object? $0;
  const tag$0 = '😀';
  if (state.ok = state.pos + 2 <= state.input.length &&
      state.input.codeUnitAt(state.pos) == 55357 &&
      state.input.codeUnitAt(state.pos + 1) == 56832) {
    state.pos += 2;
  } else {
    state.fail(const ErrorExpectedTags([tag$0]));
  }
  return $0;
}

String? _Tags$0(State<String> state) {
  String? $0;
  final pos$0 = state.pos;
  if (pos$0 < state.input.length) {
    final c = state.input.codeUnitAt(pos$0);
    if (c == 97) {
      if (state.input.startsWith('abc', state.pos)) {
        state.pos += 3;
        $0 = 'abc';
      } else if (state.input.startsWith('ab', state.pos)) {
        state.pos += 2;
        $0 = 'ab';
      } else {
        state.pos += 1;
        $0 = 'a';
      }
    } else if (c == 98) {
      if (state.input.startsWith('bc', state.pos)) {
        state.pos += 2;
        $0 = 'bc';
      } else {
        state.pos += 1;
        $0 = 'b';
      }
    } else if (c == 99) {
      state.pos += 1;
      $0 = 'c';
    } else if (c == 55357) {
      if (state.input.startsWith('😀😀', state.pos)) {
        state.pos += 4;
        $0 = '😀😀';
      } else if (state.input.startsWith('😀', state.pos)) {
        state.pos += 2;
        $0 = '😀';
      }
    }
  }
  if (!(state.ok = state.pos != pos$0)) {
    state.failAll([
      const ErrorExpectedTags(['a', 'ab', 'abc', 'b', 'bc', 'c', '😀', '😀😀'])
    ]);
  }
  return $0;
}

Object? _Tags_NoResult$0(State<String> state) {
  Object? $0;
  final pos$0 = state.pos;
  if (pos$0 < state.input.length) {
    final c = state.input.codeUnitAt(pos$0);
    if (c == 97) {
      if (state.input.startsWith('abc', state.pos)) {
        state.pos += 3;
      } else if (state.input.startsWith('ab', state.pos)) {
        state.pos += 2;
      } else {
        state.pos += 1;
      }
    } else if (c == 98) {
      if (state.input.startsWith('bc', state.pos)) {
        state.pos += 2;
      } else {
        state.pos += 1;
      }
    } else if (c == 99) {
      state.pos += 1;
    } else if (c == 55357) {
      if (state.input.startsWith('😀😀', state.pos)) {
        state.pos += 4;
      } else if (state.input.startsWith('😀', state.pos)) {
        state.pos += 2;
      }
    }
  }
  if (!(state.ok = state.pos != pos$0)) {
    state.failAll([
      const ErrorExpectedTags(['a', 'ab', 'abc', 'b', 'bc', 'c', '😀', '😀😀'])
    ]);
  }
  return $0;
}

String? _TakeWhileMN03$0(State<String> state) {
  String? $0;
  final input$0 = state.input;
  final pos$0 = state.pos;
  var count$0 = 0;
  while (count$0 < 3 && state.pos < input$0.length) {
    final c = input$0.runeAt(state.pos);
    final v = c == 0x1f600;
    if (!v) {
      break;
    }
    state.pos += c < 0xffff ? 1 : 2;
    count$0++;
  }
  if (state.ok = true) {
    $0 = state.pos != pos$0 ? input$0.substring(pos$0, state.pos) : '';
  }
  return $0;
}

Object? _TakeWhileMN03_NoResult$0(State<String> state) {
  Object? $0;
  final input$0 = state.input;
  var count$0 = 0;
  while (count$0 < 3 && state.pos < input$0.length) {
    final c = input$0.runeAt(state.pos);
    final v = c == 0x1f600;
    if (!v) {
      break;
    }
    state.pos += c < 0xffff ? 1 : 2;
    count$0++;
  }
  state.ok = true;
  return $0;
}

String? _TakeWhileMN12$0(State<String> state) {
  String? $0;
  final input$0 = state.input;
  final pos$0 = state.pos;
  var count$0 = 0;
  while (count$0 < 2 && state.pos < input$0.length) {
    final c = input$0.runeAt(state.pos);
    final v = c == 0x1f600;
    if (!v) {
      break;
    }
    state.pos += c < 0xffff ? 1 : 2;
    count$0++;
  }
  if (state.ok = count$0 >= 1) {
    $0 = state.pos != pos$0 ? input$0.substring(pos$0, state.pos) : '';
  } else {
    final failPos = state.pos;
    state.pos = pos$0;
    state.failAt(failPos, const ErrorUnexpectedChar());
  }
  return $0;
}

Object? _TakeWhileMN12_NoResult$0(State<String> state) {
  Object? $0;
  final input$0 = state.input;
  final pos$0 = state.pos;
  var count$0 = 0;
  while (count$0 < 2 && state.pos < input$0.length) {
    final c = input$0.runeAt(state.pos);
    final v = c == 0x1f600;
    if (!v) {
      break;
    }
    state.pos += c < 0xffff ? 1 : 2;
    count$0++;
  }
  if (!(state.ok = count$0 >= 1)) {
    final failPos = state.pos;
    state.pos = pos$0;
    state.failAt(failPos, const ErrorUnexpectedChar());
  }
  return $0;
}

String? _TakeWhile$0(State<String> state) {
  String? $0;
  final input$0 = state.input;
  final pos$0 = state.pos;
  while (state.pos < input$0.length) {
    final c = input$0.runeAt(state.pos);
    final v = c == 0x1f600;
    if (!v) {
      break;
    }
    state.pos += c < 0xffff ? 1 : 2;
  }
  if (state.ok = true) {
    $0 = state.pos != pos$0 ? input$0.substring(pos$0, state.pos) : '';
  }
  return $0;
}

Object? _TakeWhile_NoResult$0(State<String> state) {
  Object? $0;
  final input$0 = state.input;
  while (state.pos < input$0.length) {
    final c = input$0.runeAt(state.pos);
    final v = c == 0x1f600;
    if (!v) {
      break;
    }
    state.pos += c < 0xffff ? 1 : 2;
  }
  state.ok = true;
  return $0;
}

String? _TakeWhile1$0(State<String> state) {
  String? $0;
  final input$0 = state.input;
  final pos$0 = state.pos;
  while (state.pos < input$0.length) {
    final c = input$0.runeAt(state.pos);
    final v = c == 0x1f600;
    if (!v) {
      break;
    }
    state.pos += c < 0xffff ? 1 : 2;
  }
  if (state.ok = state.pos != pos$0) {
    $0 = input$0.substring(pos$0, state.pos);
  } else {
    final failPos = state.pos;
    state.pos = pos$0;
    state.failAt(failPos, const ErrorUnexpectedChar());
  }
  return $0;
}

Object? _TakeWhile1_NoResult$0(State<String> state) {
  Object? $0;
  final input$0 = state.input;
  final pos$0 = state.pos;
  while (state.pos < input$0.length) {
    final c = input$0.runeAt(state.pos);
    final v = c == 0x1f600;
    if (!v) {
      break;
    }
    state.pos += c < 0xffff ? 1 : 2;
  }
  if (!(state.ok = state.pos != pos$0)) {
    final failPos = state.pos;
    state.pos = pos$0;
    state.failAt(failPos, const ErrorUnexpectedChar());
  }
  return $0;
}

int? _Terminated$0(State<String> state) {
  int? $0;
  final pos$0 = state.pos;
  int? $1;
  if (state.ok = state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 49) {
    state.pos += 1;
    $1 = 49;
  } else {
    state.fail(const ErrorExpectedChar(49));
  }
  if (state.ok) {
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 50) {
      state.pos += 1;
    } else {
      state.fail(const ErrorExpectedChar(50));
    }
    if (state.ok) {
      $0 = $1;
    } else {
      state.pos = pos$0;
    }
  }
  return $0;
}

Object? _Terminated_NoResult$0(State<String> state) {
  Object? $0;
  final pos$0 = state.pos;
  if (state.ok = state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 49) {
    state.pos += 1;
  } else {
    state.fail(const ErrorExpectedChar(49));
  }
  if (state.ok) {
    if (state.ok = state.pos < state.input.length &&
        state.input.codeUnitAt(state.pos) == 50) {
      state.pos += 1;
    } else {
      state.fail(const ErrorExpectedChar(50));
    }
    if (!state.ok) {
      state.pos = pos$0;
    }
  }
  return $0;
}

String? _Tagshort$1(State<String> state) {
  String? $0;
  const tag$0 = '1';
  if (state.ok = state.pos + 1 <= state.input.length &&
      state.input.codeUnitAt(state.pos) == 49) {
    state.pos += 1;
    $0 = tag$0;
  } else {
    state.fail(const ErrorExpectedTags([tag$0]));
  }
  return $0;
}

Object? _Tagshort_NoResult$1(State<String> state) {
  Object? $0;
  const tag$0 = '1';
  if (state.ok = state.pos + 1 <= state.input.length &&
      state.input.codeUnitAt(state.pos) == 49) {
    state.pos += 1;
  } else {
    state.fail(const ErrorExpectedTags([tag$0]));
  }
  return $0;
}

String? _Taglong$1(State<String> state) {
  String? $0;
  const tag$0 = '123456789';
  final input$0 = state.input;
  if (state.ok = state.pos < input$0.length &&
      input$0.codeUnitAt(state.pos) == 49 &&
      input$0.startsWith(tag$0, state.pos)) {
    state.pos += 9;
    $0 = tag$0;
  } else {
    state.fail(const ErrorExpectedTags([tag$0]));
  }
  return $0;
}

Object? _Taglong_NoResult$1(State<String> state) {
  Object? $0;
  const tag$0 = '123456789';
  final input$0 = state.input;
  if (state.ok = state.pos < input$0.length &&
      input$0.codeUnitAt(state.pos) == 49 &&
      input$0.startsWith(tag$0, state.pos)) {
    state.pos += 9;
  } else {
    state.fail(const ErrorExpectedTags([tag$0]));
  }
  return $0;
}

String? _Unterminated$0(State<String> state) {
  String? $0;
  final failPos$0 = state.failPos;
  final errorCount$0 = state.errorCount;
  String? $1;
  final pos$0 = state.pos;
  const tag$0 = '"';
  if (state.ok = state.pos + 1 <= state.input.length &&
      state.input.codeUnitAt(state.pos) == 34) {
    state.pos += 1;
  } else {
    state.fail(const ErrorExpectedTags([tag$0]));
  }
  if (state.ok) {
    String? $2;
    final input$0 = state.input;
    final pos$1 = state.pos;
    while (state.pos < input$0.length) {
      final c = input$0.codeUnitAt(state.pos);
      final v = c >= 48 && c <= 57;
      if (!v) {
        break;
      }
      state.pos += 1;
    }
    if (state.ok = true) {
      $2 = state.pos != pos$1 ? input$0.substring(pos$1, state.pos) : '';
    }
    if (state.ok) {
      const tag$1 = '"';
      if (state.ok = state.pos + 1 <= state.input.length &&
          state.input.codeUnitAt(state.pos) == 34) {
        state.pos += 1;
      } else {
        state.fail(const ErrorExpectedTags([tag$1]));
      }
      if (state.ok) {
        $1 = $2;
      }
    }
  }
  if (!state.ok) {
    state.pos = pos$0;
  }
  if (state.ok) {
    $0 = $1;
  } else if (state.failPos >= failPos$0) {
    final (bool, List<ParseError>?) v;
    v = state.pos == state.failPos
        ? const (false, null)
        : (false, [ErrorMessage(state.pos - state.failPos, 'unterminated')]);
    if (v.$1) {
      state.errorCount = state.failPos > failPos$0 ? 0 : errorCount$0;
    }
    if (v.$2 != null) {
      final list = v.$2!;
      for (var i = 0; i < list.length; i++) {
        state.errors[state.errorCount++] = list[i];
      }
    }
  }
  return $0;
}

Object? _Unterminated_NoResult$0(State<String> state) {
  Object? $0;
  final failPos$0 = state.failPos;
  final errorCount$0 = state.errorCount;
  final pos$0 = state.pos;
  const tag$0 = '"';
  if (state.ok = state.pos + 1 <= state.input.length &&
      state.input.codeUnitAt(state.pos) == 34) {
    state.pos += 1;
  } else {
    state.fail(const ErrorExpectedTags([tag$0]));
  }
  if (state.ok) {
    final input$0 = state.input;
    while (state.pos < input$0.length) {
      final c = input$0.codeUnitAt(state.pos);
      final v = c >= 48 && c <= 57;
      if (!v) {
        break;
      }
      state.pos += 1;
    }
    state.ok = true;
    if (state.ok) {
      const tag$1 = '"';
      if (state.ok = state.pos + 1 <= state.input.length &&
          state.input.codeUnitAt(state.pos) == 34) {
        state.pos += 1;
      } else {
        state.fail(const ErrorExpectedTags([tag$1]));
      }
    }
  }
  if (!state.ok) {
    state.pos = pos$0;
  }
  if (!state.ok && state.failPos >= failPos$0) {
    final (bool, List<ParseError>?) v;
    v = state.pos == state.failPos
        ? const (false, null)
        : (false, [ErrorMessage(state.pos - state.failPos, 'unterminated')]);
    if (v.$1) {
      state.errorCount = state.failPos > failPos$0 ? 0 : errorCount$0;
    }
    if (v.$2 != null) {
      final list = v.$2!;
      for (var i = 0; i < list.length; i++) {
        state.errors[state.errorCount++] = list[i];
      }
    }
  }
  return $0;
}

class ErrorExpectedChar extends ParseError {
  final int char;

  const ErrorExpectedChar(this.char);

  @override
  String getMessage({
    required Object input,
    required int offset,
  }) {
    if (input is String) {
      final value = escape(char);
      return 'Expected character $value';
    } else {
      return 'Expected character';
    }
  }
}

class ErrorExpectedEof extends ParseError {
  const ErrorExpectedEof();

  @override
  String getMessage({
    required Object input,
    required int offset,
  }) {
    return 'Expected end of file';
  }
}

class ErrorExpectedInt extends ParseError {
  final int size;

  final int value;

  const ErrorExpectedInt(this.size, this.value);

  @override
  String getMessage({
    required Object input,
    required int offset,
  }) {
    var string = value.toRadixString(16);
    if (const [8, 16, 24, 32, 40, 48, 56, 64].contains(size)) {
      string = string.padLeft(size >> 2, '0');
    }
    if (value >= 0 && value <= 0x10ffff) {
      string = '$string (${escape(value)})';
    }
    return 'Expected 0x$string';
  }
}

class ErrorExpectedTags extends ParseError {
  final List<String> tags;

  const ErrorExpectedTags(this.tags);

  @override
  String getMessage({
    required Object input,
    required int offset,
  }) {
    final value = tags.map(escape).join(', ');
    return 'Expected $value';
  }
}

class ErrorMessage extends ParseError {
  @override
  final int length;

  final String message;

  const ErrorMessage(this.length, this.message);

  @override
  String getMessage({
    required Object input,
    required int offset,
  }) {
    return message;
  }
}

class ErrorUnexpectedChar extends ParseError {
  const ErrorUnexpectedChar();

  @override
  String getMessage({
    required Object input,
    required int offset,
  }) {
    if (input is String) {
      final char = input.runeAt(offset);
      final value = escape(char);
      return 'Unexpected character $value';
    } else {
      return 'Unexpected character';
    }
  }
}

class ErrorUnexpectedEof extends ParseError {
  const ErrorUnexpectedEof();

  @override
  String getMessage({
    required Object input,
    required int offset,
  }) {
    return 'Unexpected end of file';
  }
}

class ErrorUnexpectedInput extends ParseError {
  @override
  final int length;

  const ErrorUnexpectedInput(this.length);

  @override
  String getMessage({
    required Object input,
    required int offset,
  }) {
    return 'Unexpected input';
  }
}

class ErrorUnknown extends ParseError {
  const ErrorUnknown();

  @override
  String getMessage({
    required Object input,
    required int offset,
  }) {
    return 'Unknown error';
  }
}

abstract class ParseError {
  const ParseError();

  int get length => 0;

  String escape(Object? value, [bool quote = true]) {
    if (value is int) {
      if (value >= 0 && value <= 0xd7ff ||
          value >= 0xe000 && value <= 0x10ffff) {
        value = String.fromCharCode(value);
      } else {
        return value.toString();
      }
    } else if (value is! String) {
      return value.toString();
    }

    final map = {
      '\b': '\\b',
      '\f': '\\f',
      '\n': '\\n',
      '\r': '\\r',
      '\t': '\\t',
      '\v': '\\v',
    };
    var result = value.toString();
    for (final key in map.keys) {
      result = result.replaceAll(key, map[key]!);
    }
    if (quote) {
      result = "'$result'";
    }
    return result;
  }

  String getMessage({
    required Object input,
    required int offset,
  });
}

class Result<T> {
  final T value;

  const Result(this.value);

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(other) => other is Result<T> && value == other.value;

  @override
  String toString() {
    return '$value';
  }
}

class State<T> {
  Object? context;

  List<ParseError?> errors = List.filled(512, null, growable: false);

  int errorCount = 0;

  int failPos = 0;

  final T input;

  bool ok = false;

  int pos = 0;

  State(this.input);

  @pragma('vm:prefer-inline')
  void fail(ParseError error) {
    ok = false;
    if (pos >= failPos) {
      if (failPos < pos) {
        failPos = pos;
        errorCount = 0;
      }
      errors[errorCount++] = error;
    }
  }

  @pragma('vm:prefer-inline')
  void failAll(List<ParseError> errors) {
    ok = false;
    if (pos >= failPos) {
      if (failPos < pos) {
        failPos = pos;
        errorCount = 0;
      }
      for (var i = 0; i < errors.length; i++) {
        final error = errors[i];
        this.errors[errorCount++] = error;
      }
    }
  }

  @pragma('vm:prefer-inline')
  void failAllAt(int offset, List<ParseError> errors) {
    ok = false;
    if (offset >= failPos) {
      if (failPos < offset) {
        failPos = offset;
        errorCount = 0;
      }
      for (var i = 0; i < errors.length; i++) {
        final error = errors[i];
        this.errors[errorCount++] = error;
      }
    }
  }

  @pragma('vm:prefer-inline')
  void failAt(int offset, ParseError error) {
    ok = false;
    if (offset >= failPos) {
      if (failPos < offset) {
        failPos = offset;
        errorCount = 0;
      }
      errors[errorCount++] = error;
    }
  }

  List<ParseError> getErrors() {
    return List.generate(errorCount, (i) => errors[i]!);
  }

  @override
  String toString() {
    if (input is String) {
      final s = input as String;
      if (pos >= s.length) {
        return '$pos:';
      }
      var length = s.length - pos;
      length = length > 40 ? 40 : length;
      final string = s.substring(pos, pos + length);
      return '$pos:$string';
    } else {
      return super.toString();
    }
  }
}

extension on String {
  @pragma('vm:prefer-inline')
  // ignore: unused_element
  int runeAt(int index) {
    final w1 = codeUnitAt(index++);
    if (w1 > 0xd7ff && w1 < 0xe000) {
      if (index < length) {
        final w2 = codeUnitAt(index);
        if ((w2 & 0xfc00) == 0xdc00) {
          return 0x10000 + ((w1 & 0x3ff) << 10) + (w2 & 0x3ff);
        }
      }
      throw FormatException('Invalid UTF-16 character', this, index - 1);
    }
    return w1;
  }
}
