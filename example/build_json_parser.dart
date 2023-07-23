import 'dart:async';

import 'package:parser_builder_lite/allocator.dart';
import 'package:parser_builder_lite/expr.dart';
import 'package:parser_builder_lite/fast_build.dart';
import 'package:parser_builder_lite/parser/choice.dart';
import 'package:parser_builder_lite/parser/delimited.dart';
import 'package:parser_builder_lite/parser/eof.dart';
import 'package:parser_builder_lite/parser/mapped.dart';
import 'package:parser_builder_lite/parser/marked.dart';
import 'package:parser_builder_lite/parser/named.dart';
import 'package:parser_builder_lite/parser/preceded.dart';
import 'package:parser_builder_lite/parser/predicate.dart';
import 'package:parser_builder_lite/parser/ref.dart';
import 'package:parser_builder_lite/parser/replace_errors.dart';
import 'package:parser_builder_lite/parser/separated_list.dart';
import 'package:parser_builder_lite/parser/skip_while.dart';
import 'package:parser_builder_lite/parser/smart_choice.dart';
import 'package:parser_builder_lite/parser/string_chars.dart';
import 'package:parser_builder_lite/parser/switch_tags.dart';
import 'package:parser_builder_lite/parser/tag.dart';
import 'package:parser_builder_lite/parser/take_while_m_n.dart';
import 'package:parser_builder_lite/parser/terminated.dart';
import 'package:parser_builder_lite/parser/tuple.dart';
import 'package:parser_builder_lite/parser/value.dart';
import 'package:parser_builder_lite/parser_builder.dart';
import 'package:parser_builder_lite/ranges.dart';

import '../tool/build_test_json_number_parser.dart';

Future<void> main(List<String> args) async {
  await fastBuild(
    context: BuildContext(
      globalAllocator: Allocator('_p'),
      globalOutput: StringBuffer(),
      localAllocator: Allocator(''),
    ),
    filename: 'example/json_parser.dart',
    footer: __footer,
    header: __header,
    parsers: [parser, _value_],
  );
}

const parser = Named('parser', Delimited(_ws, _value_, Eof()));

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
  final result = parser(state);
  if (!state.ok) {
    final message = _errorMessage(input, state.failPos, state.getErrors());
    throw message;
  }
  return result;
}
''';

const _array = Named('_array', Delimited(_openBracket, _values, Tag(']')));

const _colon = Marked('_colon', Terminated(Tag(':'), _ws));

const _comma = Marked('_comma', Terminated(Tag(','), _ws));

const _escapeChar = Named(
    '_escapeChar',
    SwitchTags<String>({
      '"': "'\"'",
      '/': "'/'",
      '\\': r"'\\'",
      'b': r"'\b'",
      'f': r"'\f'",
      'n': r"'\n'",
      'r': r"'\r'",
      't': r"'\t'",
    }, [
      r'''const ErrorExpectedTags(['"', '/', '\\', 'b', 'f', 'n', 'r', 't'])'''
    ]));

const _escapeHex = Named('_escapeHex', Preceded(Tag('u'), _hexValueChecked));

const _false = Named('_false', Value(Expr<bool>('false'), Tag('false')));

const _hexValue = Named(
    '_hexValue',
    Mapped(TakeWhileMN(4, 4, isHexDigit),
        Expr<String>('String.fromCharCode(_toHexValue({{0}}))')));

const _hexValueChecked = Named(
    '_hexValueChecked',
    ReplaceErrors(
      _hexValue,
      Expr(
          "(true, [ErrorMessage({{1}} - {{0}}, 'Expected 4 digit hexadecimal number')])"),
    ));

const _keyValue = Named(
    '_keyValue',
    Mapped(
      Tuple3(_string, _colon, _value),
      Expr<MapEntry<String, Object?>>(r'MapEntry({{0}}.$1, {{0}}.$3)'),
    ));

const _keyValues = Named('_keyValues', SeparatedList(_keyValue, _comma));

const _normalChars = Expr<bool>(
    '{{0}} <= 91 ? {{0}} <= 33 ? {{0}} >= 32 : {{0}} >= 35 : {{0}} <= 1114111 && {{0}} >= 93');

const _null = Named('_null', Value(Expr<Object?>('null'), Tag('null')));

const _number = Named('_number', Number());

const _object = Named(
    '_object',
    Mapped(
      Tuple3(
        _openBrace,
        _keyValues,
        Tag('}'),
      ),
      Expr<Map<String, Object?>>(r'Map.fromEntries({{0}}.$2)'),
    ));

const _openBrace = Marked('_openBrace ', Terminated(Tag('{'), _ws));

const _openBracket = Marked('_openBracket', Terminated(Tag('['), _ws));

const _string = Named('_string', Delimited(Tag('"'), _stringChars, Tag('"')));

const _stringChars = Named(
    '_stringChars',
    StringChars(
      _normalChars,
      0x5c,
      Choice([_escapeChar, _escapeHex]),
    ));

const _true = Named('_true', Value(Expr<bool>('true'), Tag('true')));

const _value = Ref<String, Object?>('_value');

const _value_ = Named(
  '_value',
  Terminated(
      SmartChoice<Object?>([
        _object,
        _string,
        _array,
        _null,
        _false,
        _true,
        _number,
      ]),
      _ws),
);

const _values = Named('_values', SeparatedList(_value, _comma));

const _ws = Marked('_ws', SkipWhile(InRange(['\t\r\n '])));
