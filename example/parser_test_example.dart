import 'package:parser_builder_lite/allocator.dart';
import 'package:parser_builder_lite/fast_build.dart';
import 'package:parser_builder_lite/parser/char.dart';
import 'package:parser_builder_lite/parser/many.dart';
import 'package:parser_builder_lite/parser/preceded.dart';
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

const _prefix = '';

Future<void> _generate() async {
  final context = BuildContext(
    globalAllocator: Allocator('_'),
    globalOutput: StringBuffer(),
    localAllocator: Allocator(''),
  );
  final tester = ParserTester<String>(
    context: context,
    localOutput: StringBuffer(),
  );
  tester.addTest('Many', const Many(Char(0x31)), (
    parserName,
    parserNameNoResult,
    parser,
    parserNoResult,
  ) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserNameNoResult: parserNameNoResult,
      parserName: parserName,
      parserNoResult: parserNoResult,
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

  tester.addTest('Preceded', const Preceded(Char(0x31), Char(0x32)), (
    parserName,
    parserNameNoResult,
    parser,
    parserNoResult,
  ) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserNameNoResult: parserNameNoResult,
      parserName: parserName,
      parserNoResult: parserNoResult,
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
      errors: [errorExpectedChar],
    );
    t1.testFailure(
      input: '1',
      failPos: 1,
      pos: 0,
      errors: [errorExpectedChar],
    );
    t1.testFailure(
      input: '2',
      failPos: 0,
      pos: 0,
      errors: [errorExpectedChar],
    );
    return buffer.toString();
  });

  await fastBuild(
    context: context,
    parsers: [...tester.parsers],
    filename: 'example/parser_test.dart',
    footer: _footer,
    header: _header + tester.generate(),
  );
}
