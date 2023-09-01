import 'package:parser_builder_lite/allocator.dart';
import 'package:parser_builder_lite/expr.dart';
import 'package:parser_builder_lite/fast_build.dart';
import 'package:parser_builder_lite/parser/choice.dart';
import 'package:parser_builder_lite/parser/delimited.dart';
import 'package:parser_builder_lite/parser/eof.dart';
import 'package:parser_builder_lite/parser/malformed.dart';
import 'package:parser_builder_lite/parser/mapped.dart';
import 'package:parser_builder_lite/parser/marked.dart';
import 'package:parser_builder_lite/parser/named.dart';
import 'package:parser_builder_lite/parser/no_result.dart';
import 'package:parser_builder_lite/parser/opt.dart';
import 'package:parser_builder_lite/parser/preceded.dart';
import 'package:parser_builder_lite/parser/predicate.dart';
import 'package:parser_builder_lite/parser/recognize.dart';
import 'package:parser_builder_lite/parser/ref.dart';
import 'package:parser_builder_lite/parser/satisfy.dart';
import 'package:parser_builder_lite/parser/separated_list.dart';
import 'package:parser_builder_lite/parser/separated_pair.dart';
import 'package:parser_builder_lite/parser/skip_while.dart';
import 'package:parser_builder_lite/parser/smart_choice.dart';
import 'package:parser_builder_lite/parser/string_chars.dart';
import 'package:parser_builder_lite/parser/switch_tags.dart';
import 'package:parser_builder_lite/parser/tag.dart';
import 'package:parser_builder_lite/parser/tags.dart';
import 'package:parser_builder_lite/parser/take_while_m_n.dart';
import 'package:parser_builder_lite/parser/terminated.dart';
import 'package:parser_builder_lite/parser/tuple.dart';
import 'package:parser_builder_lite/parser/value.dart';
import 'package:parser_builder_lite/parser_builder.dart';
import 'package:parser_builder_lite/ranges.dart';

Future<void> main(List<String> args) async {
  await fastBuild(
    context: BuildContext(
      globalAllocator: Allocator('_p'),
      globalOutput: StringBuffer(),
      localAllocator: Allocator(''),
    ),
    filename: 'example/example_parser.dart',
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
    final message = ParseError.errorMessage(input, state.failPos, state.getErrors());
    throw message;
  }
  return result;
}
''';

const _array = Named('_array', Delimited(_openBracket, _values, _closeBracket));

const _closeBrace = Marked('_closeBrace', Terminated(Tag('}'), _ws));

const _closeBracket = Marked('_closeBracket', Terminated(Tag(']'), _ws));

const _colon = Marked('_colon', Terminated(Tag(':'), _ws));

const _comma = Named('_comma', Terminated(Tag(','), _ws));

const _digit0 = Named('_digit0', SkipWhile(isDigit));

const _doubleQuote = Marked('_doubleQuote', Terminated(Tag('"'), _ws));

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

const _exp = Marked(
    '_exp',
    Opt<String, Object?>(NoResult([
      Tags(['e', 'E']),
      Opt(Tags(['+', '-'])),
      _digit0,
    ])));

const _false = Named<String, bool>(
    '_false', Value(Expr('false'), Terminated(Tag('false'), _ws)));

const _frac = Named(
    '_frac',
    Opt<String, Object?>(NoResult([
      Tag('.'),
      _digit0,
    ])));

const _hexValue = Named(
    '_hexValue',
    Mapped(TakeWhileMN(4, 4, isHexDigit),
        Expr<String>('String.fromCharCode(_toHexValue({{0}}))')));

const _hexValueChecked = Named('_hexValueChecked',
    Malformed(_hexValue, 'Expected 4 digit hexadecimal number'));

const _integer = Named(
    '_integer',
    NoResult([
      Choice2(
        Tag('0'),
        NoResult<String>([Satisfy(_isDigits1_9), _digit0]),
      )
    ]));

const _isDigits1_9 = InRange([('1', '9')]);

const _keyValue = Named(
    '_keyValue',
    Mapped(
      SeparatedPair(_string, _colon, _value),
      Expr<MapEntry<String, Object?>>(r'MapEntry({{0}}.$1, {{0}}.$2)'),
    ));

const _keyValues = Named('_keyValues', SeparatedList(_keyValue, _comma));

const _minus = Named('_minus', Opt(Tag('-')));

const _normalChars = Expr<bool>(
    '{{0}} <= 91 ? {{0}} <= 33 ? {{0}} >= 32 : {{0}} >= 35 : {{0}} <= 1114111 && {{0}} >= 93');

const _null = Named('_null',
    Value<String, Object?>(Expr('null'), Terminated(Tag('null'), _ws)));

/// '-'?('0'|[1-9][0-9]*)('.'[0-9]+)?([eE][+-]?[0-9]+)?
const _number = Named(
    '_number',
    Terminated(
      Mapped(
        Recognize(NoResult([
          _minus,
          _integer,
          _frac,
          _exp,
        ])),
        Expr<num>('num.parse({{0}})'),
      ),
      _ws,
    ));

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

const _openBrace = Marked('_openBrace ', Terminated(Tag('{'), _ws));

const _openBracket = Marked('_openBracket', Terminated(Tag('['), _ws));

const _string =
    Named('_string', Delimited(Tag('"'), _stringChars, _doubleQuote));

const _stringChars = Named(
    '_stringChars',
    StringChars(
      _normalChars,
      0x5c,
      //SmartChoice([_escapeChar, _escapeHex]),
      Choice([_escapeChar, _escapeHex]),
    ));

const _true = Named<String, bool>(
    '_true', Value(Expr('true'), Terminated(Tag('true'), _ws)));

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

const _ws = Named('_ws', SkipWhile(InRange(['\t', '\r', '\n', ' '])));
