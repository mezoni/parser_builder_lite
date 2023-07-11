import 'dart:typed_data';

import 'package:parser_builder_lite/allocator.dart';
import 'package:parser_builder_lite/expr.dart';
import 'package:parser_builder_lite/fast_build.dart';
import 'package:parser_builder_lite/parser/uint_be.dart';
import 'package:parser_builder_lite/parser/many.dart';
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
import 'dart:typed_data';

import 'package:test/test.dart' hide escape;
''';

const _prefix = '';

Future<void> _generate() async {
  final context = BuildContext(
    allocator: Allocator('_'),
    output: StringBuffer(),
  );
  final tester = ParserTester<ByteData>(
    context: context,
    localOutput: StringBuffer(),
  );
  tester.addTest('Many', const Many(UintBE(16, 1)), (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      inputAsCode: (input) =>
          'Uint8List.fromList([${List.generate(input.lengthInBytes, input.getUint8).join(', ')}]).buffer.asByteData()',
      inputAsString: (input) =>
          '[${List.generate(input.lengthInBytes, input.getUint8).join(', ')}',
      output: buffer,
      parser: parser,
      parserName: parserName,
    );

    t1.testSuccess(
      input: Uint8List.fromList([0, 1, 0, 1, 0, 2]).buffer.asByteData(),
      result: [1, 1],
      pos: 4,
    );
    t1.testSuccess(
      input: Uint8List.fromList([]).buffer.asByteData(),
      result: [],
      pos: 0,
    );
    t1.testSuccess(
      input: Uint16List.fromList([0, 2, 0, 1]).buffer.asByteData(),
      result: [],
      pos: 0,
    );
    return buffer.toString();
  });

  tester.addTest('UintBE', const UintBE(16, 0x30), (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      inputAsCode: (input) =>
          'Uint8List.fromList([${List.generate(input.lengthInBytes, input.getUint8).join(', ')}]).buffer.asByteData()',
      inputAsString: (input) =>
          '[${List.generate(input.lengthInBytes, input.getUint8).join(', ')}',
      output: buffer,
      parser: parser,
      parserName: parserName,
    );

    t1.testSuccess(
      input: Uint8List.fromList([0, 0x30, 0, 0x30]).buffer.asByteData(),
      result: 0x30,
      pos: 2,
    );
    t1.testFailure(
      input: Uint8List.fromList([]).buffer.asByteData(),
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    t1.testFailure(
        input: Uint8List.fromList([0, 0x31]).buffer.asByteData(),
        failPos: 0,
        pos: 0,
        errors: [
          errorExpectedInt
        ],
        errorTests: [
          (
            actual: Expr('({{0}}[0] as $errorExpectedInt).value'),
            expected: Expr('0x30'),
            reason: '$errorExpectedInt.value',
          )
        ]);
    return buffer.toString();
  });

  await fastBuild(
    context: context,
    parsers: [...tester.parsers],
    filename: 'example/binary_parser_test.dart',
    addErrorMessageCode: false,
    footer: _footer,
    header: _header + tester.generate(),
  );
}
