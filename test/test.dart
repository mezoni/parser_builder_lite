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
}

void _test_And$0() {
  // And
  test('And', () {
    final $$2 = State('01');
    final $$0 = _And$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'01\'');
    final $$1 = $$0!.value;
    expect($$1, 48, reason: 'Testing \'result.value\' failed, source: \'01\'');
    expect($$2.pos, 1, reason: 'Testing \'state.pos\' failed, source: \'01\'');
    final $$4 = State('');
    final $$3 = _And$0($$4);
    expect($$3 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$4.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$4.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$4.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    final $$6 = State('1');
    final $$5 = _And$0($$6);
    expect($$5 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'1\'');
    expect($$6.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'1\'');
    expect($$6.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'1\'');
    expect($$6.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'1\'');
    expect($$6.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, source: \'1\'');
    final $$8 = State('0');
    final $$7 = _And$0($$8);
    expect($$7 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'0\'');
    expect($$8.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'0\'');
    expect($$8.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, source: \'0\'');
    expect($$8.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'0\'');
    expect($$8.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'0\'');
  });
}

void _test_And$1() {
  // And
  test('And', () {
    final $$2 = State('01');
    final $$0 = _And$1($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'01\'');
    final $$1 = $$0!.value;
    expect($$1, 48, reason: 'Testing \'result.value\' failed, source: \'01\'');
    expect($$2.pos, 1, reason: 'Testing \'state.pos\' failed, source: \'01\'');
    final $$5 = State('😀');
    final $$3 = _And$1($$5);
    expect($$3 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'😀\'');
    final $$4 = $$3!.value;
    expect($$4, 128512,
        reason: 'Testing \'result.value\' failed, source: \'😀\'');
    expect($$5.pos, 2, reason: 'Testing \'state.pos\' failed, source: \'😀\'');
    final $$7 = State('');
    final $$6 = _And$1($$7);
    expect($$6 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$7.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$7.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$7.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$7.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
  });
}

void _test_Char16bit$0() {
  // Char (16-bit)
  test('Char (16-bit)', () {
    final $$2 = State('01');
    final $$0 = _Char16bit$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'01\'');
    final $$1 = $$0!.value;
    expect($$1, 48, reason: 'Testing \'result.value\' failed, source: \'01\'');
    expect($$2.pos, 1, reason: 'Testing \'state.pos\' failed, source: \'01\'');
    final $$4 = State('');
    final $$3 = _Char16bit$0($$4);
    expect($$3 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$4.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$4.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$4.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    final $$6 = State('😀');
    final $$5 = _Char16bit$0($$6);
    expect($$5 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'😀\'');
    expect($$6.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'😀\'');
    expect($$6.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'😀\'');
    expect($$6.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'😀\'');
    expect($$6.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, source: \'😀\'');
  });
}

void _test_Char32bit$0() {
  // Char (32-bit)
  test('Char (32-bit)', () {
    final $$2 = State('😀');
    final $$0 = _Char32bit$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'😀\'');
    final $$1 = $$0!.value;
    expect($$1, 128512,
        reason: 'Testing \'result.value\' failed, source: \'😀\'');
    expect($$2.pos, 2, reason: 'Testing \'state.pos\' failed, source: \'😀\'');
    final $$4 = State('');
    final $$3 = _Char32bit$0($$4);
    expect($$3 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$4.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$4.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$4.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    final $$6 = State('01');
    final $$5 = _Char32bit$0($$6);
    expect($$5 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'01\'');
    expect($$6.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'01\'');
    expect($$6.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'01\'');
    expect($$6.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'01\'');
    expect($$6.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, source: \'01\'');
  });
}

void _test_Choice2variants$0() {
  // Choice (2 variants)
  test('Choice (2 variants)', () {
    final $$2 = State('01');
    final $$0 = _Choice2variants$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'01\'');
    final $$1 = $$0!.value;
    expect($$1, 48, reason: 'Testing \'result.value\' failed, source: \'01\'');
    expect($$2.pos, 1, reason: 'Testing \'state.pos\' failed, source: \'01\'');
    final $$5 = State('12');
    final $$3 = _Choice2variants$0($$5);
    expect($$3 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'12\'');
    final $$4 = $$3!.value;
    expect($$4, 49, reason: 'Testing \'result.value\' failed, source: \'12\'');
    expect($$5.pos, 1, reason: 'Testing \'state.pos\' failed, source: \'12\'');
    final $$7 = State('');
    final $$6 = _Choice2variants$0($$7);
    expect($$6 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$7.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$7.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$7.errors.length, 2,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$7.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    expect($$7.errors[1], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    final $$9 = State('2');
    final $$8 = _Choice2variants$0($$9);
    expect($$8 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'2\'');
    expect($$9.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'2\'');
    expect($$9.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'2\'');
    expect($$9.errors.length, 2,
        reason: 'Testing \'state.errors.length\' failed, source: \'2\'');
    expect($$9.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, source: \'2\'');
    expect($$9.errors[1], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, source: \'2\'');
  });
}

void _test_Choice3variants$0() {
  // Choice (3 variants)
  test('Choice (3 variants)', () {
    final $$2 = State('01');
    final $$0 = _Choice3variants$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'01\'');
    final $$1 = $$0!.value;
    expect($$1, 48, reason: 'Testing \'result.value\' failed, source: \'01\'');
    expect($$2.pos, 1, reason: 'Testing \'state.pos\' failed, source: \'01\'');
    final $$5 = State('12');
    final $$3 = _Choice3variants$0($$5);
    expect($$3 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'12\'');
    final $$4 = $$3!.value;
    expect($$4, 49, reason: 'Testing \'result.value\' failed, source: \'12\'');
    expect($$5.pos, 1, reason: 'Testing \'state.pos\' failed, source: \'12\'');
    final $$8 = State('23');
    final $$6 = _Choice3variants$0($$8);
    expect($$6 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'23\'');
    final $$7 = $$6!.value;
    expect($$7, 50, reason: 'Testing \'result.value\' failed, source: \'23\'');
    expect($$8.pos, 1, reason: 'Testing \'state.pos\' failed, source: \'23\'');
    final $$10 = State('');
    final $$9 = _Choice3variants$0($$10);
    expect($$9 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$10.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$10.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$10.errors.length, 3,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$10.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    expect($$10.errors[1], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    expect($$10.errors[2], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    final $$12 = State('3');
    final $$11 = _Choice3variants$0($$12);
    expect($$11 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'3\'');
    expect($$12.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'3\'');
    expect($$12.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'3\'');
    expect($$12.errors.length, 3,
        reason: 'Testing \'state.errors.length\' failed, source: \'3\'');
    expect($$12.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, source: \'3\'');
    expect($$12.errors[1], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, source: \'3\'');
    expect($$12.errors[2], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, source: \'3\'');
  });
}

void _test_Char16$0() {
  // Char16
  test('Char16', () {
    final $$2 = State('12');
    final $$0 = _Char16$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'12\'');
    final $$1 = $$0!.value;
    expect($$1, 49, reason: 'Testing \'result.value\' failed, source: \'12\'');
    expect($$2.pos, 1, reason: 'Testing \'state.pos\' failed, source: \'12\'');
    final $$4 = State('');
    final $$3 = _Char16$0($$4);
    expect($$3 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$4.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$4.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$4.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    final $$6 = State('2');
    final $$5 = _Char16$0($$6);
    expect($$5 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'2\'');
    expect($$6.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'2\'');
    expect($$6.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'2\'');
    expect($$6.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'2\'');
    expect($$6.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, source: \'2\'');
  });
}

void _test_Char$0() {
  // Char
  test('Char', () {
    final $$2 = State('😀`');
    final $$0 = _Char$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'😀`\'');
    final $$1 = $$0!.value;
    expect($$1, 128512,
        reason: 'Testing \'result.value\' failed, source: \'😀`\'');
    expect($$2.pos, 2, reason: 'Testing \'state.pos\' failed, source: \'😀`\'');
    final $$4 = State('');
    final $$3 = _Char$0($$4);
    expect($$3 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$4.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$4.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$4.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    final $$6 = State('2');
    final $$5 = _Char$0($$6);
    expect($$5 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'2\'');
    expect($$6.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'2\'');
    expect($$6.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'2\'');
    expect($$6.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'2\'');
    expect($$6.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, source: \'2\'');
  });
}

void _test_Delimited$0() {
  // Delimited
  test('Delimited', () {
    final $$2 = State('123');
    final $$0 = _Delimited$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'123\'');
    final $$1 = $$0!.value;
    expect($$1, 50, reason: 'Testing \'result.value\' failed, source: \'123\'');
    expect($$2.pos, 3, reason: 'Testing \'state.pos\' failed, source: \'123\'');
    final $$4 = State('');
    final $$3 = _Delimited$0($$4);
    expect($$3 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$4.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$4.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$4.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    final $$6 = State('1');
    final $$5 = _Delimited$0($$6);
    expect($$5 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'1\'');
    expect($$6.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'1\'');
    expect($$6.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, source: \'1\'');
    expect($$6.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'1\'');
    expect($$6.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'1\'');
    final $$8 = State('12');
    final $$7 = _Delimited$0($$8);
    expect($$7 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'12\'');
    expect($$8.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'12\'');
    expect($$8.failPos, 2,
        reason: 'Testing \'state.failPos\' failed, source: \'12\'');
    expect($$8.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'12\'');
    expect($$8.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'12\'');
    final $$10 = State('2');
    final $$9 = _Delimited$0($$10);
    expect($$9 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'2\'');
    expect($$10.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'2\'');
    expect($$10.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'2\'');
    expect($$10.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'2\'');
    expect($$10.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, source: \'2\'');
  });
}

void _test_Eof$0() {
  // Eof
  test('Eof', () {
    final $$2 = State('');
    final $$0 = _Eof$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'\'');
    final $$1 = $$0!.value;
    expect($$1, null, reason: 'Testing \'result.value\' failed, source: \'\'');
    expect($$2.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    final $$4 = State('1');
    final $$3 = _Eof$0($$4);
    expect($$3 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'1\'');
    expect($$4.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'1\'');
    expect($$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'1\'');
    expect($$4.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'1\'');
    expect($$4.errors[0], isA<ErrorExpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'1\'');
  });
}

void _test_Expected$0() {
  // Expected
  test('Expected', () {
    final $$2 = State('123');
    final $$0 = _Expected$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'123\'');
    final $$1 = $$0!.value;
    expect($$1, (0x31, 0x32),
        reason: 'Testing \'result\' failed, source: \'123\'');
    expect($$2.pos, 2, reason: 'Testing \'state.pos\' failed, source: \'123\'');
    final $$4 = State('');
    final $$3 = _Expected$0($$4);
    expect($$3 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$4.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$4.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$4.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    expect(($$4.errors[0] as ErrorExpectedTags).tags[0], 'expr',
        reason: 'Testing \'ErrorExpectedTags).tags\' failed, source: \'\'');
    final $$6 = State('1');
    final $$5 = _Expected$0($$6);
    expect($$5 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'1\'');
    expect($$6.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'1\'');
    expect($$6.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, source: \'1\'');
    expect($$6.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'1\'');
    expect($$6.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'1\'');
  });
}

void _test_FastSatisfy16$0() {
  // FastSatisfy16
  test('FastSatisfy16', () {
    final $$2 = State('1');
    final $$0 = _FastSatisfy16$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'1\'');
    final $$1 = $$0!.value;
    expect($$1, null, reason: 'Testing \'result\' failed, source: \'1\'');
    expect($$2.pos, 1, reason: 'Testing \'state.pos\' failed, source: \'1\'');
    final $$4 = State('');
    final $$3 = _FastSatisfy16$0($$4);
    expect($$3 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$4.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$4.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$4.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    final $$6 = State('a');
    final $$5 = _FastSatisfy16$0($$6);
    expect($$5 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'a\'');
    expect($$6.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'a\'');
    expect($$6.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'a\'');
    expect($$6.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'a\'');
    expect($$6.errors[0], isA<ErrorUnexpectedChar>(),
        reason: 'Testing \'state.error\' failed, source: \'a\'');
  });
}

void _test_FastSatisfy16$1() {
  // FastSatisfy16
  test('FastSatisfy16', () {
    final $$2 = State('😀');
    final $$0 = _FastSatisfy16$1($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'😀\'');
    final $$1 = $$0!.value;
    expect($$1, null, reason: 'Testing \'result\' failed, source: \'😀\'');
    expect($$2.pos, 2, reason: 'Testing \'state.pos\' failed, source: \'😀\'');
    final $$4 = State('');
    final $$3 = _FastSatisfy16$1($$4);
    expect($$3 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$4.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$4.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$4.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    final $$6 = State('a');
    final $$5 = _FastSatisfy16$1($$6);
    expect($$5 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'a\'');
    expect($$6.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'a\'');
    expect($$6.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'a\'');
    expect($$6.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'a\'');
    expect($$6.errors[0], isA<ErrorUnexpectedChar>(),
        reason: 'Testing \'state.error\' failed, source: \'a\'');
  });
}

void _test_Many$0() {
  // Many
  test('Many', () {
    final $$2 = State('1112');
    final $$0 = _Many$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'1112\'');
    final $$1 = $$0!.value;
    expect($$1, [49, 49, 49],
        reason: 'Testing \'result.value\' failed, source: \'1112\'');
    expect($$2.pos, 3,
        reason: 'Testing \'state.pos\' failed, source: \'1112\'');
    final $$5 = State('');
    final $$3 = _Many$0($$5);
    expect($$3 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'\'');
    final $$4 = $$3!.value;
    expect($$4, [], reason: 'Testing \'result.value\' failed, source: \'\'');
    expect($$5.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    final $$8 = State('2');
    final $$6 = _Many$0($$8);
    expect($$6 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'2\'');
    final $$7 = $$6!.value;
    expect($$7, [], reason: 'Testing \'result.value\' failed, source: \'2\'');
    expect($$8.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'2\'');
  });
}

void _test_Many1$0() {
  // Many1
  test('Many1', () {
    final $$2 = State('1112');
    final $$0 = _Many1$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'1112\'');
    final $$1 = $$0!.value;
    expect($$1, [49, 49, 49],
        reason: 'Testing \'result.value\' failed, source: \'1112\'');
    expect($$2.pos, 3,
        reason: 'Testing \'state.pos\' failed, source: \'1112\'');
    final $$4 = State('');
    final $$3 = _Many1$0($$4);
    expect($$3 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$4.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$4.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$4.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    final $$6 = State('2');
    final $$5 = _Many1$0($$6);
    expect($$5 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'2\'');
    expect($$6.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'2\'');
    expect($$6.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'2\'');
    expect($$6.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'2\'');
    expect($$6.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, source: \'2\'');
  });
}

void _test_ManyCount$0() {
  // ManyCount
  test('ManyCount', () {
    final $$2 = State('1112');
    final $$0 = _ManyCount$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'1112\'');
    final $$1 = $$0!.value;
    expect($$1, 3, reason: 'Testing \'result.value\' failed, source: \'1112\'');
    expect($$2.pos, 3,
        reason: 'Testing \'state.pos\' failed, source: \'1112\'');
    final $$5 = State('');
    final $$3 = _ManyCount$0($$5);
    expect($$3 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'\'');
    final $$4 = $$3!.value;
    expect($$4, 0, reason: 'Testing \'result.value\' failed, source: \'\'');
    expect($$5.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    final $$8 = State('2');
    final $$6 = _ManyCount$0($$8);
    expect($$6 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'2\'');
    final $$7 = $$6!.value;
    expect($$7, 0, reason: 'Testing \'result.value\' failed, source: \'2\'');
    expect($$8.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'2\'');
  });
}

void _test_Many1Count$0() {
  // Many1Count
  test('Many1Count', () {
    final $$2 = State('1112');
    final $$0 = _Many1Count$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'1112\'');
    final $$1 = $$0!.value;
    expect($$1, 3, reason: 'Testing \'result.value\' failed, source: \'1112\'');
    expect($$2.pos, 3,
        reason: 'Testing \'state.pos\' failed, source: \'1112\'');
    final $$4 = State('');
    final $$3 = _Many1Count$0($$4);
    expect($$3 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$4.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$4.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$4.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    final $$6 = State('2');
    final $$5 = _Many1Count$0($$6);
    expect($$5 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'2\'');
    expect($$6.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'2\'');
    expect($$6.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'2\'');
    expect($$6.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'2\'');
    expect($$6.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, source: \'2\'');
  });
}

void _test_ManyMN03$0() {
  // ManyMN (0..3)
  test('ManyMN (0..3)', () {
    final $$2 = State('12');
    final $$0 = _ManyMN03$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'12\'');
    final $$1 = $$0!.value;
    expect($$1, [49],
        reason: 'Testing \'result.value\' failed, source: \'12\'');
    expect($$2.pos, 1, reason: 'Testing \'state.pos\' failed, source: \'12\'');
    final $$5 = State('112');
    final $$3 = _ManyMN03$0($$5);
    expect($$3 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'112\'');
    final $$4 = $$3!.value;
    expect($$4, [49, 49],
        reason: 'Testing \'result.value\' failed, source: \'112\'');
    expect($$5.pos, 2, reason: 'Testing \'state.pos\' failed, source: \'112\'');
    final $$8 = State('11112');
    final $$6 = _ManyMN03$0($$8);
    expect($$6 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'11112\'');
    final $$7 = $$6!.value;
    expect($$7, [49, 49, 49],
        reason: 'Testing \'result.value\' failed, source: \'11112\'');
    expect($$8.pos, 3,
        reason: 'Testing \'state.pos\' failed, source: \'11112\'');
    final $$11 = State('2');
    final $$9 = _ManyMN03$0($$11);
    expect($$9 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'2\'');
    final $$10 = $$9!.value;
    expect($$10, [], reason: 'Testing \'result.value\' failed, source: \'2\'');
    expect($$11.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'2\'');
    final $$14 = State('');
    final $$12 = _ManyMN03$0($$14);
    expect($$12 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'\'');
    final $$13 = $$12!.value;
    expect($$13, [], reason: 'Testing \'result.value\' failed, source: \'\'');
    expect($$14.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
  });
}

void _test_ManyMN23$0() {
  // ManyMN (2..3)
  test('ManyMN (2..3)', () {
    final $$2 = State('112');
    final $$0 = _ManyMN23$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'112\'');
    final $$1 = $$0!.value;
    expect($$1, [49, 49],
        reason: 'Testing \'result.value\' failed, source: \'112\'');
    expect($$2.pos, 2, reason: 'Testing \'state.pos\' failed, source: \'112\'');
    final $$5 = State('11112');
    final $$3 = _ManyMN23$0($$5);
    expect($$3 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'11112\'');
    final $$4 = $$3!.value;
    expect($$4, [49, 49, 49],
        reason: 'Testing \'result.value\' failed, source: \'11112\'');
    expect($$5.pos, 3,
        reason: 'Testing \'state.pos\' failed, source: \'11112\'');
    final $$7 = State('');
    final $$6 = _ManyMN23$0($$7);
    expect($$6 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$7.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$7.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$7.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$7.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    final $$9 = State('1');
    final $$8 = _ManyMN23$0($$9);
    expect($$8 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'1\'');
    expect($$9.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'1\'');
    expect($$9.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, source: \'1\'');
    expect($$9.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'1\'');
    expect($$9.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'1\'');
    final $$11 = State('2');
    final $$10 = _ManyMN23$0($$11);
    expect($$10 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'2\'');
    expect($$11.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'2\'');
    expect($$11.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'2\'');
    expect($$11.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'2\'');
    expect($$11.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, source: \'2\'');
  });
}

void _test_Not$0() {
  // Not
  test('Not', () {
    final $$2 = State('02');
    final $$0 = _Not$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'02\'');
    final $$1 = $$0!.value;
    expect($$1, 48, reason: 'Testing \'result.value\' failed, source: \'02\'');
    expect($$2.pos, 1, reason: 'Testing \'state.pos\' failed, source: \'02\'');
    final $$5 = State('0');
    final $$3 = _Not$0($$5);
    expect($$3 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'0\'');
    final $$4 = $$3!.value;
    expect($$4, 48, reason: 'Testing \'result.value\' failed, source: \'0\'');
    expect($$5.pos, 1, reason: 'Testing \'state.pos\' failed, source: \'0\'');
    final $$7 = State('');
    final $$6 = _Not$0($$7);
    expect($$6 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$7.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$7.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$7.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$7.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    final $$9 = State('1');
    final $$8 = _Not$0($$9);
    expect($$8 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'1\'');
    expect($$9.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'1\'');
    expect($$9.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'1\'');
    expect($$9.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'1\'');
    expect($$9.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, source: \'1\'');
    final $$11 = State('01');
    final $$10 = _Not$0($$11);
    expect($$10 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'01\'');
    expect($$11.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'01\'');
    expect($$11.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, source: \'01\'');
    expect($$11.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'01\'');
    expect($$11.errors[0], isA<ErrorUnexpectedInput>(),
        reason: 'Testing \'state.error\' failed, source: \'01\'');
    expect(($$11.errors[0] as ErrorUnexpectedInput).length, 1,
        reason:
            'Testing \'ErrorUnexpectedInput.length\' failed, source: \'01\'');
  });
}

void _test_Preceded$0() {
  // Preceded
  test('Preceded', () {
    final $$2 = State('123');
    final $$0 = _Preceded$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'123\'');
    final $$1 = $$0!.value;
    expect($$1, 50, reason: 'Testing \'result.value\' failed, source: \'123\'');
    expect($$2.pos, 2, reason: 'Testing \'state.pos\' failed, source: \'123\'');
    final $$4 = State('');
    final $$3 = _Preceded$0($$4);
    expect($$3 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$4.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$4.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$4.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    final $$6 = State('1');
    final $$5 = _Preceded$0($$6);
    expect($$5 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'1\'');
    expect($$6.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'1\'');
    expect($$6.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, source: \'1\'');
    expect($$6.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'1\'');
    expect($$6.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'1\'');
    final $$8 = State('2');
    final $$7 = _Preceded$0($$8);
    expect($$7 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'2\'');
    expect($$8.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'2\'');
    expect($$8.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'2\'');
    expect($$8.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'2\'');
    expect($$8.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, source: \'2\'');
  });
}

void _test_ReplaceErrors$0() {
  // ReplaceErrors
  test('ReplaceErrors', () {
    final $$2 = State('12a');
    final $$0 = _ReplaceErrors$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'12a\'');
    final $$1 = $$0!.value;
    expect($$1, '12',
        reason: 'Testing \'result.value\' failed, source: \'12a\'');
    expect($$2.pos, 2, reason: 'Testing \'state.pos\' failed, source: \'12a\'');
    final $$4 = State('');
    final $$3 = _ReplaceErrors$0($$4);
    expect($$3 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$4.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$4.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$4.errors[0], isA<ErrorMessage>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    expect(($$4.errors[0] as ErrorMessage).message, 'error message',
        reason: 'Testing \'error.message\' failed, source: \'\'');
    expect(($$4.errors[0] as ErrorMessage).length, 0,
        reason: 'Testing \'ErrorMessage.length\' failed, source: \'\'');
    final $$6 = State('1');
    final $$5 = _ReplaceErrors$0($$6);
    expect($$5 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'1\'');
    expect($$6.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'1\'');
    expect($$6.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, source: \'1\'');
    expect($$6.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'1\'');
    expect($$6.errors[0], isA<ErrorMessage>(),
        reason: 'Testing \'state.error\' failed, source: \'1\'');
    expect(($$6.errors[0] as ErrorMessage).message, 'error message',
        reason: 'Testing \'ErrorMessage.message\' failed, source: \'1\'');
    expect(($$6.errors[0] as ErrorMessage).length, 1,
        reason: 'Testing \'ErrorMessage.length\' failed, source: \'1\'');
    final $$8 = State('a');
    final $$7 = _ReplaceErrors$0($$8);
    expect($$7 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'a\'');
    expect($$8.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'a\'');
    expect($$8.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'a\'');
    expect($$8.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'a\'');
    expect($$8.errors[0], isA<ErrorMessage>(),
        reason: 'Testing \'state.error\' failed, source: \'a\'');
    expect(($$8.errors[0] as ErrorMessage).message, 'error message',
        reason: 'Testing \'ErrorMessage.message\' failed, source: \'a\'');
    expect(($$8.errors[0] as ErrorMessage).length, 0,
        reason: 'Testing \'ErrorMessage.length\' failed, source: \'a\'');
  });
}

void _test_StringChars$0() {
  // StringChars
  test('StringChars', () {
    final $$2 = State('12');
    final $$0 = _StringChars$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'12\'');
    final $$1 = $$0!.value;
    expect($$1, '12',
        reason: 'Testing \'result.value\' failed, source: \'12\'');
    expect($$2.pos, 2, reason: 'Testing \'state.pos\' failed, source: \'12\'');
    final $$5 = State('\\n1');
    final $$3 = _StringChars$0($$5);
    expect($$3 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'\\\\n1\'');
    final $$4 = $$3!.value;
    expect($$4, '\n1',
        reason: 'Testing \'result.value\' failed, source: \'\\\\n1\'');
    expect($$5.pos, 3,
        reason: 'Testing \'state.pos\' failed, source: \'\\\\n1\'');
    final $$8 = State('1\\n2');
    final $$6 = _StringChars$0($$8);
    expect($$6 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'1\\\\n2\'');
    final $$7 = $$6!.value;
    expect($$7, '1\n2',
        reason: 'Testing \'result.value\' failed, source: \'1\\\\n2\'');
    expect($$8.pos, 4,
        reason: 'Testing \'state.pos\' failed, source: \'1\\\\n2\'');
    final $$11 = State('\\n\\n1');
    final $$9 = _StringChars$0($$11);
    expect($$9 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'\\\\n\\\\n1\'');
    final $$10 = $$9!.value;
    expect($$10, '\n\n1',
        reason: 'Testing \'result.value\' failed, source: \'\\\\n\\\\n1\'');
    expect($$11.pos, 5,
        reason: 'Testing \'state.pos\' failed, source: \'\\\\n\\\\n1\'');
    final $$14 = State('');
    final $$12 = _StringChars$0($$14);
    expect($$12 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'\'');
    final $$13 = $$12!.value;
    expect($$13, '', reason: 'Testing \'result.value\' failed, source: \'\'');
    expect($$14.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
  });
}

void _test_Tagshort$0() {
  // Tag (short)
  test('Tag (short)', () {
    final $$2 = State('01');
    final $$0 = _Tagshort$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'01\'');
    final $$1 = $$0!.value;
    expect($$1, '0', reason: 'Testing \'result.value\' failed, source: \'01\'');
    expect($$2.pos, 1, reason: 'Testing \'state.pos\' failed, source: \'01\'');
    final $$4 = State('');
    final $$3 = _Tagshort$0($$4);
    expect($$3 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$4.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$4.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$4.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    final $$6 = State('2');
    final $$5 = _Tagshort$0($$6);
    expect($$5 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'2\'');
    expect($$6.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'2\'');
    expect($$6.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'2\'');
    expect($$6.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'2\'');
    expect($$6.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, source: \'2\'');
  });
}

void _test_Taglong$0() {
  // Tag (long)
  test('Tag (long)', () {
    final $$2 = State('😀1');
    final $$0 = _Taglong$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'😀1\'');
    final $$1 = $$0!.value;
    expect($$1, '😀',
        reason: 'Testing \'result.value\' failed, source: \'😀1\'');
    expect($$2.pos, 2, reason: 'Testing \'state.pos\' failed, source: \'😀1\'');
    final $$4 = State('');
    final $$3 = _Taglong$0($$4);
    expect($$3 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$4.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$4.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$4.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    final $$6 = State('2');
    final $$5 = _Taglong$0($$6);
    expect($$5 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'2\'');
    expect($$6.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'2\'');
    expect($$6.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'2\'');
    expect($$6.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'2\'');
    expect($$6.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, source: \'2\'');
  });
}

void _test_Tags16bit$0() {
  // Tags (16-bit)
  test('Tags (16-bit)', () {
    final $$2 = State('abcd');
    final $$0 = _Tags16bit$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'abcd\'');
    final $$1 = $$0!.value;
    expect($$1, 'abc',
        reason: 'Testing \'result.value\' failed, source: \'abcd\'');
    expect($$2.pos, 3,
        reason: 'Testing \'state.pos\' failed, source: \'abcd\'');
    final $$5 = State('abd');
    final $$3 = _Tags16bit$0($$5);
    expect($$3 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'abd\'');
    final $$4 = $$3!.value;
    expect($$4, 'ab',
        reason: 'Testing \'result.value\' failed, source: \'abd\'');
    expect($$5.pos, 2, reason: 'Testing \'state.pos\' failed, source: \'abd\'');
    final $$8 = State('ad');
    final $$6 = _Tags16bit$0($$8);
    expect($$6 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'ad\'');
    final $$7 = $$6!.value;
    expect($$7, 'a', reason: 'Testing \'result.value\' failed, source: \'ad\'');
    expect($$8.pos, 1, reason: 'Testing \'state.pos\' failed, source: \'ad\'');
    final $$11 = State('bcd');
    final $$9 = _Tags16bit$0($$11);
    expect($$9 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'bcd\'');
    final $$10 = $$9!.value;
    expect($$10, 'bc',
        reason: 'Testing \'result.value\' failed, source: \'bcd\'');
    expect($$11.pos, 2,
        reason: 'Testing \'state.pos\' failed, source: \'bcd\'');
    final $$14 = State('bd');
    final $$12 = _Tags16bit$0($$14);
    expect($$12 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'bd\'');
    final $$13 = $$12!.value;
    expect($$13, 'b',
        reason: 'Testing \'result.value\' failed, source: \'bd\'');
    expect($$14.pos, 1, reason: 'Testing \'state.pos\' failed, source: \'bd\'');
    final $$17 = State('cd');
    final $$15 = _Tags16bit$0($$17);
    expect($$15 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'cd\'');
    final $$16 = $$15!.value;
    expect($$16, 'c',
        reason: 'Testing \'result.value\' failed, source: \'cd\'');
    expect($$17.pos, 1, reason: 'Testing \'state.pos\' failed, source: \'cd\'');
    final $$20 = State('😀');
    final $$18 = _Tags16bit$0($$20);
    expect($$18 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'😀\'');
    final $$19 = $$18!.value;
    expect($$19, '😀',
        reason: 'Testing \'result.value\' failed, source: \'😀\'');
    expect($$20.pos, 2, reason: 'Testing \'state.pos\' failed, source: \'😀\'');
    final $$22 = State('');
    final $$21 = _Tags16bit$0($$22);
    expect($$21 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$22.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$22.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$22.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$22.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    final $$24 = State('x');
    final $$23 = _Tags16bit$0($$24);
    expect($$23 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'x\'');
    expect($$24.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'x\'');
    expect($$24.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'x\'');
    expect($$24.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'x\'');
    expect($$24.errors[0], isA<ErrorExpectedTags>(),
        reason: 'Testing \'state.error\' failed, source: \'x\'');
  });
}

void _test_TakeWhileMN03$0() {
  // TakeWhileMN (0..3)
  test('TakeWhileMN (0..3)', () {
    final $$2 = State('😀😀😀😀');
    final $$0 = _TakeWhileMN03$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'😀😀😀😀\'');
    final $$1 = $$0!.value;
    expect($$1, '😀😀😀',
        reason: 'Testing \'result.value\' failed, source: \'😀😀😀😀\'');
    expect($$2.pos, 6,
        reason: 'Testing \'state.pos\' failed, source: \'😀😀😀😀\'');
    final $$5 = State('😀😀');
    final $$3 = _TakeWhileMN03$0($$5);
    expect($$3 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'😀😀\'');
    final $$4 = $$3!.value;
    expect($$4, '😀😀',
        reason: 'Testing \'result.value\' failed, source: \'😀😀\'');
    expect($$5.pos, 4,
        reason: 'Testing \'state.pos\' failed, source: \'😀😀\'');
    final $$8 = State('😀');
    final $$6 = _TakeWhileMN03$0($$8);
    expect($$6 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'😀\'');
    final $$7 = $$6!.value;
    expect($$7, '😀',
        reason: 'Testing \'result.value\' failed, source: \'😀\'');
    expect($$8.pos, 2, reason: 'Testing \'state.pos\' failed, source: \'😀\'');
    final $$11 = State('');
    final $$9 = _TakeWhileMN03$0($$11);
    expect($$9 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'\'');
    final $$10 = $$9!.value;
    expect($$10, '', reason: 'Testing \'result.value\' failed, source: \'\'');
    expect($$11.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    final $$14 = State('a');
    final $$12 = _TakeWhileMN03$0($$14);
    expect($$12 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'a\'');
    final $$13 = $$12!.value;
    expect($$13, '', reason: 'Testing \'result.value\' failed, source: \'a\'');
    expect($$14.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'a\'');
  });
}

void _test_TakeWhileMN12$0() {
  // TakeWhileMN (1..2)
  test('TakeWhileMN (1..2)', () {
    final $$2 = State('😀😀😀😀');
    final $$0 = _TakeWhileMN12$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'😀😀😀😀\'');
    final $$1 = $$0!.value;
    expect($$1, '😀😀',
        reason: 'Testing \'result.value\' failed, source: \'😀😀😀😀\'');
    expect($$2.pos, 4,
        reason: 'Testing \'state.pos\' failed, source: \'😀😀😀😀\'');
    final $$5 = State('😀');
    final $$3 = _TakeWhileMN12$0($$5);
    expect($$3 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'😀\'');
    final $$4 = $$3!.value;
    expect($$4, '😀',
        reason: 'Testing \'result.value\' failed, source: \'😀\'');
    expect($$5.pos, 2, reason: 'Testing \'state.pos\' failed, source: \'😀\'');
    final $$7 = State('');
    final $$6 = _TakeWhileMN12$0($$7);
    expect($$6 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$7.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$7.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$7.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$7.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    final $$9 = State('1');
    final $$8 = _TakeWhileMN12$0($$9);
    expect($$8 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'1\'');
    expect($$9.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'1\'');
    expect($$9.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'1\'');
    expect($$9.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'1\'');
    expect($$9.errors[0], isA<ErrorUnexpectedChar>(),
        reason: 'Testing \'state.error\' failed, source: \'1\'');
  });
}

void _test_Take16WhileMN03$0() {
  // Take16WhileMN (0..3)
  test('Take16WhileMN (0..3)', () {
    final $$2 = State('12345');
    final $$0 = _Take16WhileMN03$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'12345\'');
    final $$1 = $$0!.value;
    expect($$1, '123',
        reason: 'Testing \'result.value\' failed, source: \'12345\'');
    expect($$2.pos, 3,
        reason: 'Testing \'state.pos\' failed, source: \'12345\'');
    final $$5 = State('12');
    final $$3 = _Take16WhileMN03$0($$5);
    expect($$3 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'12\'');
    final $$4 = $$3!.value;
    expect($$4, '12',
        reason: 'Testing \'result.value\' failed, source: \'12\'');
    expect($$5.pos, 2, reason: 'Testing \'state.pos\' failed, source: \'12\'');
    final $$8 = State('1');
    final $$6 = _Take16WhileMN03$0($$8);
    expect($$6 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'1\'');
    final $$7 = $$6!.value;
    expect($$7, '1', reason: 'Testing \'result.value\' failed, source: \'1\'');
    expect($$8.pos, 1, reason: 'Testing \'state.pos\' failed, source: \'1\'');
    final $$11 = State('');
    final $$9 = _Take16WhileMN03$0($$11);
    expect($$9 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'\'');
    final $$10 = $$9!.value;
    expect($$10, '', reason: 'Testing \'result.value\' failed, source: \'\'');
    expect($$11.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    final $$14 = State('a');
    final $$12 = _Take16WhileMN03$0($$14);
    expect($$12 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'a\'');
    final $$13 = $$12!.value;
    expect($$13, '', reason: 'Testing \'result.value\' failed, source: \'a\'');
    expect($$14.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'a\'');
  });
}

void _test_Take16WhileMN12$0() {
  // Take16WhileMN (1..2)
  test('Take16WhileMN (1..2)', () {
    final $$2 = State('123');
    final $$0 = _Take16WhileMN12$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'123\'');
    final $$1 = $$0!.value;
    expect($$1, '12',
        reason: 'Testing \'result.value\' failed, source: \'123\'');
    expect($$2.pos, 2, reason: 'Testing \'state.pos\' failed, source: \'123\'');
    final $$5 = State('1a');
    final $$3 = _Take16WhileMN12$0($$5);
    expect($$3 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'1a\'');
    final $$4 = $$3!.value;
    expect($$4, '1', reason: 'Testing \'result.value\' failed, source: \'1a\'');
    expect($$5.pos, 1, reason: 'Testing \'state.pos\' failed, source: \'1a\'');
    final $$7 = State('');
    final $$6 = _Take16WhileMN12$0($$7);
    expect($$6 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$7.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$7.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$7.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$7.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    final $$9 = State('a');
    final $$8 = _Take16WhileMN12$0($$9);
    expect($$8 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'a\'');
    expect($$9.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'a\'');
    expect($$9.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'a\'');
    expect($$9.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'a\'');
    expect($$9.errors[0], isA<ErrorUnexpectedChar>(),
        reason: 'Testing \'state.error\' failed, source: \'a\'');
  });
}

void _test_TakeWhile$0() {
  // TakeWhile
  test('TakeWhile', () {
    final $$2 = State('😀');
    final $$0 = _TakeWhile$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'😀\'');
    final $$1 = $$0!.value;
    expect($$1, '😀',
        reason: 'Testing \'result.value\' failed, source: \'😀\'');
    expect($$2.pos, 2, reason: 'Testing \'state.pos\' failed, source: \'😀\'');
    final $$5 = State('😀😀');
    final $$3 = _TakeWhile$0($$5);
    expect($$3 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'😀😀\'');
    final $$4 = $$3!.value;
    expect($$4, '😀😀',
        reason: 'Testing \'result.value\' failed, source: \'😀😀\'');
    expect($$5.pos, 4,
        reason: 'Testing \'state.pos\' failed, source: \'😀😀\'');
    final $$8 = State('');
    final $$6 = _TakeWhile$0($$8);
    expect($$6 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'\'');
    final $$7 = $$6!.value;
    expect($$7, '', reason: 'Testing \'result.value\' failed, source: \'\'');
    expect($$8.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    final $$11 = State('a');
    final $$9 = _TakeWhile$0($$11);
    expect($$9 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'a\'');
    final $$10 = $$9!.value;
    expect($$10, '', reason: 'Testing \'result.value\' failed, source: \'a\'');
    expect($$11.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'a\'');
  });
}

void _test_TakeWhile1$0() {
  // TakeWhile1
  test('TakeWhile1', () {
    final $$2 = State('😀');
    final $$0 = _TakeWhile1$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'😀\'');
    final $$1 = $$0!.value;
    expect($$1, '😀',
        reason: 'Testing \'result.value\' failed, source: \'😀\'');
    expect($$2.pos, 2, reason: 'Testing \'state.pos\' failed, source: \'😀\'');
    final $$5 = State('😀😀');
    final $$3 = _TakeWhile1$0($$5);
    expect($$3 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'😀😀\'');
    final $$4 = $$3!.value;
    expect($$4, '😀😀',
        reason: 'Testing \'result.value\' failed, source: \'😀😀\'');
    expect($$5.pos, 4,
        reason: 'Testing \'state.pos\' failed, source: \'😀😀\'');
    final $$7 = State('');
    final $$6 = _TakeWhile1$0($$7);
    expect($$6 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$7.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$7.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$7.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$7.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    final $$9 = State('a');
    final $$8 = _TakeWhile1$0($$9);
    expect($$8 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'a\'');
    expect($$9.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'a\'');
    expect($$9.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'a\'');
    expect($$9.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'a\'');
    expect($$9.errors[0], isA<ErrorUnexpectedChar>(),
        reason: 'Testing \'state.error\' failed, source: \'a\'');
  });
}

void _test_Take16While$0() {
  // Take16While
  test('Take16While', () {
    final $$2 = State('1a');
    final $$0 = _Take16While$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'1a\'');
    final $$1 = $$0!.value;
    expect($$1, '1', reason: 'Testing \'result.value\' failed, source: \'1a\'');
    expect($$2.pos, 1, reason: 'Testing \'state.pos\' failed, source: \'1a\'');
    final $$5 = State('12a');
    final $$3 = _Take16While$0($$5);
    expect($$3 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'12a\'');
    final $$4 = $$3!.value;
    expect($$4, '12',
        reason: 'Testing \'result.value\' failed, source: \'12a\'');
    expect($$5.pos, 2, reason: 'Testing \'state.pos\' failed, source: \'12a\'');
    final $$8 = State('');
    final $$6 = _Take16While$0($$8);
    expect($$6 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'\'');
    final $$7 = $$6!.value;
    expect($$7, '', reason: 'Testing \'result.value\' failed, source: \'\'');
    expect($$8.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    final $$11 = State('a');
    final $$9 = _Take16While$0($$11);
    expect($$9 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'a\'');
    final $$10 = $$9!.value;
    expect($$10, '', reason: 'Testing \'result.value\' failed, source: \'a\'');
    expect($$11.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'a\'');
  });
}

void _test_Take16While1$0() {
  // Take16While1
  test('Take16While1', () {
    final $$2 = State('1a');
    final $$0 = _Take16While1$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'1a\'');
    final $$1 = $$0!.value;
    expect($$1, '1', reason: 'Testing \'result.value\' failed, source: \'1a\'');
    expect($$2.pos, 1, reason: 'Testing \'state.pos\' failed, source: \'1a\'');
    final $$5 = State('12a');
    final $$3 = _Take16While1$0($$5);
    expect($$3 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'12a\'');
    final $$4 = $$3!.value;
    expect($$4, '12',
        reason: 'Testing \'result.value\' failed, source: \'12a\'');
    expect($$5.pos, 2, reason: 'Testing \'state.pos\' failed, source: \'12a\'');
    final $$7 = State('');
    final $$6 = _Take16While1$0($$7);
    expect($$6 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$7.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$7.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$7.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$7.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    final $$9 = State('a');
    final $$8 = _Take16While1$0($$9);
    expect($$8 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'a\'');
    expect($$9.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'a\'');
    expect($$9.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'a\'');
    expect($$9.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'a\'');
    expect($$9.errors[0], isA<ErrorUnexpectedChar>(),
        reason: 'Testing \'state.error\' failed, source: \'a\'');
  });
}

void _test_Terminated$0() {
  // Terminated
  test('Terminated', () {
    final $$2 = State('123');
    final $$0 = _Terminated$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'123\'');
    final $$1 = $$0!.value;
    expect($$1, 49, reason: 'Testing \'result.value\' failed, source: \'123\'');
    expect($$2.pos, 2, reason: 'Testing \'state.pos\' failed, source: \'123\'');
    final $$4 = State('');
    final $$3 = _Terminated$0($$4);
    expect($$3 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect($$4.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect($$4.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect($$4.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect($$4.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    final $$6 = State('1');
    final $$5 = _Terminated$0($$6);
    expect($$5 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'1\'');
    expect($$6.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'1\'');
    expect($$6.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, source: \'1\'');
    expect($$6.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'1\'');
    expect($$6.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'1\'');
    final $$8 = State('2');
    final $$7 = _Terminated$0($$8);
    expect($$7 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'2\'');
    expect($$8.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'2\'');
    expect($$8.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'2\'');
    expect($$8.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'2\'');
    expect($$8.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, source: \'2\'');
  });
}

Result<int>? _$0(State<String> state) {
  if (state.pos < state.source.length) {
    final c = state.source.codeUnitAt(state.pos);
    if (c == 48) {
      state.pos++;
      return const Result(48);
    }
    return state.fail(const ErrorExpectedChar(48));
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<int>? _$2(State<String> state) {
  if (state.pos < state.source.length) {
    final c = state.source.codeUnitAt(state.pos);
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
  if (state.pos < state.source.length) {
    final c = state.source.runeAt(state.pos);
    state.pos += c <= 0xffff ? 1 : 2;
    return Result(c);
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<int>? _Char16bit$0(State<String> state) {
  if (state.pos < state.source.length) {
    final c = state.source.codeUnitAt(state.pos);
    if (c == 48) {
      state.pos++;
      return const Result(48);
    }
    return state.fail(const ErrorExpectedChar(48));
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<int>? _Char32bit$0(State<String> state) {
  if (state.pos < state.source.length) {
    final c = state.source.runeAt(state.pos);
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
  if (state.pos < state.source.length) {
    final c = state.source.codeUnitAt(state.pos);
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
  if (state.pos < state.source.length) {
    final c = state.source.codeUnitAt(state.pos);
    if (c == 49) {
      state.pos++;
      return const Result(49);
    }
    return state.fail(const ErrorExpectedChar(49));
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<int>? _Char$0(State<String> state) {
  if (state.pos < state.source.length) {
    final c = state.source.runeAt(state.pos);
    if (c == 128512) {
      state.pos += c <= 0xffff ? 1 : 2;
      return const Result(128512);
    }
    return state.fail(const ErrorExpectedChar(128512));
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<int>? _$10(State<String> state) {
  if (state.pos < state.source.length) {
    final c = state.source.codeUnitAt(state.pos);
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
  if (state.pos >= state.source.length) {
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
  final failPos = state.failPos;
  final r1 = _$11(state);
  if (r1 != null) {
    return r1;
  }
  if (state.failPos != failPos) {
    return null;
  }
  state.errors = errors;
  return state.fail(const ErrorExpectedTags(['expr']));
}

Result<Object?>? _FastSatisfy16$0(State<String> state) {
  if (state.pos < state.source.length) {
    final c = state.source.codeUnitAt(state.pos);
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
  if (state.pos < state.source.length) {
    final c = state.source.runeAt(state.pos);
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
  final source = state.source;
  final pos = state.pos;
  var count = 0;
  while (count < 2 && state.pos < source.length) {
    final c = source.codeUnitAt(state.pos);
    final ok = c >= 48 && c <= 57;
    if (!ok) {
      break;
    }
    state.pos++;
    count++;
  }
  if (count >= 2) {
    return state.pos != pos
        ? Result(source.substring(pos, state.pos))
        : const Result('');
  }
  final end = state.pos;
  state.pos = pos;
  return end < source.length
      ? state.failAt(end, const ErrorUnexpectedChar())
      : state.failAt(end, const ErrorUnexpectedEof());
}

Result<String>? _ReplaceErrors$0(State<String> state) {
  final errors = state.errors.toList();
  final failPos = state.failPos;
  final r1 = _$25(state);
  if (r1 != null) {
    return r1;
  }
  if (state.failPos == failPos) {
    state.errors = errors;
  } else if (state.failPos > failPos) {
    state.errors = [];
  } else {
    return null;
  }
  final error = ErrorMessage(state.failPos - state.pos, 'error message');
  return state.failAt(state.failPos, error);
}

Result<String>? _$27(State<String> state) {
  const tag = 'n';
  if (state.pos < state.source.length &&
      state.source.codeUnitAt(state.pos) == 110) {
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
  final source = state.source;
  final list = <String>[];
  var str = '';
  while (state.pos < source.length) {
    final pos = state.pos;
    var c = 0;
    while (state.pos < source.length) {
      c = source.runeAt(state.pos);
      final ok = c >= 48 && c <= 57;
      if (!ok) {
        break;
      }
      state.pos += c < 0xffff ? 1 : 2;
    }
    str = state.pos != pos ? source.substring(pos, state.pos) : '';
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
  if (state.pos < state.source.length &&
      state.source.codeUnitAt(state.pos) == 48) {
    state.pos++;
    return const Result(tag);
  }
  return state.fail(const ErrorExpectedTags([tag]));
}

Result<String>? _Taglong$0(State<String> state) {
  const tag = '😀';
  if (state.source.startsWith(tag, state.pos)) {
    state.pos += 2;
    return const Result(tag);
  }
  return state.fail(const ErrorExpectedTags([tag]));
}

Result<String>? _Tags16bit$0(State<String> state) {
  final pos = state.pos;
  final source = state.source;
  if (pos < source.length) {
    final c = source.codeUnitAt(pos);
    if (c == 97) {
      if (source.startsWith('abc', pos)) {
        state.pos += 3;
        return const Result('abc');
      } else if (source.startsWith('ab', pos)) {
        state.pos += 2;
        return const Result('ab');
      } else {
        state.pos += 1;
        return const Result('a');
      }
    } else if (c == 98) {
      if (source.startsWith('bc', pos)) {
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
      if (source.startsWith('😀', pos)) {
        state.pos += 2;
        return const Result('😀');
      }
    }
  }
  return state
      .fail(const ErrorExpectedTags(['a', 'ab', 'abc', 'b', 'bc', 'c', '😀']));
}

Result<String>? _TakeWhileMN03$0(State<String> state) {
  final source = state.source;
  final pos = state.pos;
  var count = 0;
  while (count < 3 && state.pos < source.length) {
    final c = source.runeAt(state.pos);
    final ok = c == 0x1f600;
    if (!ok) {
      break;
    }
    state.pos += c <= 0xffff ? 1 : 2;
    count++;
  }
  return state.pos != pos
      ? Result(source.substring(pos, state.pos))
      : const Result('');
}

Result<String>? _TakeWhileMN12$0(State<String> state) {
  final source = state.source;
  final pos = state.pos;
  var count = 0;
  while (count < 2 && state.pos < source.length) {
    final c = source.runeAt(state.pos);
    final ok = c == 0x1f600;
    if (!ok) {
      break;
    }
    state.pos += c <= 0xffff ? 1 : 2;
    count++;
  }
  if (count >= 1) {
    return state.pos != pos
        ? Result(source.substring(pos, state.pos))
        : const Result('');
  }
  final end = state.pos;
  state.pos = pos;
  return end < source.length
      ? state.failAt(end, const ErrorUnexpectedChar())
      : state.failAt(end, const ErrorUnexpectedEof());
}

Result<String>? _Take16WhileMN03$0(State<String> state) {
  final source = state.source;
  final pos = state.pos;
  var count = 0;
  while (count < 3 && state.pos < source.length) {
    final c = source.codeUnitAt(state.pos);
    final ok = c >= 48 && c <= 57;
    if (!ok) {
      break;
    }
    state.pos++;
    count++;
  }
  return state.pos != pos
      ? Result(source.substring(pos, state.pos))
      : const Result('');
}

Result<String>? _Take16WhileMN12$0(State<String> state) {
  final source = state.source;
  final pos = state.pos;
  var count = 0;
  while (count < 2 && state.pos < source.length) {
    final c = source.codeUnitAt(state.pos);
    final ok = c >= 48 && c <= 57;
    if (!ok) {
      break;
    }
    state.pos++;
    count++;
  }
  if (count >= 1) {
    return state.pos != pos
        ? Result(source.substring(pos, state.pos))
        : const Result('');
  }
  final end = state.pos;
  state.pos = pos;
  return end < source.length
      ? state.failAt(end, const ErrorUnexpectedChar())
      : state.failAt(end, const ErrorUnexpectedEof());
}

Result<String>? _TakeWhile$0(State<String> state) {
  final source = state.source;
  final start = state.pos;
  while (state.pos < source.length) {
    final c = source.runeAt(state.pos);
    final v = c == 0x1f600;
    if (!v) {
      break;
    }
    state.pos += c <= 0xffff ? 1 : 2;
  }
  return state.pos != start
      ? Result(source.substring(start, state.pos))
      : const Result('');
}

Result<String>? _TakeWhile1$0(State<String> state) {
  final source = state.source;
  final start = state.pos;
  while (state.pos < source.length) {
    final c = source.runeAt(state.pos);
    final v = c == 0x1f600;
    if (!v) {
      break;
    }
    state.pos += c <= 0xffff ? 1 : 2;
  }
  if (state.pos != start) {
    return Result(source.substring(start, state.pos));
  }
  if (state.pos != source.length) {
    return state.fail(const ErrorUnexpectedChar());
  }
  return state.fail(const ErrorUnexpectedEof());
}

Result<String>? _Take16While$0(State<String> state) {
  final source = state.source;
  final start = state.pos;
  while (state.pos < source.length) {
    final c = source.runeAt(state.pos);
    final v = c >= 48 && c <= 57;
    if (!v) {
      break;
    }
    state.pos++;
  }
  return state.pos != start
      ? Result(source.substring(start, state.pos))
      : const Result('');
}

Result<String>? _Take16While1$0(State<String> state) {
  final source = state.source;
  final start = state.pos;
  while (state.pos < source.length) {
    final c = source.runeAt(state.pos);
    final v = c >= 48 && c <= 57;
    if (!v) {
      break;
    }
    state.pos += c <= 0xffff ? 1 : 2;
  }
  if (state.pos != start) {
    return Result(source.substring(start, state.pos));
  }
  if (state.pos != source.length) {
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

class ErrorExpectedChar extends ParseError {
  final int char;

  const ErrorExpectedChar(this.char);

  @override
  String getMessage({
    required int offset,
    required Object source,
  }) {
    if (source is String) {
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
    required int offset,
    required Object source,
  }) {
    return 'Expected end of file';
  }
}

class ErrorExpectedTags extends ParseError {
  final List<String> tags;

  const ErrorExpectedTags(this.tags);

  @override
  String getMessage({
    required int offset,
    required Object source,
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
    required int offset,
    required Object source,
  }) {
    return message;
  }
}

class ErrorUnexpectedChar extends ParseError {
  const ErrorUnexpectedChar();

  @override
  String getMessage({
    required int offset,
    required Object source,
  }) {
    if (source is String) {
      final char = source.runeAt(offset);
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
    required int offset,
    required Object source,
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
    required int offset,
    required Object source,
  }) {
    return 'Unexpected input';
  }
}

class ErrorUnknown extends ParseError {
  const ErrorUnknown();

  @override
  String getMessage({
    required int offset,
    required Object source,
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
    required int offset,
    required Object source,
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

  int pos = 0;

  final T source;

  State(this.source);

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
    if (source is String) {
      final s = source as String;
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
