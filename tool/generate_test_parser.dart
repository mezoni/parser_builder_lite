import 'package:parser_builder_lite/character/satisfy.dart';
import 'package:parser_builder_lite/fast_build.dart';
import 'package:parser_builder_lite/parser_builder.dart';
import 'package:parser_builder_lite/ranges.dart';

Future<void> main(List<String> args) async {
  await fastBuild(
    filename: 'test/test_parser.dart',
    footer: __footer,
    header: __header,
    parsers: [
      _inAlphanumericRange,
    ],
    prefix: '_\$g',
  );
}

const __footer = '''
''';

const __header = '''
''';

const _inAlphanumericRange = Named(
    'inAlphanumericRange',
    Satisfy(InRangeFunc([
      (0x30, 0x39),
      (0x41, 0x5a),
      (0x61, 0x7a),
    ])));
