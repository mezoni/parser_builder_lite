import 'dart:async';

import 'package:parser_builder_lite/allocator.dart';
import 'package:parser_builder_lite/expr.dart';
import 'package:parser_builder_lite/fast_build.dart';
import 'package:parser_builder_lite/parser/delimited.dart';
import 'package:parser_builder_lite/parser/eof.dart';
import 'package:parser_builder_lite/parser/mapped.dart';
import 'package:parser_builder_lite/parser/named.dart';
import 'package:parser_builder_lite/parser/preceded.dart';
import 'package:parser_builder_lite/parser/predicate.dart';
import 'package:parser_builder_lite/parser/ref.dart';
import 'package:parser_builder_lite/parser/replace_errors.dart';
import 'package:parser_builder_lite/parser/separated_list.dart';
import 'package:parser_builder_lite/parser/skip16_while.dart';
import 'package:parser_builder_lite/parser/smart_choice.dart';
import 'package:parser_builder_lite/parser/string_chars.dart';
import 'package:parser_builder_lite/parser/switch_tags.dart';
import 'package:parser_builder_lite/parser/tag.dart';
import 'package:parser_builder_lite/parser/take16_while_m_n.dart';
import 'package:parser_builder_lite/parser/terminated.dart';
import 'package:parser_builder_lite/parser/tuple.dart';
import 'package:parser_builder_lite/parser/value.dart';
import 'package:parser_builder_lite/parser_builder.dart';
import 'package:parser_builder_lite/ranges.dart';

import '../tool/build_json_number_parser.dart';

Future<void> main(List<String> args) async {
  await fastBuild(
    context: BuildContext(
      allocator: Allocator('_p'),
      output: StringBuffer(),
    ),
    filename: 'example/json_parser.dart',
    footer: __footer,
    header: __header,
    parsers: [json, _value_],
  );
}

const json = Named('json', Delimited(_ws, _value_, Eof()));

const __footer = '''
@pragma('vm:prefer-inline')
int _toHexValue(String s) {
  var r = 0;
  for (var i = s.length - 1, j = 0; i >= 0; i--, j += 4) {
    final c = s.codeUnitAt(i);
    final int v;
    if (c >= 0x30 && c <= 0x39) {
      v = c - 0x30;
    } else if (c >= 0x41 && c <= 0x46) {
      v = c - 0x41 + 10;
    } else if (c >= 0x61 && c <= 0x66) {
      v = c - 0x61 + 10;
    } else {
      throw StateError('Internal error');
    }

    r += v * (1 << j);
  }

  return r;
}''';

const __header = r'''
void main() {
  final r = parse( '{"rocket": "🚀 flies to the stars"}');
  print(r);
}

Object? parse(String input) {
  final state = State(input);
  final result = json(state);
  if (result == null) {
    final message = _errorMessage(input, state.failPos, state.errors);
    throw message;
  }
  return result.value;
}
''';

const _array = Named('_array', Delimited(_openBracket, _values, _closeBracket));

const _closeBrace = Named('_closeBrace', Terminated(Tag('}'), _ws));

const _closeBracket = Named('_closeBracket', Terminated(Tag(']'), _ws));

const _comma = Named('_comma', Terminated(Tag(','), _ws));

const _doubleQuote = Named('_doubleQuote', Terminated(Tag('"'), _ws));

const _escapeChar = Named(
    '_escapeChar',
    SwitchTags<String>({
      '"': "const Result('\"')",
      '/': "const Result('/')",
      '\\': r"const Result('\\')",
      'b': r"const Result('\b')",
      'f': r"const Result('\f')",
      'n': r"const Result('\n')",
      'r': r"const Result('\r')",
      't': r"const Result('\t')",
    }, [
      r'''const ErrorExpectedTags(['"', '/', '\\', 'b', 'f', 'n', 'r', 't'])'''
    ]));

const _escapeHex = Named('_escapeHex', Preceded(Tag('u'), _hexValueChecked));

const _false = Named<String, bool>(
    '_false', Value('false', Terminated(Tag('false'), _ws)));

const _hexValue = Named(
    '_hexValue',
    Mapped(Take16WhileMN(4, 4, isHexDigit),
        Expr<String>('String.fromCharCode(_toHexValue({{0}}))')));

const _hexValueChecked = Named(
    '_hexValueChecked',
    ReplaceErrors(
      _hexValue,
      Expr<Object?>(
          '''[ErrorMessage({{1}} - {{0}}, 'Expected 4 digit hexadecimal number')]'''),
    ));

const _keyValue = Named(
    '_keyValue',
    Mapped(
      Tuple3(_string, _semicolon, _value),
      Expr<MapEntry<String, Object?>>(r'MapEntry({{0}}.$1, {{0}}.$3)'),
    ));

const _keyValues = Named('_keyValues', SeparatedList(_keyValue, _comma));

const _normalChars = Expr<bool>(
    '{{0}} <= 91 ? {{0}} <= 33 ? {{0}} >= 32 : {{0}} >= 35 : {{0}} <= 1114111 && {{0}} >= 93');

const _null = Named(
    '_null', Value<String, Object?>('null', Terminated(Tag('null'), _ws)));

const _number = Named('_number', Terminated(Number(), _ws));

const _object = Named(
    '_object',
    Mapped(
      Tuple3(
        _openBrace,
        _keyValues,
        _closeBrace,
      ),
      Expr<Map<String, Object?>>(r'Map.fromEntries({{0}}.$2)'),
    ));

const _openBrace = Named('_openBrace', Terminated(Tag('{'), _ws));

const _openBracket = Named('_openBracket', Terminated(Tag('['), _ws));

const _semicolon = Named('_semicolon', Terminated(Tag(':'), _ws));

const _string =
    Named('_string', Delimited(Tag('"'), _stringChars, _doubleQuote));

const _stringChars = Named(
    '_stringChars',
    StringChars(
      _normalChars,
      0x5c,
      SmartChoice([_escapeChar, _escapeHex]),
    ));

const _true =
    Named<String, bool>('_true', Value('true', Terminated(Tag('true'), _ws)));

const _value = Ref<String, Object?>('_value');

const _value_ = Named(
  '_value',
  SmartChoice([
    _object,
    _string,
    _array,
    _null,
    _false,
    _true,
    _number,
  ]),
);

const _values = Named('_values', SeparatedList(_value, _comma));

const _ws = Named('_ws', Skip16While(InRange(['\t', '\r', '\n', ' '])));
