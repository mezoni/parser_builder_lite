import 'dart:convert';
import 'dart:io';

import 'package:parser_builder_lite/branch/alt.dart';
import 'package:parser_builder_lite/bytes/skip_while.dart';
import 'package:parser_builder_lite/bytes/tag.dart';
import 'package:parser_builder_lite/bytes/tags.dart';
import 'package:parser_builder_lite/bytes/take_while.dart';
import 'package:parser_builder_lite/character/satisfy.dart';
import 'package:parser_builder_lite/combinator/eof.dart';
import 'package:parser_builder_lite/combinator/map1.dart';
import 'package:parser_builder_lite/combinator/opt.dart';
import 'package:parser_builder_lite/combinator/recognize.dart';
import 'package:parser_builder_lite/combinator/value.dart';
import 'package:parser_builder_lite/error/handle_error.dart';
import 'package:parser_builder_lite/helper.dart' as helper;
import 'package:parser_builder_lite/multi/many.dart';
import 'package:parser_builder_lite/multi/separated_list.dart';
import 'package:parser_builder_lite/parser_builder.dart';
import 'package:parser_builder_lite/runtime.dart' as runtime;
import 'package:parser_builder_lite/sequence/delimited.dart';
import 'package:parser_builder_lite/sequence/map.dart';
import 'package:parser_builder_lite/sequence/preceded.dart';
import 'package:parser_builder_lite/sequence/skip.dart';
import 'package:parser_builder_lite/sequence/terminated.dart';

void main(List<String> args) async {
  final output = StringBuffer();
  final context = BuildContext(
    allocator: Allocator('_\$g'),
    output: output,
  );

  output.writeln(__header);
  output.writeln();
  final parsers = [json, _value_];
  for (final parser in parsers) {
    parser.build(context);
  }

  output.writeln(__footer);
  output.writeln(runtime.errorMessageTemplate);
  output.writeln(runtime.runtimeTemplate);
  const filename = 'example/json_parser.dart';
  File(filename).writeAsStringSync('${context.output}');
  const format = true;
  if (format) {
    final process =
        await Process.start(Platform.executable, ['format', filename]);
    // ignore: unawaited_futures
    process.stdout.transform(utf8.decoder).forEach(print);
    // ignore: unawaited_futures
    process.stderr.transform(utf8.decoder).forEach(print);
  }
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
  final r = parse( '{"rocket": "???? flies to the stars"}');
  print(r);
}

Object? parse(String source) {
  final state = State(source);
  final result = json(state);
  if (result == null) {
    final message = _errorMessage(source, state.errors);
    throw message;
  }
  return result.value;
}
''';

const _array = Named('_array', Delimited(_openBracket, _values, _closeBracket));

const _closeBrace = Named('_closeBrace', Terminated(Tag('}'), _ws));

const _closeBracket = Named('_closeBracket', Terminated(Tag(']'), _ws));

const _comma = Named('_comma', Terminated(Tag(','), _ws));

const _digit0 =
    Named('_digit0', SkipWhile0(Func('(int a) => a >= 48 && a <= 57;')));

const _digit1 =
    Named('_digit1', SkipWhile1(Func('(int a) => a >= 48 && a <= 57;')));

const _doubleQuote = Named('_doubleQuote', Terminated(Tag('"'), _ws));

const _escape = Named('_escape', Preceded(Tag('\\'), _escapeChar));

const _escapeChar = Named(
    '_escapeChar',
    _Switch({
      34: '"',
      47: '/',
      92: '\\',
      98: '\b',
      102: '\f',
      110: '\n',
      114: '\r',
      116: '\t',
    }));

const _exp = Named(
    '_exp',
    Opt<String, Object?>(
        Skip3(Tags(['e', 'E']), Opt(Tags(['+', '-'])), _digit1)));

const _false = Named<String, bool>(
    '_false', Value(Terminated(Tag('false'), _ws), 'false'));

const _frac = Named('_frac', Opt<String, Object?>(Skip2(Tag('.'), _digit1)));

const _hexChar = Named('_hexChar', Preceded(Tag(r'\u'), _hexValueChecked));

const _hexValue = Named(
    '_hexValue',
    Map1(
        TakeWhileMN(
            4,
            4,
            Func(
                '(int a) => (a >= 48 && a <= 57) || (a >= 65 && a <= 70) || (a >= 97 && a <= 102);')),
        Func<String>('(String a) => String.fromCharCode(_toHexValue(a));')));

const _hexValueChecked =
    Named('_hexValueChecked', HandleError(_hexValue, Func('''
(State<String> a) {
  final error = ErrorMessage(a.failPos, 'Expected 4 digit hexadecimal number');
  error.start = a.pos;
  //a.errors = [];
  return error;
}''')));

const _integer = Named(
    '_integer',
    Alt2(
      Tag('0'),
      Skip2(Satisfy(Func('(int a) => a >= 49 && a <= 57;')), _digit0),
    ));

const _keyValue = Named(
    '_keyValue',
    Map3(
        _string,
        _semicolon,
        _value,
        Func<MapEntry<String, Object?>>(
            '(String a, b, Object? c) => MapEntry<String, Object?>(a, c);')));

const _keyValues = Named('_keyValues', SeparatedList0(_keyValue, _comma));

const _minus = Named('_minus', Opt(Tag('-')));

const _normalChars = Named(
    '_normalChars',
    TakeWhile1(Func(
        '(int a) => a <= 91 ? a <= 33 ? a >= 32 : a >= 35 : a <= 1114111 && a >= 93;')));

const _null = Named(
    '_null', Value<String, Object?>(Terminated(Tag('null'), _ws), 'null'));

/// '-'?('0'|[1-9][0-9]*)('.'[0-9]+)?([eE][+-]?[0-9]+)?
const _num = Named(
    '_num',
    Map1(
      Recognize(Skip4(
        _minus,
        _integer,
        _frac,
        _exp,
      )),
      Func('(String a) => num.parse(a);'),
    ));

const _number = Named('_number', Terminated(_num, _ws));

const _object = Named(
    '_object',
    Map3(
        _openBrace,
        _keyValues,
        _closeBrace,
        Func<Map<String, Object?>>(
            '(a, List<MapEntry<String, Object?>> b, c) => Map.fromEntries(b);')));

const _openBrace = Named('_openBrace', Terminated(Tag('{'), _ws));

const _openBracket = Named('_openBracket', Terminated(Tag('['), _ws));

const _semicolon = Named('_semicolon', Terminated(Tag(':'), _ws));

const _string = Named(
    '_string',
    Delimited(
        Tag('"'),
        Map1(_stringChars, Func<String>('(List<String> a) => a.join();')),
        _doubleQuote));

const _stringChars = Named(
    '_stringChars',
    Many0(Alt3(
      _normalChars,
      _escape,
      _hexChar,
    )));

const _true =
    Named<String, bool>('_true', Value(Terminated(Tag('true'), _ws), 'true'));

const _value = Ref<String, Object?>('_value');

const _value_ = Named(
    '_value',
    Alt7(
      _string,
      _number,
      _true,
      _false,
      _null,
      _array,
      _object,
    ));

const _values = Named('_values', SeparatedList0(_value, _comma));

const _ws = Named('_ws',
    SkipWhile0(Func('(int a) => a == 9 ||a == 10 || a == 13 || a == 32;')));

class _Switch extends ParserBuilder<String, String> {
  static const _case = '''
case {{key}}:
  return const Result({{value}});''';

  static const _template = '''
{
  final source = state.source;
  final pos = state.pos;
  if (pos >= source.length) {
    final error = ErrorUnexpectedEof(pos);
    return state.fail(error);
  }
  final c = source.readRune(state);
  switch (c) {
    {{cases}}
  }
  state.pos = pos;
  final error = ErrorUnexpectedChar(pos, source);
  return state.fail(error);
}''';

  final Map<int, String> map;

  const _Switch(this.map);

  @override
  String get template {
    final cases = <String>[];
    for (var kv in map.entries) {
      final element = helper.render(_case, {
        'key': helper.getAsCode(kv.key),
        'value': helper.getAsCode(kv.value),
      });
      cases.add(element);
    }

    return helper.render(_template, {'cases': cases.join('\n')});
  }
}
