import 'package:parser_builder_lite/allocator.dart';
import 'package:parser_builder_lite/fast_build.dart';
import 'package:parser_builder_lite/parser/char.dart';
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

import 'package:test/test.dart' hide escape;
''';

const _prefix = '';

Future<void> _generate() async {
  final context = BuildContext(
    allocator: Allocator('_'),
    output: StringBuffer(),
  );
  final tester = ParserTester<String>(
    context: context,
    localOutput: StringBuffer(),
  );
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
      source: '1112',
      result: [0x31, 0x31, 0x31],
      pos: 3,
    );
    t1.testSuccess(
      source: '',
      result: [],
      pos: 0,
    );
    t1.testSuccess(
      source: '2',
      result: [],
      pos: 0,
    );
    return buffer.toString();
  });

  await fastBuild(
    context: context,
    parsers: [...tester.parsers],
    filename: 'example/simple_test.dart',
    addErrorMessageCode: false,
    footer: _footer,
    header: _header + tester.generate(),
  );
}
