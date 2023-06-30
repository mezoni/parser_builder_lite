import 'package:parser_builder_lite/bytes/switch_tags.dart';
import 'package:parser_builder_lite/bytes/tag.dart';
import 'package:parser_builder_lite/character/satisfy.dart';
import 'package:parser_builder_lite/fast_build.dart';
import 'package:parser_builder_lite/parser_builder.dart';
import 'package:parser_builder_lite/ranges.dart';
import 'package:parser_builder_lite/sequence/delimited.dart';
import 'package:parser_builder_lite/sequence/preceded.dart';
import 'package:parser_builder_lite/sequence/skip.dart';
import 'package:parser_builder_lite/sequence/terminated.dart';
import 'package:parser_builder_lite/sequence/tuple.dart';

Future<void> main(List<String> args) async {
  await fastBuild(
    addErrorMessageCode: false,
    filename: 'test/test_parser.dart',
    footer: __footer,
    header: __header,
    parsers: [
      _delimited,
      _inAlphanumericRange,
      _notInAlphanumericRange,
      _preceded,
      _skip1,
      _skip2,
      _skip3,
      _switchTag,
      _terminated,
      _tuple2,
      _tuple3,
      _tuple4,
      _tuple5,
      _tuple6,
      _tuple7,
    ],
    prefix: '_\$g',
  );
}

const __footer = '''
''';

const __header = '''
''';

const _delimited = Named('delimited', Delimited(Tag('1'), Tag('2'), Tag('3')));

const _inAlphanumericRange = Named(
    'inAlphanumericRange',
    Satisfy(InRangeFunc([
      (0x30, 0x39),
      (0x41, 0x5a),
      (0x61, 0x7a),
    ])));

const _notInAlphanumericRange = Named(
    'notInAlphanumericRange',
    Satisfy(NotInRangeFunc([
      (0x30, 0x39),
      (0x41, 0x5a),
      (0x61, 0x7a),
    ])));

const _preceded = Named('preceded', Preceded(Tag('1'), Tag('2')));

const _skip1 = Named('skip1', Skip([Tag('1')]));

const _skip2 = Named('skip2', Skip([Tag('1'), Tag('2')]));

const _skip3 = Named('skip3', Skip([Tag('1'), Tag('2'), Tag('3')]));

const _switchTag = Named(
    'switchTag ',
    SwitchTags<String>(
      {
        'a': "const Result('a')",
        'ab': "const Result('ab')",
        'abc': "const Result('abc')",
        'b': "const Result('b')",
        'cde': "const Result('cde')",
      },
      "const ErrorMessage(1, 'error')",
    ));

const _terminated = Named('terminated', Terminated(Tag('1'), Tag('2')));

const _tuple2 = Named('tuple2', Tuple2(Tag('1'), Tag('2')));

const _tuple3 = Named('tuple3', Tuple3(Tag('1'), Tag('2'), Tag('3')));

const _tuple4 = Named('tuple4', Tuple4(Tag('1'), Tag('2'), Tag('3'), Tag('4')));

const _tuple5 =
    Named('tuple5', Tuple5(Tag('1'), Tag('2'), Tag('3'), Tag('4'), Tag('5')));

const _tuple6 = Named('tuple6',
    Tuple6(Tag('1'), Tag('2'), Tag('3'), Tag('4'), Tag('5'), Tag('6')));

const _tuple7 = Named(
    'tuple7',
    Tuple7(
        Tag('1'), Tag('2'), Tag('3'), Tag('4'), Tag('5'), Tag('6'), Tag('7')));
