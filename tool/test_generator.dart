import 'package:parser_builder_lite/allocator.dart';
import 'package:parser_builder_lite/expr.dart';
import 'package:parser_builder_lite/fast_build.dart';
import 'package:parser_builder_lite/parser/and.dart';
import 'package:parser_builder_lite/parser/any_char.dart';
import 'package:parser_builder_lite/parser/char.dart';
import 'package:parser_builder_lite/parser/choice.dart';
import 'package:parser_builder_lite/parser/delimited.dart';
import 'package:parser_builder_lite/parser/eof.dart';
import 'package:parser_builder_lite/parser/expected.dart';
import 'package:parser_builder_lite/parser/fast_satisfy.dart';
import 'package:parser_builder_lite/parser/fast_satisfy16.dart';
import 'package:parser_builder_lite/parser/many.dart';
import 'package:parser_builder_lite/parser/many1.dart';
import 'package:parser_builder_lite/parser/many1_count.dart';
import 'package:parser_builder_lite/parser/many_count.dart';
import 'package:parser_builder_lite/parser/many_m_n.dart';
import 'package:parser_builder_lite/parser/not.dart';
import 'package:parser_builder_lite/parser/preceded.dart';
import 'package:parser_builder_lite/parser/predicate.dart';
import 'package:parser_builder_lite/parser/replace_errors.dart';
import 'package:parser_builder_lite/parser/string_chars.dart';
import 'package:parser_builder_lite/parser/tag.dart';
import 'package:parser_builder_lite/parser/tags.dart';
import 'package:parser_builder_lite/parser/take16_while.dart';
import 'package:parser_builder_lite/parser/take16_while1.dart';
import 'package:parser_builder_lite/parser/take16_while_m_n.dart';
import 'package:parser_builder_lite/parser/take_while.dart';
import 'package:parser_builder_lite/parser/take_while1.dart';
import 'package:parser_builder_lite/parser/take_while_m_n.dart';
import 'package:parser_builder_lite/parser/terminated.dart';
import 'package:parser_builder_lite/parser/tuple.dart';
import 'package:parser_builder_lite/parser/unterminated.dart';
import 'package:parser_builder_lite/parser/value.dart';
import 'package:parser_builder_lite/parser_builder.dart';
import 'package:parser_builder_lite/parser_tester.dart';

void main(List<String> args) async {
  await _generate();
}

const _footer = '''
''';

const _header = '''
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: inference_failure_on_collection_literal
// ignore_for_file: unnecessary_cast

import 'package:test/test.dart' hide escape;
''';

const _prefix = '\$';

const _rune = '😀';

const _runeCode = 0x1f600;

Future<void> _generate() async {
  final context = BuildContext(
    allocator: Allocator('_'),
    output: StringBuffer(),
  );
  final tester = ParserTester<String>(
    context: context,
    localOutput: StringBuffer(),
  );
  tester.addTest('And', const Terminated(Char(0x30), And(Char(0x31))),
      (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '01',
      result: 0x30,
      pos: 1,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    t1.testFailure(
      input: '1',
      failPos: 0,
      pos: 0,
      errors: [errorExpectedChar],
    );
    t1.testFailure(
      input: '0',
      failPos: 1,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    return buffer.toString();
  });

  tester.addTest('And', const AnyChar(), (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '01',
      result: 0x30,
      pos: 1,
    );
    t1.testSuccess(
      input: _rune,
      result: _runeCode,
      pos: 2,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    return buffer.toString();
  });

  tester.addTest('Char (16-bit)', const Char(0x30), (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '01',
      result: 0x30,
      pos: 1,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    t1.testFailure(
      input: _rune,
      failPos: 0,
      pos: 0,
      errors: [errorExpectedChar],
    );
    return buffer.toString();
  });

  tester.addTest('Char (32-bit)', const Char(_runeCode), (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: _rune,
      result: _runeCode,
      pos: 2,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    t1.testFailure(
      input: '01',
      failPos: 0,
      pos: 0,
      errors: [errorExpectedChar],
    );
    return buffer.toString();
  });

  tester.addTest('Choice (2 variants)', const Choice([Char(0x30), Char(0x31)]),
      (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '01',
      result: 0x30,
      pos: 1,
    );
    t1.testSuccess(
      input: '12',
      result: 0x31,
      pos: 1,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedEof, errorUnexpectedEof],
    );
    t1.testFailure(
      input: '2',
      failPos: 0,
      pos: 0,
      errors: [errorExpectedChar, errorExpectedChar],
    );
    return buffer.toString();
  });

  tester.addTest(
      'Choice (3 variants)', const Choice([Char(0x30), Char(0x31), Char(0x32)]),
      (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '01',
      result: 0x30,
      pos: 1,
    );
    t1.testSuccess(
      input: '12',
      result: 0x31,
      pos: 1,
    );
    t1.testSuccess(
      input: '23',
      result: 0x32,
      pos: 1,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedEof, errorUnexpectedEof, errorUnexpectedEof],
    );
    t1.testFailure(
      input: '3',
      failPos: 0,
      pos: 0,
      errors: [errorExpectedChar, errorExpectedChar, errorExpectedChar],
    );
    return buffer.toString();
  });

  tester.addTest('Char16', const Char(0x31), (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '12',
      result: 0x31,
      pos: 1,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    t1.testFailure(
      input: '2',
      failPos: 0,
      pos: 0,
      errors: [errorExpectedChar],
    );
    return buffer.toString();
  });

  tester.addTest('Char', const Char(_runeCode), (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '$_rune`',
      result: _runeCode,
      pos: 2,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    t1.testFailure(
      input: '2',
      failPos: 0,
      pos: 0,
      errors: [errorExpectedChar],
    );
    return buffer.toString();
  });

  tester
      .addTest('Delimited', const Delimited(Char(0x31), Char(0x32), Char(0x33)),
          (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '123',
      result: 0x32,
      pos: 3,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    t1.testFailure(
      input: '1',
      failPos: 1,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    t1.testFailure(
      input: '12',
      failPos: 2,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    t1.testFailure(
      input: '2',
      failPos: 0,
      pos: 0,
      errors: [errorExpectedChar],
    );
    return buffer.toString();
  });

  tester.addTest('Eof', const Eof(), (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '',
      result: null,
      pos: 0,
    );
    t1.testFailure(
      input: '1',
      failPos: 0,
      pos: 0,
      errors: [errorExpectedEof],
    );
    return buffer.toString();
  });

  tester.addTest(
      'Expected', const Expected('expr', Tuple2(Char(0x31), Char(0x32))),
      (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '123',
      resultTests: [
        (
          actual: Expr('{{0}}'),
          expected: Expr('(0x31, 0x32)'),
          reason: 'result',
        ),
      ],
      pos: 2,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorExpectedTags],
      errorTests: [
        (
          actual: Expr('({{0}}[0] as $errorExpectedTags).tags[0]'),
          expected: Expr("'expr'"),
          reason: '$errorExpectedTags).tags',
        )
      ],
    );
    t1.testFailure(
      input: '1',
      failPos: 1,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    return buffer.toString();
  });

  tester.addTest('FastSatisfy16', const FastSatisfy16(isDigit),
      (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '1',
      resultTests: [
        (
          actual: Expr('{{0}}'),
          expected: Expr('null'),
          reason: 'result',
        )
      ],
      pos: 1,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    t1.testFailure(
      input: 'a',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedChar],
    );
    return buffer.toString();
  });

  tester
      .addTest('FastSatisfy16', const FastSatisfy(Expr('{{0}} == $_runeCode')),
          (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: _rune,
      resultTests: [
        (
          actual: Expr('{{0}}'),
          expected: Expr('null'),
          reason: 'result',
        )
      ],
      pos: 2,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    t1.testFailure(
      input: 'a',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedChar],
    );
    return buffer.toString();
  });

  /*

  g.addTest(
      'FoldMany0',
      const FoldMany0(
        Map1(Satisfy16(Expr('{{0}} >= 0x30 && {{0}} <= 0x39')),
            Expr<int>('{{0}} - 0x30')),
        Expr<int>('0'),
        Expr<int>('{{0}} + {{1}}'),
      ), (parserName,  parser) {
    final  buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix), context: context,
      
      output: buffer,
      parser: parser, parserName: parserName,
    );
    t1.testSuccess(
      input: '123',
      result: 6,
      pos: 3,
    );
    t1.testSuccess(
      input: '',
      result: 0,
      pos: 0,
    );
    t1.testSuccess(
      input: '2',
      result: 2,
      pos: 1,
    );
    return buffer.toString();
  });

  */

  tester.addTest('Many', const Many(Char(0x31)), (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '1112',
      result: [0x31, 0x31, 0x31],
      pos: 3,
    );
    t1.testSuccess(
      input: '',
      result: [],
      pos: 0,
    );
    t1.testSuccess(
      input: '2',
      result: [],
      pos: 0,
    );
    return buffer.toString();
  });

  tester.addTest('Many1', const Many1(Char(0x31)), (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '1112',
      result: [0x31, 0x31, 0x31],
      pos: 3,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    t1.testFailure(
      input: '2',
      failPos: 0,
      pos: 0,
      errors: [errorExpectedChar],
    );

    return buffer.toString();
  });

  tester.addTest('ManyCount', const ManyCount(Char(0x31)),
      (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '1112',
      result: 3,
      pos: 3,
    );
    t1.testSuccess(
      input: '',
      result: 0,
      pos: 0,
    );
    t1.testSuccess(
      input: '2',
      result: 0,
      pos: 0,
    );
    return buffer.toString();
  });

  tester.addTest('Many1Count', const Many1Count(Char(0x31)),
      (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '1112',
      result: 3,
      pos: 3,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    t1.testFailure(
      input: '2',
      failPos: 0,
      pos: 0,
      errors: [errorExpectedChar],
    );
    return buffer.toString();
  });

  tester.addTest('ManyMN (0..3)', const ManyMN(0, 3, Char(0x31)),
      (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '12',
      result: [0x31],
      pos: 1,
    );
    t1.testSuccess(
      input: '112',
      result: [0x31, 0x31],
      pos: 2,
    );
    t1.testSuccess(
      input: '11112',
      result: [0x31, 0x31, 0x31],
      pos: 3,
    );
    t1.testSuccess(
      input: '2',
      result: [],
      pos: 0,
    );
    t1.testSuccess(
      input: '',
      result: [],
      pos: 0,
    );
    return buffer.toString();
  });

  tester.addTest('ManyMN (2..3)', const ManyMN(2, 3, Char(0x31)),
      (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '112',
      result: [0x31, 0x31],
      pos: 2,
    );
    t1.testSuccess(
      input: '11112',
      result: [0x31, 0x31, 0x31],
      pos: 3,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    t1.testFailure(
      input: '1',
      failPos: 1,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    t1.testFailure(
      input: '2',
      failPos: 0,
      pos: 0,
      errors: [errorExpectedChar],
    );
    return buffer.toString();
  });

  /*
    
  g.addTest('Many0Till', const Many0Till(Char(0x31), Char(0x32)),
      (parserName,  parser) {
    final  buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix), context: context,
      
      output: buffer,
      parser: parser, parserName: parserName,
    );
    t1.testSuccess(
      input: '112',
      resultTests: [
        ('{{0}}', 'isA<(List<int>, int)>()'),
        (r'_as<(List<int>, int)>({{0}}).$1', 'equals([0x31, 0x31])'),
        (r'_as<(List<int>, int)>({{0}}).$2', 'equals(0x32)'),
      ],
      pos: 3,
    );
    t1.testSuccess(
      input: '12',
      resultTests: [
        ('{{0}}', 'isA<(List<int>, int)>()'),
        (r'_as<(List<int>, int)>({{0}}).$1', 'equals([0x31])'),
        (r'_as<(List<int>, int)>({{0}}).$2', 'equals(0x32)'),
      ],
      pos: 2,
    );
    t1.testSuccess(
      input: '2',
      resultTests: [
        ('{{0}}', 'isA<(List<int>, int)>()'),
        (r'_as<(List<int>, int)>({{0}}).$1', 'equals([])'),
        (r'_as<(List<int>, int)>({{0}}).$2', 'equals(0x32)'),
      ],
      pos: 1,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [_errorUnexpectedEof],
    );
    t1.testFailure(
      input: '1',
      failPos: 1,
      pos: 0,
      errors: [_errorUnexpectedEof],
    );
    t1.testFailure(
      input: '11',
      failPos: 2,
      pos: 0,
      errors: [_errorUnexpectedEof],
    );
    t1.testFailure(
      input: '2',
      failPos: 0,
      pos: 0,
      errors: [_errorExpectedChar],
    );
    return buffer.toString();
  });

  */

  tester.addTest('Not', const Terminated(Char(0x30), Not(Char(0x31))),
      (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '02',
      result: 0x30,
      pos: 1,
    );
    t1.testSuccess(
      input: '0',
      result: 0x30,
      pos: 1,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    t1.testFailure(
      input: '1',
      failPos: 0,
      pos: 0,
      errors: [errorExpectedChar],
    );
    t1.testFailure(input: '01', failPos: 1, pos: 0, errors: [
      errorUnexpectedInput
    ], errorTests: [
      (
        actual: Expr('({{0}}[0] as $errorUnexpectedInput).length'),
        expected: Expr('1'),
        reason: '$errorUnexpectedInput.length',
      ),
    ]);

    return buffer.toString();
  });

  tester.addTest('Preceded', const Preceded(Char(0x31), Char(0x32)),
      (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '123',
      result: 0x32,
      pos: 2,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    t1.testFailure(
      input: '1',
      failPos: 1,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    t1.testFailure(
      input: '2',
      failPos: 0,
      pos: 0,
      errors: [errorExpectedChar],
    );
    return buffer.toString();
  });

  tester.addTest(
      'ReplaceErrors',
      const ReplaceErrors(Take16WhileMN(2, 2, isDigit),
          Expr("$errorMessage({{1}} - {{0}}, 'error message')")),
      (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '12a',
      result: '12',
      pos: 2,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorMessage],
      errorTests: [
        (
          actual: Expr('({{0}}[0] as $errorMessage).message'),
          expected: Expr("'error message'"),
          reason: 'error.message',
        ),
        (
          actual: Expr('({{0}}[0] as $errorMessage).length'),
          expected: Expr('0'),
          reason: '$errorMessage.length',
        ),
      ],
    );
    t1.testFailure(
      input: '1',
      failPos: 1,
      pos: 0,
      errors: [errorMessage],
      errorTests: [
        (
          actual: Expr('({{0}}[0] as $errorMessage).message'),
          expected: Expr("'error message'"),
          reason: '$errorMessage.message',
        ),
        (
          actual: Expr('({{0}}[0] as $errorMessage).length'),
          expected: Expr('1'),
          reason: '$errorMessage.length',
        ),
      ],
    );
    t1.testFailure(
      input: 'a',
      failPos: 0,
      pos: 0,
      errors: [errorMessage],
      errorTests: [
        (
          actual: Expr('({{0}}[0] as $errorMessage).message'),
          expected: Expr("'error message'"),
          reason: '$errorMessage.message',
        ),
        (
          actual: Expr('({{0}}[0] as $errorMessage).length'),
          expected: Expr('0'),
          reason: '$errorMessage.length',
        ),
      ],
    );
    return buffer.toString();
  });

  tester.addTest(
      'StringChars', const StringChars(isDigit, 0x5c, Value(r"'\n'", Tag('n'))),
      (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '12',
      result: '12',
      pos: 2,
    );
    t1.testSuccess(
      input: r'\n1',
      result: '\n1',
      pos: 3,
    );
    t1.testSuccess(
      input: r'1\n2',
      result: '1\n2',
      pos: 4,
    );
    t1.testSuccess(
      input: r'\n\n1',
      result: '\n\n1',
      pos: 5,
    );
    t1.testSuccess(
      input: '',
      result: '',
      pos: 0,
    );
    return buffer.toString();
  });

  tester.addTest('Tag (short)', const Tag('0'), (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '01',
      result: '0',
      pos: 1,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorExpectedTags],
    );
    t1.testFailure(
      input: '2',
      failPos: 0,
      pos: 0,
      errors: [errorExpectedTags],
    );

    return buffer.toString();
  });

  tester.addTest('Tag (long)', const Tag(_rune), (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '${_rune}1',
      result: _rune,
      pos: 2,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorExpectedTags],
    );
    t1.testFailure(
      input: '2',
      failPos: 0,
      pos: 0,
      errors: [errorExpectedTags],
    );

    return buffer.toString();
  });

  tester.addTest(
      'Tags (16-bit)', const Tags(['a', 'ab', 'abc', 'b', 'bc', 'c', _rune]),
      (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: 'abcd',
      result: 'abc',
      pos: 3,
    );
    t1.testSuccess(
      input: 'abd',
      result: 'ab',
      pos: 2,
    );
    t1.testSuccess(
      input: 'ad',
      result: 'a',
      pos: 1,
    );
    t1.testSuccess(
      input: 'bcd',
      result: 'bc',
      pos: 2,
    );
    t1.testSuccess(
      input: 'bd',
      result: 'b',
      pos: 1,
    );
    t1.testSuccess(
      input: 'cd',
      result: 'c',
      pos: 1,
    );
    t1.testSuccess(
      input: _rune,
      result: _rune,
      pos: 2,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorExpectedTags],
    );
    t1.testFailure(
      input: 'x',
      failPos: 0,
      pos: 0,
      errors: [errorExpectedTags],
    );

    return buffer.toString();
  });

  tester.addTest(
      'TakeWhileMN (0..3)', const TakeWhileMN(0, 3, Expr('{{0}} == 0x1f600')),
      (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: String.fromCharCodes([0x1f600, 0x1f600, 0x1f600, 0x1f600]),
      result: String.fromCharCodes([0x1f600, 0x1f600, 0x1f600]),
      pos: 6,
    );
    t1.testSuccess(
      input: String.fromCharCodes([0x1f600, 0x1f600]),
      result: String.fromCharCodes([0x1f600, 0x1f600]),
      pos: 4,
    );
    t1.testSuccess(
      input: String.fromCharCodes([0x1f600]),
      result: String.fromCharCodes([0x1f600]),
      pos: 2,
    );
    t1.testSuccess(
      input: '',
      result: '',
      pos: 0,
    );
    t1.testSuccess(
      input: 'a',
      result: '',
      pos: 0,
    );
    return buffer.toString();
  });

  tester.addTest(
      'TakeWhileMN (1..2)', const TakeWhileMN(1, 2, Expr('{{0}} == 0x1f600')),
      (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: String.fromCharCodes([0x1f600, 0x1f600, 0x1f600, 0x1f600]),
      result: String.fromCharCodes([0x1f600, 0x1f600]),
      pos: 4,
    );
    t1.testSuccess(
      input: String.fromCharCodes([0x1f600]),
      result: String.fromCharCodes([0x1f600]),
      pos: 2,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedEof],
    );

    t1.testFailure(
      input: '1',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedChar],
    );

    return buffer.toString();
  });

  tester.addTest('Take16WhileMN (0..3)', const Take16WhileMN(0, 3, isDigit),
      (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '12345',
      result: '123',
      pos: 3,
    );
    t1.testSuccess(
      input: '12',
      result: '12',
      pos: 2,
    );
    t1.testSuccess(
      input: '1',
      result: '1',
      pos: 1,
    );
    t1.testSuccess(
      input: '',
      result: '',
      pos: 0,
    );
    t1.testSuccess(
      input: 'a',
      result: '',
      pos: 0,
    );
    return buffer.toString();
  });

  tester.addTest('Take16WhileMN (1..2)', const Take16WhileMN(1, 2, isDigit),
      (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '123',
      result: '12',
      pos: 2,
    );
    t1.testSuccess(
      input: '1a',
      result: '1',
      pos: 1,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedEof],
    );

    t1.testFailure(
      input: 'a',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedChar],
    );

    return buffer.toString();
  });

  tester.addTest('TakeWhile', const TakeWhile(Expr('{{0}} == 0x1f600')),
      (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: String.fromCharCodes([0x1f600]),
      result: String.fromCharCodes([0x1f600]),
      pos: 2,
    );
    t1.testSuccess(
      input: String.fromCharCodes([0x1f600, 0x1f600]),
      result: String.fromCharCodes([0x1f600, 0x1f600]),
      pos: 4,
    );
    t1.testSuccess(
      input: '',
      result: '',
      pos: 0,
    );
    t1.testSuccess(
      input: 'a',
      result: '',
      pos: 0,
    );
    return buffer.toString();
  });

  tester.addTest('TakeWhile1', const TakeWhile1(Expr('{{0}} == 0x1f600')),
      (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: String.fromCharCodes([0x1f600]),
      result: String.fromCharCodes([0x1f600]),
      pos: 2,
    );
    t1.testSuccess(
      input: String.fromCharCodes([0x1f600, 0x1f600]),
      result: String.fromCharCodes([0x1f600, 0x1f600]),
      pos: 4,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    t1.testFailure(
      input: 'a',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedChar],
    );
    return buffer.toString();
  });

  tester.addTest('Take16While', const Take16While(isDigit),
      (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '1a',
      result: '1',
      pos: 1,
    );
    t1.testSuccess(
      input: '12a',
      result: '12',
      pos: 2,
    );
    t1.testSuccess(
      input: '',
      result: '',
      pos: 0,
    );
    t1.testSuccess(
      input: 'a',
      result: '',
      pos: 0,
    );
    return buffer.toString();
  });

  tester.addTest('Take16While1', const Take16While1(isDigit),
      (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '1a',
      result: '1',
      pos: 1,
    );
    t1.testSuccess(
      input: '12a',
      result: '12',
      pos: 2,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    t1.testFailure(
      input: 'a',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedChar],
    );
    return buffer.toString();
  });

  tester.addTest('Terminated', const Terminated(Char(0x31), Char(0x32)),
      (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '123',
      result: 0x31,
      pos: 2,
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    t1.testFailure(
      input: '1',
      failPos: 1,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    t1.testFailure(
      input: '2',
      failPos: 0,
      pos: 0,
      errors: [errorExpectedChar],
    );
    return buffer.toString();
  });

  tester.addTest(
      'Unterminated',
      const Unterminated(
        Tag('"'),
        TakeWhile(isDigit),
        Tag('"'),
        Expr("ErrorMessage({{0}} - {{1}}, 'unterminated')"),
      ), (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      input: '"123"',
      pos: 5,
      resultTests: [
        (
          actual: Expr(r'{{0}}.$2'),
          expected: Expr("'123'"),
          reason: 'result',
        ),
      ],
    );
    t1.testFailure(
      input: '',
      failPos: 0,
      pos: 0,
      errors: [errorExpectedTags],
    );
    t1.testFailure(input: '"123', failPos: 4, pos: 0, errors: [
      errorExpectedTags,
      errorMessage
    ], errorTests: [
      (
        actual: Expr('({{0}}[1] as $errorMessage).message'),
        expected: Expr("'unterminated'"),
        reason: '$errorMessage.message',
      ),
      (
        actual: Expr('({{0}}[1] as $errorMessage).length'),
        expected: Expr('-4'),
        reason: '$errorMessage.length',
      ),
    ]);
    return buffer.toString();
  });

  await fastBuild(
    context: context,
    parsers: tester.parsers,
    filename: 'test/test.dart',
    addErrorMessageCode: false,
    footer: _footer,
    header: _header + tester.generate(),
  );
}
