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
  // Char16
  _test_Char16$0();
  // Char
  _test_Char$0();
  // Delimited
  _test_Delimited$0();
  // Eof
  _test_Eof$0();
  // Expected
  _test_Expected$0();
  // FastSatisfy16
  _test_FastSatisfy16$0();
  // FastSatisfy16
  _test_FastSatisfy16$1();
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
  // ReplaceErrors
  _test_ReplaceErrors$0();
  // StringChars
  _test_StringChars$0();
  // Tag (short)
  _test_Tagshort$0();
  // Tag (long)
  _test_Taglong$0();
  // Tags (16-bit)
  _test_Tags16bit$0();
  // TakeWhileMN (0..3)
  _test_TakeWhileMN03$0();
  // TakeWhileMN (1..2)
  _test_TakeWhileMN12$0();
  // Take16WhileMN (0..3)
  _test_Take16WhileMN03$0();
  // Take16WhileMN (1..2)
  _test_Take16WhileMN12$0();
  // TakeWhile
  _test_TakeWhile$0();
  // TakeWhile1
  _test_TakeWhile1$0();
  // Take16While
  _test_Take16While$0();
  // Take16While1
  _test_Take16While1$0();
  // Terminated
  _test_Terminated$0();
  // Unterminated
  _test_Unterminated$0();
}

void _test_And$0() {
  // And
  test('And', () {
    final $state$0 = State('01');
    final $result$0 = _And$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 01');
    final $value$0 = $result$0!.value;
    expect($value$0, 48, reason: 'Testing \'result.value\' failed, input: 01');
    expect($state$0.pos, 1, reason: 'Testing \'state.pos\' failed, input: 01');
    final $state$1 = State('');
    final $result$1 = _And$0($state$1);
    expect($result$1 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$1.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$1.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$1.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$2 = State('1');
    final $result$2 = _And$0($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 1');
    expect($state$2.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 1');
    final $state$3 = State('0');
    final $result$3 = _And$0($state$3);
    expect($result$3 == null, true,
        reason: 'Testing \'result == null\' failed, input: 0');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: 0');
    expect($state$3.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: 0');
    expect($state$3.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 0');
    expect($state$3.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: 0');
  });
}

void _test_And$1() {
  // And
  test('And', () {
    final $state$0 = State('01');
    final $result$0 = _And$1($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 01');
    final $value$0 = $result$0!.value;
    expect($value$0, 48, reason: 'Testing \'result.value\' failed, input: 01');
    expect($state$0.pos, 1, reason: 'Testing \'state.pos\' failed, input: 01');
    final $state$1 = State('😀');
    final $result$1 = _And$1($state$1);
    expect($result$1 != null, true,
        reason: 'Testing \'result != null\' failed, input: 😀');
    final $value$1 = $result$1!.value;
    expect($value$1, 128512,
        reason: 'Testing \'result.value\' failed, input: 😀');
    expect($state$1.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀');
    final $state$2 = State('');
    final $result$2 = _And$1($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$2.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
  });
}

void _test_Char16bit$0() {
  // Char (16-bit)
  test('Char (16-bit)', () {
    final $state$0 = State('01');
    final $result$0 = _Char16bit$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 01');
    final $value$0 = $result$0!.value;
    expect($value$0, 48, reason: 'Testing \'result.value\' failed, input: 01');
    expect($state$0.pos, 1, reason: 'Testing \'state.pos\' failed, input: 01');
    final $state$1 = State('');
    final $result$1 = _Char16bit$0($state$1);
    expect($result$1 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$1.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$1.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$1.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$2 = State('😀');
    final $result$2 = _Char16bit$0($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: 😀');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: 😀');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 😀');
    expect($state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 😀');
    expect($state$2.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 😀');
  });
}

void _test_Char32bit$0() {
  // Char (32-bit)
  test('Char (32-bit)', () {
    final $state$0 = State('😀');
    final $result$0 = _Char32bit$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 😀');
    final $value$0 = $result$0!.value;
    expect($value$0, 128512,
        reason: 'Testing \'result.value\' failed, input: 😀');
    expect($state$0.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀');
    final $state$1 = State('');
    final $result$1 = _Char32bit$0($state$1);
    expect($result$1 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$1.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$1.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$1.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$2 = State('01');
    final $result$2 = _Char32bit$0($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: 01');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: 01');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 01');
    expect($state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 01');
    expect($state$2.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 01');
  });
}

void _test_Choice2variants$0() {
  // Choice (2 variants)
  test('Choice (2 variants)', () {
    final $state$0 = State('01');
    final $result$0 = _Choice2variants$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 01');
    final $value$0 = $result$0!.value;
    expect($value$0, 48, reason: 'Testing \'result.value\' failed, input: 01');
    expect($state$0.pos, 1, reason: 'Testing \'state.pos\' failed, input: 01');
    final $state$1 = State('12');
    final $result$1 = _Choice2variants$0($state$1);
    expect($result$1 != null, true,
        reason: 'Testing \'result != null\' failed, input: 12');
    final $value$1 = $result$1!.value;
    expect($value$1, 49, reason: 'Testing \'result.value\' failed, input: 12');
    expect($state$1.pos, 1, reason: 'Testing \'state.pos\' failed, input: 12');
    final $state$2 = State('');
    final $result$2 = _Choice2variants$0($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$2.errors.length, 2,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$2.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
    expect($state$2.errors[1], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$3 = State('2');
    final $result$3 = _Choice2variants$0($state$3);
    expect($result$3 == null, true,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$3.errors.length, 2,
        reason: 'Testing \'state.errors.length\' failed, input: 2');
    expect($state$3.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
    expect($state$3.errors[1], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
  });
}

void _test_Choice3variants$0() {
  // Choice (3 variants)
  test('Choice (3 variants)', () {
    final $state$0 = State('01');
    final $result$0 = _Choice3variants$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 01');
    final $value$0 = $result$0!.value;
    expect($value$0, 48, reason: 'Testing \'result.value\' failed, input: 01');
    expect($state$0.pos, 1, reason: 'Testing \'state.pos\' failed, input: 01');
    final $state$1 = State('12');
    final $result$1 = _Choice3variants$0($state$1);
    expect($result$1 != null, true,
        reason: 'Testing \'result != null\' failed, input: 12');
    final $value$1 = $result$1!.value;
    expect($value$1, 49, reason: 'Testing \'result.value\' failed, input: 12');
    expect($state$1.pos, 1, reason: 'Testing \'state.pos\' failed, input: 12');
    final $state$2 = State('23');
    final $result$2 = _Choice3variants$0($state$2);
    expect($result$2 != null, true,
        reason: 'Testing \'result != null\' failed, input: 23');
    final $value$2 = $result$2!.value;
    expect($value$2, 50, reason: 'Testing \'result.value\' failed, input: 23');
    expect($state$2.pos, 1, reason: 'Testing \'state.pos\' failed, input: 23');
    final $state$3 = State('');
    final $result$3 = _Choice3variants$0($state$3);
    expect($result$3 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$3.errors.length, 3,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$3.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
    expect($state$3.errors[1], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
    expect($state$3.errors[2], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$4 = State('3');
    final $result$4 = _Choice3variants$0($state$4);
    expect($result$4 == null, true,
        reason: 'Testing \'result == null\' failed, input: 3');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: 3');
    expect($state$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 3');
    expect($state$4.errors.length, 3,
        reason: 'Testing \'state.errors.length\' failed, input: 3');
    expect($state$4.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 3');
    expect($state$4.errors[1], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 3');
    expect($state$4.errors[2], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 3');
  });
}

void _test_Char16$0() {
  // Char16
  test('Char16', () {
    final $state$0 = State('12');
    final $result$0 = _Char16$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 12');
    final $value$0 = $result$0!.value;
    expect($value$0, 49, reason: 'Testing \'result.value\' failed, input: 12');
    expect($state$0.pos, 1, reason: 'Testing \'state.pos\' failed, input: 12');
    final $state$1 = State('');
    final $result$1 = _Char16$0($state$1);
    expect($result$1 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$1.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$1.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$1.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$2 = State('2');
    final $result$2 = _Char16$0($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 2');
    expect($state$2.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
  });
}

void _test_Char$0() {
  // Char
  test('Char', () {
    final $state$0 = State('😀`');
    final $result$0 = _Char$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 😀`');
    final $value$0 = $result$0!.value;
    expect($value$0, 128512,
        reason: 'Testing \'result.value\' failed, input: 😀`');
    expect($state$0.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀`');
    final $state$1 = State('');
    final $result$1 = _Char$0($state$1);
    expect($result$1 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$1.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$1.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$1.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$2 = State('2');
    final $result$2 = _Char$0($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 2');
    expect($state$2.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
  });
}

void _test_Delimited$0() {
  // Delimited
  test('Delimited', () {
    final $state$0 = State('123');
    final $result$0 = _Delimited$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 123');
    final $value$0 = $result$0!.value;
    expect($value$0, 50, reason: 'Testing \'result.value\' failed, input: 123');
    expect($state$0.pos, 3, reason: 'Testing \'state.pos\' failed, input: 123');
    final $state$1 = State('');
    final $result$1 = _Delimited$0($state$1);
    expect($result$1 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$1.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$1.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$1.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$2 = State('1');
    final $result$2 = _Delimited$0($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$2.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 1');
    expect($state$2.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: 1');
    final $state$3 = State('12');
    final $result$3 = _Delimited$0($state$3);
    expect($result$3 == null, true,
        reason: 'Testing \'result == null\' failed, input: 12');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: 12');
    expect($state$3.failPos, 2,
        reason: 'Testing \'state.failPos\' failed, input: 12');
    expect($state$3.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 12');
    expect($state$3.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: 12');
    final $state$4 = State('2');
    final $result$4 = _Delimited$0($state$4);
    expect($result$4 == null, true,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$4.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 2');
    expect($state$4.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
  });
}

void _test_Eof$0() {
  // Eof
  test('Eof', () {
    final $state$0 = State('');
    final $result$0 = _Eof$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: ');
    final $value$0 = $result$0!.value;
    expect($value$0, null, reason: 'Testing \'result.value\' failed, input: ');
    expect($state$0.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    final $state$1 = State('1');
    final $result$1 = _Eof$0($state$1);
    expect($result$1 == null, true,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$1.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$1.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 1');
    expect($state$1.errors[0], isA<ErrorExpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: 1');
  });
}

void _test_Expected$0() {
  // Expected
  test('Expected', () {
    final $state$0 = State('123');
    final $result$0 = _Expected$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 123');
    final $value$0 = $result$0!.value;
    expect($value$0, (0x31, 0x32),
        reason: 'Testing \'result\' failed, input: 123');
    expect($state$0.pos, 2, reason: 'Testing \'state.pos\' failed, input: 123');
    final $state$1 = State('');
    final $result$1 = _Expected$0($state$1);
    expect($result$1 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$1.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$1.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$1.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: ');
    expect(($state$1.errors[0] as ErrorExpectedTags).tags[0], 'expr',
        reason: 'Testing \'ErrorExpectedTags).tags\' failed, input: ');
    final $state$2 = State('1');
    final $result$2 = _Expected$0($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$2.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 1');
    expect($state$2.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: 1');
  });
}

void _test_FastSatisfy16$0() {
  // FastSatisfy16
  test('FastSatisfy16', () {
    final $state$0 = State('1');
    final $result$0 = _FastSatisfy16$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 1');
    final $value$0 = $result$0!.value;
    expect($value$0, null, reason: 'Testing \'result\' failed, input: 1');
    expect($state$0.pos, 1, reason: 'Testing \'state.pos\' failed, input: 1');
    final $state$1 = State('');
    final $result$1 = _FastSatisfy16$0($state$1);
    expect($result$1 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$1.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$1.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$1.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$2 = State('a');
    final $result$2 = _FastSatisfy16$0($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: a');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: a');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: a');
    expect($state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: a');
    expect($state$2.errors[0], isA<ErrorUnexpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: a');
  });
}

void _test_FastSatisfy16$1() {
  // FastSatisfy16
  test('FastSatisfy16', () {
    final $state$0 = State('😀');
    final $result$0 = _FastSatisfy16$1($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 😀');
    final $value$0 = $result$0!.value;
    expect($value$0, null, reason: 'Testing \'result\' failed, input: 😀');
    expect($state$0.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀');
    final $state$1 = State('');
    final $result$1 = _FastSatisfy16$1($state$1);
    expect($result$1 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$1.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$1.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$1.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$2 = State('a');
    final $result$2 = _FastSatisfy16$1($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: a');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: a');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: a');
    expect($state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: a');
    expect($state$2.errors[0], isA<ErrorUnexpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: a');
  });
}

void _test_Many$0() {
  // Many
  test('Many', () {
    final $state$0 = State('1112');
    final $result$0 = _Many$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 1112');
    final $value$0 = $result$0!.value;
    expect($value$0, [49, 49, 49],
        reason: 'Testing \'result.value\' failed, input: 1112');
    expect($state$0.pos, 3,
        reason: 'Testing \'state.pos\' failed, input: 1112');
    final $state$1 = State('');
    final $result$1 = _Many$0($state$1);
    expect($result$1 != null, true,
        reason: 'Testing \'result != null\' failed, input: ');
    final $value$1 = $result$1!.value;
    expect($value$1, [], reason: 'Testing \'result.value\' failed, input: ');
    expect($state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    final $state$2 = State('2');
    final $result$2 = _Many$0($state$2);
    expect($result$2 != null, true,
        reason: 'Testing \'result != null\' failed, input: 2');
    final $value$2 = $result$2!.value;
    expect($value$2, [], reason: 'Testing \'result.value\' failed, input: 2');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
  });
}

void _test_Many1$0() {
  // Many1
  test('Many1', () {
    final $state$0 = State('1112');
    final $result$0 = _Many1$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 1112');
    final $value$0 = $result$0!.value;
    expect($value$0, [49, 49, 49],
        reason: 'Testing \'result.value\' failed, input: 1112');
    expect($state$0.pos, 3,
        reason: 'Testing \'state.pos\' failed, input: 1112');
    final $state$1 = State('');
    final $result$1 = _Many1$0($state$1);
    expect($result$1 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$1.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$1.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$1.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$2 = State('2');
    final $result$2 = _Many1$0($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 2');
    expect($state$2.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
  });
}

void _test_ManyCount$0() {
  // ManyCount
  test('ManyCount', () {
    final $state$0 = State('1112');
    final $result$0 = _ManyCount$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 1112');
    final $value$0 = $result$0!.value;
    expect($value$0, 3, reason: 'Testing \'result.value\' failed, input: 1112');
    expect($state$0.pos, 3,
        reason: 'Testing \'state.pos\' failed, input: 1112');
    final $state$1 = State('');
    final $result$1 = _ManyCount$0($state$1);
    expect($result$1 != null, true,
        reason: 'Testing \'result != null\' failed, input: ');
    final $value$1 = $result$1!.value;
    expect($value$1, 0, reason: 'Testing \'result.value\' failed, input: ');
    expect($state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    final $state$2 = State('2');
    final $result$2 = _ManyCount$0($state$2);
    expect($result$2 != null, true,
        reason: 'Testing \'result != null\' failed, input: 2');
    final $value$2 = $result$2!.value;
    expect($value$2, 0, reason: 'Testing \'result.value\' failed, input: 2');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
  });
}

void _test_Many1Count$0() {
  // Many1Count
  test('Many1Count', () {
    final $state$0 = State('1112');
    final $result$0 = _Many1Count$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 1112');
    final $value$0 = $result$0!.value;
    expect($value$0, 3, reason: 'Testing \'result.value\' failed, input: 1112');
    expect($state$0.pos, 3,
        reason: 'Testing \'state.pos\' failed, input: 1112');
    final $state$1 = State('');
    final $result$1 = _Many1Count$0($state$1);
    expect($result$1 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$1.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$1.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$1.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$2 = State('2');
    final $result$2 = _Many1Count$0($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 2');
    expect($state$2.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
  });
}

void _test_ManyMN03$0() {
  // ManyMN (0..3)
  test('ManyMN (0..3)', () {
    final $state$0 = State('12');
    final $result$0 = _ManyMN03$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 12');
    final $value$0 = $result$0!.value;
    expect($value$0, [49],
        reason: 'Testing \'result.value\' failed, input: 12');
    expect($state$0.pos, 1, reason: 'Testing \'state.pos\' failed, input: 12');
    final $state$1 = State('112');
    final $result$1 = _ManyMN03$0($state$1);
    expect($result$1 != null, true,
        reason: 'Testing \'result != null\' failed, input: 112');
    final $value$1 = $result$1!.value;
    expect($value$1, [49, 49],
        reason: 'Testing \'result.value\' failed, input: 112');
    expect($state$1.pos, 2, reason: 'Testing \'state.pos\' failed, input: 112');
    final $state$2 = State('11112');
    final $result$2 = _ManyMN03$0($state$2);
    expect($result$2 != null, true,
        reason: 'Testing \'result != null\' failed, input: 11112');
    final $value$2 = $result$2!.value;
    expect($value$2, [49, 49, 49],
        reason: 'Testing \'result.value\' failed, input: 11112');
    expect($state$2.pos, 3,
        reason: 'Testing \'state.pos\' failed, input: 11112');
    final $state$3 = State('2');
    final $result$3 = _ManyMN03$0($state$3);
    expect($result$3 != null, true,
        reason: 'Testing \'result != null\' failed, input: 2');
    final $value$3 = $result$3!.value;
    expect($value$3, [], reason: 'Testing \'result.value\' failed, input: 2');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    final $state$4 = State('');
    final $result$4 = _ManyMN03$0($state$4);
    expect($result$4 != null, true,
        reason: 'Testing \'result != null\' failed, input: ');
    final $value$4 = $result$4!.value;
    expect($value$4, [], reason: 'Testing \'result.value\' failed, input: ');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
  });
}

void _test_ManyMN23$0() {
  // ManyMN (2..3)
  test('ManyMN (2..3)', () {
    final $state$0 = State('112');
    final $result$0 = _ManyMN23$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 112');
    final $value$0 = $result$0!.value;
    expect($value$0, [49, 49],
        reason: 'Testing \'result.value\' failed, input: 112');
    expect($state$0.pos, 2, reason: 'Testing \'state.pos\' failed, input: 112');
    final $state$1 = State('11112');
    final $result$1 = _ManyMN23$0($state$1);
    expect($result$1 != null, true,
        reason: 'Testing \'result != null\' failed, input: 11112');
    final $value$1 = $result$1!.value;
    expect($value$1, [49, 49, 49],
        reason: 'Testing \'result.value\' failed, input: 11112');
    expect($state$1.pos, 3,
        reason: 'Testing \'state.pos\' failed, input: 11112');
    final $state$2 = State('');
    final $result$2 = _ManyMN23$0($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$2.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$3 = State('1');
    final $result$3 = _ManyMN23$0($state$3);
    expect($result$3 == null, true,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$3.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$3.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 1');
    expect($state$3.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: 1');
    final $state$4 = State('2');
    final $result$4 = _ManyMN23$0($state$4);
    expect($result$4 == null, true,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$4.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 2');
    expect($state$4.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
  });
}

void _test_Not$0() {
  // Not
  test('Not', () {
    final $state$0 = State('02');
    final $result$0 = _Not$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 02');
    final $value$0 = $result$0!.value;
    expect($value$0, 48, reason: 'Testing \'result.value\' failed, input: 02');
    expect($state$0.pos, 1, reason: 'Testing \'state.pos\' failed, input: 02');
    final $state$1 = State('0');
    final $result$1 = _Not$0($state$1);
    expect($result$1 != null, true,
        reason: 'Testing \'result != null\' failed, input: 0');
    final $value$1 = $result$1!.value;
    expect($value$1, 48, reason: 'Testing \'result.value\' failed, input: 0');
    expect($state$1.pos, 1, reason: 'Testing \'state.pos\' failed, input: 0');
    final $state$2 = State('');
    final $result$2 = _Not$0($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$2.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$3 = State('1');
    final $result$3 = _Not$0($state$3);
    expect($result$3 == null, true,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$3.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 1');
    expect($state$3.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 1');
    final $state$4 = State('01');
    final $result$4 = _Not$0($state$4);
    expect($result$4 == null, true,
        reason: 'Testing \'result == null\' failed, input: 01');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: 01');
    expect($state$4.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: 01');
    expect($state$4.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 01');
    expect($state$4.errors[0], isA<ErrorUnexpectedInput>(),
        reason: 'Testing \'state.error\' failed, input: 01');
    expect(($state$4.errors[0] as ErrorUnexpectedInput).length, 1,
        reason: 'Testing \'ErrorUnexpectedInput.length\' failed, input: 01');
  });
}

void _test_Preceded$0() {
  // Preceded
  test('Preceded', () {
    final $state$0 = State('123');
    final $result$0 = _Preceded$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 123');
    final $value$0 = $result$0!.value;
    expect($value$0, 50, reason: 'Testing \'result.value\' failed, input: 123');
    expect($state$0.pos, 2, reason: 'Testing \'state.pos\' failed, input: 123');
    final $state$1 = State('');
    final $result$1 = _Preceded$0($state$1);
    expect($result$1 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$1.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$1.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$1.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$2 = State('1');
    final $result$2 = _Preceded$0($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$2.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 1');
    expect($state$2.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: 1');
    final $state$3 = State('2');
    final $result$3 = _Preceded$0($state$3);
    expect($result$3 == null, true,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$3.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 2');
    expect($state$3.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
  });
}

void _test_ReplaceErrors$0() {
  // ReplaceErrors
  test('ReplaceErrors', () {
    final $state$0 = State('12a');
    final $result$0 = _ReplaceErrors$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 12a');
    final $value$0 = $result$0!.value;
    expect($value$0, '12',
        reason: 'Testing \'result.value\' failed, input: 12a');
    expect($state$0.pos, 2, reason: 'Testing \'state.pos\' failed, input: 12a');
    final $state$1 = State('');
    final $result$1 = _ReplaceErrors$0($state$1);
    expect($result$1 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$1.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$1.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$1.errors[0], isA<ErrorMessage>(),
        reason: 'Testing \'state.error\' failed, input: ');
    expect(($state$1.errors[0] as ErrorMessage).message, 'error message',
        reason: 'Testing \'error.message\' failed, input: ');
    expect(($state$1.errors[0] as ErrorMessage).length, 0,
        reason: 'Testing \'ErrorMessage.length\' failed, input: ');
    final $state$2 = State('1');
    final $result$2 = _ReplaceErrors$0($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$2.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 1');
    expect($state$2.errors[0], isA<ErrorMessage>(),
        reason: 'Testing \'state.error\' failed, input: 1');
    expect(($state$2.errors[0] as ErrorMessage).message, 'error message',
        reason: 'Testing \'ErrorMessage.message\' failed, input: 1');
    expect(($state$2.errors[0] as ErrorMessage).length, 1,
        reason: 'Testing \'ErrorMessage.length\' failed, input: 1');
    final $state$3 = State('a');
    final $result$3 = _ReplaceErrors$0($state$3);
    expect($result$3 == null, true,
        reason: 'Testing \'result == null\' failed, input: a');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: a');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: a');
    expect($state$3.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: a');
    expect($state$3.errors[0], isA<ErrorMessage>(),
        reason: 'Testing \'state.error\' failed, input: a');
    expect(($state$3.errors[0] as ErrorMessage).message, 'error message',
        reason: 'Testing \'ErrorMessage.message\' failed, input: a');
    expect(($state$3.errors[0] as ErrorMessage).length, 0,
        reason: 'Testing \'ErrorMessage.length\' failed, input: a');
  });
}

void _test_StringChars$0() {
  // StringChars
  test('StringChars', () {
    final $state$0 = State('12');
    final $result$0 = _StringChars$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 12');
    final $value$0 = $result$0!.value;
    expect($value$0, '12',
        reason: 'Testing \'result.value\' failed, input: 12');
    expect($state$0.pos, 2, reason: 'Testing \'state.pos\' failed, input: 12');
    final $state$1 = State('\\n1');
    final $result$1 = _StringChars$0($state$1);
    expect($result$1 != null, true,
        reason: 'Testing \'result != null\' failed, input: \\n1');
    final $value$1 = $result$1!.value;
    expect($value$1, '\n1',
        reason: 'Testing \'result.value\' failed, input: \\n1');
    expect($state$1.pos, 3,
        reason: 'Testing \'state.pos\' failed, input: \\n1');
    final $state$2 = State('1\\n2');
    final $result$2 = _StringChars$0($state$2);
    expect($result$2 != null, true,
        reason: 'Testing \'result != null\' failed, input: 1\\n2');
    final $value$2 = $result$2!.value;
    expect($value$2, '1\n2',
        reason: 'Testing \'result.value\' failed, input: 1\\n2');
    expect($state$2.pos, 4,
        reason: 'Testing \'state.pos\' failed, input: 1\\n2');
    final $state$3 = State('\\n\\n1');
    final $result$3 = _StringChars$0($state$3);
    expect($result$3 != null, true,
        reason: 'Testing \'result != null\' failed, input: \\n\\n1');
    final $value$3 = $result$3!.value;
    expect($value$3, '\n\n1',
        reason: 'Testing \'result.value\' failed, input: \\n\\n1');
    expect($state$3.pos, 5,
        reason: 'Testing \'state.pos\' failed, input: \\n\\n1');
    final $state$4 = State('');
    final $result$4 = _StringChars$0($state$4);
    expect($result$4 != null, true,
        reason: 'Testing \'result != null\' failed, input: ');
    final $value$4 = $result$4!.value;
    expect($value$4, '', reason: 'Testing \'result.value\' failed, input: ');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
  });
}

void _test_Tagshort$0() {
  // Tag (short)
  test('Tag (short)', () {
    final $state$0 = State('01');
    final $result$0 = _Tagshort$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 01');
    final $value$0 = $result$0!.value;
    expect($value$0, '0', reason: 'Testing \'result.value\' failed, input: 01');
    expect($state$0.pos, 1, reason: 'Testing \'state.pos\' failed, input: 01');
    final $state$1 = State('');
    final $result$1 = _Tagshort$0($state$1);
    expect($result$1 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$1.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$1.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$1.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$2 = State('2');
    final $result$2 = _Tagshort$0($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 2');
    expect($state$2.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: 2');
  });
}

void _test_Taglong$0() {
  // Tag (long)
  test('Tag (long)', () {
    final $state$0 = State('😀1');
    final $result$0 = _Taglong$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 😀1');
    final $value$0 = $result$0!.value;
    expect($value$0, '😀',
        reason: 'Testing \'result.value\' failed, input: 😀1');
    expect($state$0.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀1');
    final $state$1 = State('');
    final $result$1 = _Taglong$0($state$1);
    expect($result$1 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$1.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$1.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$1.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$2 = State('2');
    final $result$2 = _Taglong$0($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 2');
    expect($state$2.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: 2');
  });
}

void _test_Tags16bit$0() {
  // Tags (16-bit)
  test('Tags (16-bit)', () {
    final $state$0 = State('abcd');
    final $result$0 = _Tags16bit$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: abcd');
    final $value$0 = $result$0!.value;
    expect($value$0, 'abc',
        reason: 'Testing \'result.value\' failed, input: abcd');
    expect($state$0.pos, 3,
        reason: 'Testing \'state.pos\' failed, input: abcd');
    final $state$1 = State('abd');
    final $result$1 = _Tags16bit$0($state$1);
    expect($result$1 != null, true,
        reason: 'Testing \'result != null\' failed, input: abd');
    final $value$1 = $result$1!.value;
    expect($value$1, 'ab',
        reason: 'Testing \'result.value\' failed, input: abd');
    expect($state$1.pos, 2, reason: 'Testing \'state.pos\' failed, input: abd');
    final $state$2 = State('ad');
    final $result$2 = _Tags16bit$0($state$2);
    expect($result$2 != null, true,
        reason: 'Testing \'result != null\' failed, input: ad');
    final $value$2 = $result$2!.value;
    expect($value$2, 'a', reason: 'Testing \'result.value\' failed, input: ad');
    expect($state$2.pos, 1, reason: 'Testing \'state.pos\' failed, input: ad');
    final $state$3 = State('bcd');
    final $result$3 = _Tags16bit$0($state$3);
    expect($result$3 != null, true,
        reason: 'Testing \'result != null\' failed, input: bcd');
    final $value$3 = $result$3!.value;
    expect($value$3, 'bc',
        reason: 'Testing \'result.value\' failed, input: bcd');
    expect($state$3.pos, 2, reason: 'Testing \'state.pos\' failed, input: bcd');
    final $state$4 = State('bd');
    final $result$4 = _Tags16bit$0($state$4);
    expect($result$4 != null, true,
        reason: 'Testing \'result != null\' failed, input: bd');
    final $value$4 = $result$4!.value;
    expect($value$4, 'b', reason: 'Testing \'result.value\' failed, input: bd');
    expect($state$4.pos, 1, reason: 'Testing \'state.pos\' failed, input: bd');
    final $state$5 = State('cd');
    final $result$5 = _Tags16bit$0($state$5);
    expect($result$5 != null, true,
        reason: 'Testing \'result != null\' failed, input: cd');
    final $value$5 = $result$5!.value;
    expect($value$5, 'c', reason: 'Testing \'result.value\' failed, input: cd');
    expect($state$5.pos, 1, reason: 'Testing \'state.pos\' failed, input: cd');
    final $state$6 = State('😀');
    final $result$6 = _Tags16bit$0($state$6);
    expect($result$6 != null, true,
        reason: 'Testing \'result != null\' failed, input: 😀');
    final $value$6 = $result$6!.value;
    expect($value$6, '😀',
        reason: 'Testing \'result.value\' failed, input: 😀');
    expect($state$6.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀');
    final $state$7 = State('');
    final $result$7 = _Tags16bit$0($state$7);
    expect($result$7 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$7.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$7.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$7.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$7.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$8 = State('x');
    final $result$8 = _Tags16bit$0($state$8);
    expect($result$8 == null, true,
        reason: 'Testing \'result == null\' failed, input: x');
    expect($state$8.pos, 0, reason: 'Testing \'state.pos\' failed, input: x');
    expect($state$8.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: x');
    expect($state$8.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: x');
    expect($state$8.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: x');
  });
}

void _test_TakeWhileMN03$0() {
  // TakeWhileMN (0..3)
  test('TakeWhileMN (0..3)', () {
    final $state$0 = State('😀😀😀😀');
    final $result$0 = _TakeWhileMN03$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 😀😀😀😀');
    final $value$0 = $result$0!.value;
    expect($value$0, '😀😀😀',
        reason: 'Testing \'result.value\' failed, input: 😀😀😀😀');
    expect($state$0.pos, 6,
        reason: 'Testing \'state.pos\' failed, input: 😀😀😀😀');
    final $state$1 = State('😀😀');
    final $result$1 = _TakeWhileMN03$0($state$1);
    expect($result$1 != null, true,
        reason: 'Testing \'result != null\' failed, input: 😀😀');
    final $value$1 = $result$1!.value;
    expect($value$1, '😀😀',
        reason: 'Testing \'result.value\' failed, input: 😀😀');
    expect($state$1.pos, 4,
        reason: 'Testing \'state.pos\' failed, input: 😀😀');
    final $state$2 = State('😀');
    final $result$2 = _TakeWhileMN03$0($state$2);
    expect($result$2 != null, true,
        reason: 'Testing \'result != null\' failed, input: 😀');
    final $value$2 = $result$2!.value;
    expect($value$2, '😀',
        reason: 'Testing \'result.value\' failed, input: 😀');
    expect($state$2.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀');
    final $state$3 = State('');
    final $result$3 = _TakeWhileMN03$0($state$3);
    expect($result$3 != null, true,
        reason: 'Testing \'result != null\' failed, input: ');
    final $value$3 = $result$3!.value;
    expect($value$3, '', reason: 'Testing \'result.value\' failed, input: ');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    final $state$4 = State('a');
    final $result$4 = _TakeWhileMN03$0($state$4);
    expect($result$4 != null, true,
        reason: 'Testing \'result != null\' failed, input: a');
    final $value$4 = $result$4!.value;
    expect($value$4, '', reason: 'Testing \'result.value\' failed, input: a');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: a');
  });
}

void _test_TakeWhileMN12$0() {
  // TakeWhileMN (1..2)
  test('TakeWhileMN (1..2)', () {
    final $state$0 = State('😀😀😀😀');
    final $result$0 = _TakeWhileMN12$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 😀😀😀😀');
    final $value$0 = $result$0!.value;
    expect($value$0, '😀😀',
        reason: 'Testing \'result.value\' failed, input: 😀😀😀😀');
    expect($state$0.pos, 4,
        reason: 'Testing \'state.pos\' failed, input: 😀😀😀😀');
    final $state$1 = State('😀');
    final $result$1 = _TakeWhileMN12$0($state$1);
    expect($result$1 != null, true,
        reason: 'Testing \'result != null\' failed, input: 😀');
    final $value$1 = $result$1!.value;
    expect($value$1, '😀',
        reason: 'Testing \'result.value\' failed, input: 😀');
    expect($state$1.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀');
    final $state$2 = State('');
    final $result$2 = _TakeWhileMN12$0($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$2.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$3 = State('1');
    final $result$3 = _TakeWhileMN12$0($state$3);
    expect($result$3 == null, true,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$3.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 1');
    expect($state$3.errors[0], isA<ErrorUnexpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 1');
  });
}

void _test_Take16WhileMN03$0() {
  // Take16WhileMN (0..3)
  test('Take16WhileMN (0..3)', () {
    final $state$0 = State('12345');
    final $result$0 = _Take16WhileMN03$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 12345');
    final $value$0 = $result$0!.value;
    expect($value$0, '123',
        reason: 'Testing \'result.value\' failed, input: 12345');
    expect($state$0.pos, 3,
        reason: 'Testing \'state.pos\' failed, input: 12345');
    final $state$1 = State('12');
    final $result$1 = _Take16WhileMN03$0($state$1);
    expect($result$1 != null, true,
        reason: 'Testing \'result != null\' failed, input: 12');
    final $value$1 = $result$1!.value;
    expect($value$1, '12',
        reason: 'Testing \'result.value\' failed, input: 12');
    expect($state$1.pos, 2, reason: 'Testing \'state.pos\' failed, input: 12');
    final $state$2 = State('1');
    final $result$2 = _Take16WhileMN03$0($state$2);
    expect($result$2 != null, true,
        reason: 'Testing \'result != null\' failed, input: 1');
    final $value$2 = $result$2!.value;
    expect($value$2, '1', reason: 'Testing \'result.value\' failed, input: 1');
    expect($state$2.pos, 1, reason: 'Testing \'state.pos\' failed, input: 1');
    final $state$3 = State('');
    final $result$3 = _Take16WhileMN03$0($state$3);
    expect($result$3 != null, true,
        reason: 'Testing \'result != null\' failed, input: ');
    final $value$3 = $result$3!.value;
    expect($value$3, '', reason: 'Testing \'result.value\' failed, input: ');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    final $state$4 = State('a');
    final $result$4 = _Take16WhileMN03$0($state$4);
    expect($result$4 != null, true,
        reason: 'Testing \'result != null\' failed, input: a');
    final $value$4 = $result$4!.value;
    expect($value$4, '', reason: 'Testing \'result.value\' failed, input: a');
    expect($state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: a');
  });
}

void _test_Take16WhileMN12$0() {
  // Take16WhileMN (1..2)
  test('Take16WhileMN (1..2)', () {
    final $state$0 = State('123');
    final $result$0 = _Take16WhileMN12$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 123');
    final $value$0 = $result$0!.value;
    expect($value$0, '12',
        reason: 'Testing \'result.value\' failed, input: 123');
    expect($state$0.pos, 2, reason: 'Testing \'state.pos\' failed, input: 123');
    final $state$1 = State('1a');
    final $result$1 = _Take16WhileMN12$0($state$1);
    expect($result$1 != null, true,
        reason: 'Testing \'result != null\' failed, input: 1a');
    final $value$1 = $result$1!.value;
    expect($value$1, '1', reason: 'Testing \'result.value\' failed, input: 1a');
    expect($state$1.pos, 1, reason: 'Testing \'state.pos\' failed, input: 1a');
    final $state$2 = State('');
    final $result$2 = _Take16WhileMN12$0($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$2.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$3 = State('a');
    final $result$3 = _Take16WhileMN12$0($state$3);
    expect($result$3 == null, true,
        reason: 'Testing \'result == null\' failed, input: a');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: a');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: a');
    expect($state$3.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: a');
    expect($state$3.errors[0], isA<ErrorUnexpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: a');
  });
}

void _test_TakeWhile$0() {
  // TakeWhile
  test('TakeWhile', () {
    final $state$0 = State('😀');
    final $result$0 = _TakeWhile$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 😀');
    final $value$0 = $result$0!.value;
    expect($value$0, '😀',
        reason: 'Testing \'result.value\' failed, input: 😀');
    expect($state$0.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀');
    final $state$1 = State('😀😀');
    final $result$1 = _TakeWhile$0($state$1);
    expect($result$1 != null, true,
        reason: 'Testing \'result != null\' failed, input: 😀😀');
    final $value$1 = $result$1!.value;
    expect($value$1, '😀😀',
        reason: 'Testing \'result.value\' failed, input: 😀😀');
    expect($state$1.pos, 4,
        reason: 'Testing \'state.pos\' failed, input: 😀😀');
    final $state$2 = State('');
    final $result$2 = _TakeWhile$0($state$2);
    expect($result$2 != null, true,
        reason: 'Testing \'result != null\' failed, input: ');
    final $value$2 = $result$2!.value;
    expect($value$2, '', reason: 'Testing \'result.value\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    final $state$3 = State('a');
    final $result$3 = _TakeWhile$0($state$3);
    expect($result$3 != null, true,
        reason: 'Testing \'result != null\' failed, input: a');
    final $value$3 = $result$3!.value;
    expect($value$3, '', reason: 'Testing \'result.value\' failed, input: a');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: a');
  });
}

void _test_TakeWhile1$0() {
  // TakeWhile1
  test('TakeWhile1', () {
    final $state$0 = State('😀');
    final $result$0 = _TakeWhile1$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 😀');
    final $value$0 = $result$0!.value;
    expect($value$0, '😀',
        reason: 'Testing \'result.value\' failed, input: 😀');
    expect($state$0.pos, 2, reason: 'Testing \'state.pos\' failed, input: 😀');
    final $state$1 = State('😀😀');
    final $result$1 = _TakeWhile1$0($state$1);
    expect($result$1 != null, true,
        reason: 'Testing \'result != null\' failed, input: 😀😀');
    final $value$1 = $result$1!.value;
    expect($value$1, '😀😀',
        reason: 'Testing \'result.value\' failed, input: 😀😀');
    expect($state$1.pos, 4,
        reason: 'Testing \'state.pos\' failed, input: 😀😀');
    final $state$2 = State('');
    final $result$2 = _TakeWhile1$0($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$2.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$3 = State('a');
    final $result$3 = _TakeWhile1$0($state$3);
    expect($result$3 == null, true,
        reason: 'Testing \'result == null\' failed, input: a');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: a');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: a');
    expect($state$3.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: a');
    expect($state$3.errors[0], isA<ErrorUnexpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: a');
  });
}

void _test_Take16While$0() {
  // Take16While
  test('Take16While', () {
    final $state$0 = State('1a');
    final $result$0 = _Take16While$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 1a');
    final $value$0 = $result$0!.value;
    expect($value$0, '1', reason: 'Testing \'result.value\' failed, input: 1a');
    expect($state$0.pos, 1, reason: 'Testing \'state.pos\' failed, input: 1a');
    final $state$1 = State('12a');
    final $result$1 = _Take16While$0($state$1);
    expect($result$1 != null, true,
        reason: 'Testing \'result != null\' failed, input: 12a');
    final $value$1 = $result$1!.value;
    expect($value$1, '12',
        reason: 'Testing \'result.value\' failed, input: 12a');
    expect($state$1.pos, 2, reason: 'Testing \'state.pos\' failed, input: 12a');
    final $state$2 = State('');
    final $result$2 = _Take16While$0($state$2);
    expect($result$2 != null, true,
        reason: 'Testing \'result != null\' failed, input: ');
    final $value$2 = $result$2!.value;
    expect($value$2, '', reason: 'Testing \'result.value\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    final $state$3 = State('a');
    final $result$3 = _Take16While$0($state$3);
    expect($result$3 != null, true,
        reason: 'Testing \'result != null\' failed, input: a');
    final $value$3 = $result$3!.value;
    expect($value$3, '', reason: 'Testing \'result.value\' failed, input: a');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: a');
  });
}

void _test_Take16While1$0() {
  // Take16While1
  test('Take16While1', () {
    final $state$0 = State('1a');
    final $result$0 = _Take16While1$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 1a');
    final $value$0 = $result$0!.value;
    expect($value$0, '1', reason: 'Testing \'result.value\' failed, input: 1a');
    expect($state$0.pos, 1, reason: 'Testing \'state.pos\' failed, input: 1a');
    final $state$1 = State('12a');
    final $result$1 = _Take16While1$0($state$1);
    expect($result$1 != null, true,
        reason: 'Testing \'result != null\' failed, input: 12a');
    final $value$1 = $result$1!.value;
    expect($value$1, '12',
        reason: 'Testing \'result.value\' failed, input: 12a');
    expect($state$1.pos, 2, reason: 'Testing \'state.pos\' failed, input: 12a');
    final $state$2 = State('');
    final $result$2 = _Take16While1$0($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$2.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$2.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$3 = State('a');
    final $result$3 = _Take16While1$0($state$3);
    expect($result$3 == null, true,
        reason: 'Testing \'result == null\' failed, input: a');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: a');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: a');
    expect($state$3.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: a');
    expect($state$3.errors[0], isA<ErrorUnexpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: a');
  });
}

void _test_Terminated$0() {
  // Terminated
  test('Terminated', () {
    final $state$0 = State('123');
    final $result$0 = _Terminated$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: 123');
    final $value$0 = $result$0!.value;
    expect($value$0, 49, reason: 'Testing \'result.value\' failed, input: 123');
    expect($state$0.pos, 2, reason: 'Testing \'state.pos\' failed, input: 123');
    final $state$1 = State('');
    final $result$1 = _Terminated$0($state$1);
    expect($result$1 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$1.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$1.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$1.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$2 = State('1');
    final $result$2 = _Terminated$0($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: 1');
    expect($state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: 1');
    expect($state$2.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, input: 1');
    expect($state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 1');
    expect($state$2.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, input: 1');
    final $state$3 = State('2');
    final $result$3 = _Terminated$0($state$3);
    expect($result$3 == null, true,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect($state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    expect($state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: 2');
    expect($state$3.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: 2');
    expect($state$3.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, input: 2');
  });
}

void _test_Unterminated$0() {
  // Unterminated
  test('Unterminated', () {
    final $state$0 = State('"123"');
    final $result$0 = _Unterminated$0($state$0);
    expect($result$0 != null, true,
        reason: 'Testing \'result != null\' failed, input: "123"');
    final $value$0 = $result$0!.value;
    expect($value$0, '123', reason: 'Testing \'result\' failed, input: "123"');
    expect($state$0.pos, 5,
        reason: 'Testing \'state.pos\' failed, input: "123"');
    final $state$1 = State('');
    final $result$1 = _Unterminated$0($state$1);
    expect($result$1 == null, true,
        reason: 'Testing \'result == null\' failed, input: ');
    expect($state$1.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    expect($state$1.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, input: ');
    expect($state$1.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, input: ');
    expect($state$1.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: ');
    final $state$2 = State('"123');
    final $result$2 = _Unterminated$0($state$2);
    expect($result$2 == null, true,
        reason: 'Testing \'result == null\' failed, input: "123');
    expect($state$2.pos, 0,
        reason: 'Testing \'state.pos\' failed, input: "123');
    expect($state$2.failPos, 4,
        reason: 'Testing \'state.failPos\' failed, input: "123');
    expect($state$2.errors.length, 2,
        reason: 'Testing \'state.errors.length\' failed, input: "123');
    expect($state$2.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, input: "123');
    expect($state$2.errors[1], isA<ErrorMessage>(),
        reason: 'Testing \'state.error\' failed, input: "123');
    expect(($state$2.errors[1] as ErrorMessage).message, 'unterminated',
        reason: 'Testing \'ErrorMessage.message\' failed, input: "123');
    expect(($state$2.errors[1] as ErrorMessage).length, -4,
        reason: 'Testing \'ErrorMessage.length\' failed, input: "123');
  });
}

Result<int>? _$0(State<String> state) {
  if (state.pos < state.input.length) {
    final c = state.input.codeUnitAt(state.pos);
    if (c == 48) {
      state.pos++;
      return const Result(48);
    }
    return state.fail(const ErrorExpectedChar(48));
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<int>? _$2(State<String> state) {
  if (state.pos < state.input.length) {
    final c = state.input.codeUnitAt(state.pos);
    if (c == 49) {
      state.pos++;
      return const Result(49);
    }
    return state.fail(const ErrorExpectedChar(49));
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<Object?>? _$1(State<String> state) {
  final pos = state.pos;
  final r1 = _$2(state);
  if (r1 != null) {
    state.pos = pos;
    return const Result<Object?>(null);
  }
  return null;
}

Result<int>? _And$0(State<String> state) {
  final pos = state.pos;
  final r1 = _$0(state);
  if (r1 != null) {
    final r2 = _$1(state);
    if (r2 != null) {
      return r1;
    }
  }
  state.pos = pos;
  return null;
}

Result<int>? _And$1(State<String> state) {
  if (state.pos < state.input.length) {
    final c = state.input.runeAt(state.pos);
    state.pos += c <= 0xffff ? 1 : 2;
    return Result(c);
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<int>? _Char16bit$0(State<String> state) {
  if (state.pos < state.input.length) {
    final c = state.input.codeUnitAt(state.pos);
    if (c == 48) {
      state.pos++;
      return const Result(48);
    }
    return state.fail(const ErrorExpectedChar(48));
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<int>? _Char32bit$0(State<String> state) {
  if (state.pos < state.input.length) {
    final c = state.input.runeAt(state.pos);
    if (c == 128512) {
      state.pos += c <= 0xffff ? 1 : 2;
      return const Result(128512);
    }
    return state.fail(const ErrorExpectedChar(128512));
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<int>? _Choice2variants$0(State<String> state) {
  final r1 = _$0(state);
  if (r1 != null) {
    return r1;
  }
  final r2 = _$2(state);
  if (r2 != null) {
    return r2;
  }

  return null;
}

Result<int>? _$7(State<String> state) {
  if (state.pos < state.input.length) {
    final c = state.input.codeUnitAt(state.pos);
    if (c == 50) {
      state.pos++;
      return const Result(50);
    }
    return state.fail(const ErrorExpectedChar(50));
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<int>? _Choice3variants$0(State<String> state) {
  final r1 = _$0(state);
  if (r1 != null) {
    return r1;
  }
  final r2 = _$2(state);
  if (r2 != null) {
    return r2;
  }
  final r3 = _$7(state);
  if (r3 != null) {
    return r3;
  }

  return null;
}

Result<int>? _Char16$0(State<String> state) {
  if (state.pos < state.input.length) {
    final c = state.input.codeUnitAt(state.pos);
    if (c == 49) {
      state.pos++;
      return const Result(49);
    }
    return state.fail(const ErrorExpectedChar(49));
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<int>? _Char$0(State<String> state) {
  if (state.pos < state.input.length) {
    final c = state.input.runeAt(state.pos);
    if (c == 128512) {
      state.pos += c <= 0xffff ? 1 : 2;
      return const Result(128512);
    }
    return state.fail(const ErrorExpectedChar(128512));
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<int>? _$10(State<String> state) {
  if (state.pos < state.input.length) {
    final c = state.input.codeUnitAt(state.pos);
    if (c == 51) {
      state.pos++;
      return const Result(51);
    }
    return state.fail(const ErrorExpectedChar(51));
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<int>? _Delimited$0(State<String> state) {
  final pos = state.pos;
  final r1 = _$2(state);
  if (r1 != null) {
    final r2 = _$7(state);
    if (r2 != null) {
      final r3 = _$10(state);
      if (r3 != null) {
        return r2;
      }
    }
  }
  state.pos = pos;
  return null;
}

Result<Object?>? _Eof$0(State<String> state) {
  if (state.pos >= state.input.length) {
    return const Result(null);
  }
  return state.fail(const ErrorExpectedEof());
}

Result<(int, int)>? _$11(State<String> state) {
  final pos = state.pos;
  final r1 = _$2(state);
  if (r1 != null) {
    final r2 = _$7(state);
    if (r2 != null) {
      return Result((r1.value, r2.value));
    }
  }
  state.pos = pos;
  return null;
}

Result<(int, int)>? _Expected$0(State<String> state) {
  final errors = state.errors.toList();
  final previous = state.failPos;
  state.errors = [];
  state.failPos = 0;
  final r1 = _$11(state);
  final current = state.failPos;
  if (current < previous) {
    state.errors = errors;
    state.failPos = previous;
  }
  if (r1 != null) {
    if (current == previous) {
      state.errors.addAll(errors);
    }
    return r1;
  }
  if (current < previous) {
    return null;
  }
  final (bool, List<ParseError>)? v;
  v = state.pos != current
      ? (false, [])
      : (
          true,
          [
            const ErrorExpectedTags(['expr'])
          ]
        );
  if (current == previous) {
    if (v.$1) {
      state.errors = errors;
    } else {
      state.errors.addAll(errors);
    }
  } else {
    if (v.$1) {
      state.errors = [];
    }
  }
  state.errors.addAll(v.$2);
  return null;
}

Result<Object?>? _FastSatisfy16$0(State<String> state) {
  if (state.pos < state.input.length) {
    final c = state.input.codeUnitAt(state.pos);
    final ok = c >= 48 && c <= 57;
    if (ok) {
      state.pos++;
      return const Result(null);
    }
    return state.fail(const ErrorUnexpectedChar());
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<Object?>? _FastSatisfy16$1(State<String> state) {
  if (state.pos < state.input.length) {
    final c = state.input.runeAt(state.pos);
    final ok = c == 128512;
    if (ok) {
      state.pos += c < 0xffff ? 1 : 2;
      return const Result(null);
    }
    return state.fail(const ErrorUnexpectedChar());
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<List<int>>? _Many$0(State<String> state) {
  final list = <int>[];
  while (true) {
    final r1 = _$2(state);
    if (r1 == null) {
      break;
    }
    list.add(r1.value);
  }
  return Result(list);
}

Result<List<int>>? _Many1$0(State<String> state) {
  final list = <int>[];
  while (true) {
    final r1 = _$2(state);
    if (r1 == null) {
      break;
    }
    list.add(r1.value);
  }
  if (list.isNotEmpty) {
    return Result(list);
  }
  return null;
}

Result<int>? _ManyCount$0(State<String> state) {
  var count = 0;
  while (true) {
    final r1 = _$2(state);
    if (r1 == null) {
      break;
    }
    count++;
  }
  return Result(count);
}

Result<int>? _Many1Count$0(State<String> state) {
  var count = 0;
  while (true) {
    final r1 = _$2(state);
    if (r1 == null) {
      break;
    }
    count++;
  }
  if (count != 0) {
    return Result(count);
  }
  return null;
}

Result<List<int>>? _ManyMN03$0(State<String> state) {
  final list = <int>[];
  while (list.length < 3) {
    final r1 = _$2(state);
    if (r1 == null) {
      break;
    }
    list.add(r1.value);
  }
  return Result(list);
}

Result<List<int>>? _ManyMN23$0(State<String> state) {
  final pos = state.pos;
  final list = <int>[];
  while (list.length < 3) {
    final r1 = _$2(state);
    if (r1 == null) {
      break;
    }
    list.add(r1.value);
  }
  if (list.length >= 2) {
    return Result(list);
  }
  state.pos = pos;
  return null;
}

Result<Object?>? _$21(State<String> state) {
  final pos = state.pos;
  final r1 = _$2(state);
  if (r1 == null) {
    return const Result<Object?>(null);
  }
  final length = state.pos - pos;
  state.pos = pos;
  return state.fail(ErrorUnexpectedInput(length));
}

Result<int>? _Not$0(State<String> state) {
  final pos = state.pos;
  final r1 = _$0(state);
  if (r1 != null) {
    final r2 = _$21(state);
    if (r2 != null) {
      return r1;
    }
  }
  state.pos = pos;
  return null;
}

Result<int>? _Preceded$0(State<String> state) {
  final pos = state.pos;
  final r1 = _$2(state);
  if (r1 != null) {
    final r2 = _$7(state);
    if (r2 != null) {
      return r2;
    }
  }
  state.pos = pos;
  return null;
}

Result<String>? _$25(State<String> state) {
  final input = state.input;
  final pos = state.pos;
  var count = 0;
  while (count < 2 && state.pos < input.length) {
    final c = input.codeUnitAt(state.pos);
    final ok = c >= 48 && c <= 57;
    if (!ok) {
      break;
    }
    state.pos++;
    count++;
  }
  if (count >= 2) {
    return state.pos != pos
        ? Result(input.substring(pos, state.pos))
        : const Result('');
  }
  final end = state.pos;
  state.pos = pos;
  return end < input.length
      ? state.failAt(end, const ErrorUnexpectedChar())
      : state.failAt(end, const ErrorUnexpectedEof());
}

Result<String>? _ReplaceErrors$0(State<String> state) {
  final errors = state.errors.toList();
  final previous = state.failPos;
  state.errors = [];
  state.failPos = 0;
  final r1 = _$25(state);
  final current = state.failPos;
  if (current < previous) {
    state.errors = errors;
    state.failPos = previous;
  }
  if (r1 != null) {
    if (current == previous) {
      state.errors.addAll(errors);
    }
    return r1;
  }
  if (current < previous) {
    return null;
  }
  final (bool, List<ParseError>)? v;
  v = (true, [ErrorMessage(current - state.pos, 'error message')]);
  if (current == previous) {
    if (v.$1) {
      state.errors = errors;
    } else {
      state.errors.addAll(errors);
    }
  } else {
    if (v.$1) {
      state.errors = [];
    }
  }
  state.errors.addAll(v.$2);
  return null;
}

Result<String>? _$27(State<String> state) {
  const tag = 'n';
  if (state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 110) {
    state.pos++;
    return const Result(tag);
  }
  return state.fail(const ErrorExpectedTags([tag]));
}

Result<String>? _$26(State<String> state) {
  final r1 = _$27(state);
  if (r1 != null) {
    return Result('\n');
  }
  return null;
}

Result<String>? _StringChars$0(State<String> state) {
  final input = state.input;
  final list = <String>[];
  var str = '';
  while (state.pos < input.length) {
    final pos = state.pos;
    var c = 0;
    while (state.pos < input.length) {
      c = input.runeAt(state.pos);
      final ok = c >= 48 && c <= 57;
      if (!ok) {
        break;
      }
      state.pos += c < 0xffff ? 1 : 2;
    }
    str = state.pos != pos ? input.substring(pos, state.pos) : '';
    if (str != '' && list.isNotEmpty) {
      list.add(str);
    }
    if (c != 92) {
      break;
    }
    state.pos += 1;
    final r1 = _$26(state);
    if (r1 == null) {
      state.pos = pos;
      break;
    }
    if (list.isEmpty && str != '') {
      list.add(str);
    }
    list.add(r1.value);
  }
  if (list.isEmpty) {
    return Result(str);
  } else {
    return Result(list.join());
  }
}

Result<String>? _Tagshort$0(State<String> state) {
  const tag = '0';
  if (state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 48) {
    state.pos++;
    return const Result(tag);
  }
  return state.fail(const ErrorExpectedTags([tag]));
}

Result<String>? _Taglong$0(State<String> state) {
  const tag = '😀';
  if (state.input.startsWith(tag, state.pos)) {
    state.pos += 2;
    return const Result(tag);
  }
  return state.fail(const ErrorExpectedTags([tag]));
}

Result<String>? _Tags16bit$0(State<String> state) {
  final pos = state.pos;
  final input = state.input;
  if (pos < input.length) {
    final c = input.codeUnitAt(pos);
    if (c == 97) {
      if (input.startsWith('abc', pos)) {
        state.pos += 3;
        return const Result('abc');
      } else if (input.startsWith('ab', pos)) {
        state.pos += 2;
        return const Result('ab');
      } else {
        state.pos += 1;
        return const Result('a');
      }
    } else if (c == 98) {
      if (input.startsWith('bc', pos)) {
        state.pos += 2;
        return const Result('bc');
      } else {
        state.pos += 1;
        return const Result('b');
      }
    } else if (c == 99) {
      state.pos += 1;
      return const Result('c');
    } else if (c == 55357) {
      if (input.startsWith('😀', pos)) {
        state.pos += 2;
        return const Result('😀');
      }
    }
  }
  return state
      .fail(const ErrorExpectedTags(['a', 'ab', 'abc', 'b', 'bc', 'c', '😀']));
}

Result<String>? _TakeWhileMN03$0(State<String> state) {
  final input = state.input;
  final pos = state.pos;
  var count = 0;
  while (count < 3 && state.pos < input.length) {
    final c = input.runeAt(state.pos);
    final ok = c == 0x1f600;
    if (!ok) {
      break;
    }
    state.pos += c <= 0xffff ? 1 : 2;
    count++;
  }
  return state.pos != pos
      ? Result(input.substring(pos, state.pos))
      : const Result('');
}

Result<String>? _TakeWhileMN12$0(State<String> state) {
  final input = state.input;
  final pos = state.pos;
  var count = 0;
  while (count < 2 && state.pos < input.length) {
    final c = input.runeAt(state.pos);
    final ok = c == 0x1f600;
    if (!ok) {
      break;
    }
    state.pos += c <= 0xffff ? 1 : 2;
    count++;
  }
  if (count >= 1) {
    return state.pos != pos
        ? Result(input.substring(pos, state.pos))
        : const Result('');
  }
  final end = state.pos;
  state.pos = pos;
  return end < input.length
      ? state.failAt(end, const ErrorUnexpectedChar())
      : state.failAt(end, const ErrorUnexpectedEof());
}

Result<String>? _Take16WhileMN03$0(State<String> state) {
  final input = state.input;
  final pos = state.pos;
  var count = 0;
  while (count < 3 && state.pos < input.length) {
    final c = input.codeUnitAt(state.pos);
    final ok = c >= 48 && c <= 57;
    if (!ok) {
      break;
    }
    state.pos++;
    count++;
  }
  return state.pos != pos
      ? Result(input.substring(pos, state.pos))
      : const Result('');
}

Result<String>? _Take16WhileMN12$0(State<String> state) {
  final input = state.input;
  final pos = state.pos;
  var count = 0;
  while (count < 2 && state.pos < input.length) {
    final c = input.codeUnitAt(state.pos);
    final ok = c >= 48 && c <= 57;
    if (!ok) {
      break;
    }
    state.pos++;
    count++;
  }
  if (count >= 1) {
    return state.pos != pos
        ? Result(input.substring(pos, state.pos))
        : const Result('');
  }
  final end = state.pos;
  state.pos = pos;
  return end < input.length
      ? state.failAt(end, const ErrorUnexpectedChar())
      : state.failAt(end, const ErrorUnexpectedEof());
}

Result<String>? _TakeWhile$0(State<String> state) {
  final input = state.input;
  final start = state.pos;
  while (state.pos < input.length) {
    final c = input.runeAt(state.pos);
    final v = c == 0x1f600;
    if (!v) {
      break;
    }
    state.pos += c <= 0xffff ? 1 : 2;
  }
  return state.pos != start
      ? Result(input.substring(start, state.pos))
      : const Result('');
}

Result<String>? _TakeWhile1$0(State<String> state) {
  final input = state.input;
  final start = state.pos;
  while (state.pos < input.length) {
    final c = input.runeAt(state.pos);
    final v = c == 0x1f600;
    if (!v) {
      break;
    }
    state.pos += c <= 0xffff ? 1 : 2;
  }
  if (state.pos != start) {
    return Result(input.substring(start, state.pos));
  }
  if (state.pos != input.length) {
    return state.fail(const ErrorUnexpectedChar());
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<String>? _Take16While$0(State<String> state) {
  final input = state.input;
  final start = state.pos;
  while (state.pos < input.length) {
    final c = input.runeAt(state.pos);
    final v = c >= 48 && c <= 57;
    if (!v) {
      break;
    }
    state.pos++;
  }
  return state.pos != start
      ? Result(input.substring(start, state.pos))
      : const Result('');
}

Result<String>? _Take16While1$0(State<String> state) {
  final input = state.input;
  final start = state.pos;
  while (state.pos < input.length) {
    final c = input.runeAt(state.pos);
    final v = c >= 48 && c <= 57;
    if (!v) {
      break;
    }
    state.pos += c <= 0xffff ? 1 : 2;
  }
  if (state.pos != start) {
    return Result(input.substring(start, state.pos));
  }
  if (state.pos != input.length) {
    return state.fail(const ErrorUnexpectedChar());
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<int>? _Terminated$0(State<String> state) {
  final pos = state.pos;
  final r1 = _$2(state);
  if (r1 != null) {
    final r2 = _$7(state);
    if (r2 != null) {
      return r1;
    }
  }
  state.pos = pos;
  return null;
}

Result<String>? _$31(State<String> state) {
  const tag = '"';
  if (state.pos < state.input.length &&
      state.input.codeUnitAt(state.pos) == 34) {
    state.pos++;
    return const Result(tag);
  }
  return state.fail(const ErrorExpectedTags([tag]));
}

Result<String>? _$32(State<String> state) {
  final input = state.input;
  final start = state.pos;
  while (state.pos < input.length) {
    final c = input.runeAt(state.pos);
    final v = c >= 48 && c <= 57;
    if (!v) {
      break;
    }
    state.pos += c <= 0xffff ? 1 : 2;
  }
  return state.pos != start
      ? Result(input.substring(start, state.pos))
      : const Result('');
}

Result<String>? _$30(State<String> state) {
  final pos = state.pos;
  final r1 = _$31(state);
  if (r1 != null) {
    final r2 = _$32(state);
    if (r2 != null) {
      final r3 = _$31(state);
      if (r3 != null) {
        return r2;
      }
    }
  }
  state.pos = pos;
  return null;
}

Result<String>? _Unterminated$0(State<String> state) {
  final errors = state.errors.toList();
  final previous = state.failPos;
  state.errors = [];
  state.failPos = 0;
  final r1 = _$30(state);
  final current = state.failPos;
  if (current < previous) {
    state.errors = errors;
    state.failPos = previous;
  }
  if (r1 != null) {
    if (current == previous) {
      state.errors.addAll(errors);
    }
    return r1;
  }
  if (current < previous) {
    return null;
  }
  final (bool, List<ParseError>)? v;
  v = state.pos == current
      ? (false, [])
      : (false, [ErrorMessage(state.pos - current, 'unterminated')]);
  if (current == previous) {
    if (v.$1) {
      state.errors = errors;
    } else {
      state.errors.addAll(errors);
    }
  } else {
    if (v.$1) {
      state.errors = [];
    }
  }
  state.errors.addAll(v.$2);
  return null;
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
  List<ParseError> errors = [];

  int failPos = 0;

  final T input;

  int pos = 0;

  State(this.input);

  @pragma('vm:prefer-inline')
  Result<R>? fail<R>(ParseError error) {
    if (pos < failPos) {
      return null;
    } else if (failPos < pos) {
      failPos = pos;
      errors = [];
    }
    errors.add(error);
    return null;
  }

  @pragma('vm:prefer-inline')
  Result<R>? failAt<R>(int offset, ParseError error) {
    if (offset < failPos) {
      return null;
    } else if (failPos < offset) {
      failPos = offset;
      errors = [];
    }
    errors.add(error);
    return null;
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
