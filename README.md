# parser_builder_lite

Parser Builder Lite is a source code generator of high performance parsers.

Version: 0.7.0

## What is it and what is it for?

Parser Builder is intended to quickly implement (and test) parsers through source code templates.  
The main features and advantage:
- A very simple builder is used to build parsers
- Parsers are generated as source code
- The generated parsers are very fast and efficient (as if they were written by hand)
- The `SmartChoice` parser builder increases the performance of parsing by looking one character ahead.
- The `SequenceBase` can efficiently generate an unlimited number of combinations of parser sequences.
- The error reporting system is very flexible and informative
- Convenient and easy debugging of the parsing process
- A simple and convenient test generator is included

## Parser builder example

A typical example of a parser builder (with static template).

```dart
import '../helper.dart';
import '../parser_builder.dart';

class Many<I, O> extends ParserBuilder<I, List<O>> {
  static const _template = '''
final @list = <@O>[];
while (true) {
  @p1
  if (!state.ok) {
    break;
  }
  @list.add(@rv1);
}
if (state.ok = true) {
  @r = @list;
}''';

  static const _templateNoResult = '''
while (true) {
  @p1
  if (!state.ok) {
    break;
  }
}
state.ok = true;''';

  final ParserBuilder<I, O> p;

  const Many(this.p);

  @override
  bool get isOptional => true;

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    checkIsNotOptional(p);
    return renderBody(
      this,
      context,
      hasResult,
      _template,
      _templateNoResult,
      {'O': '$O'},
    );
  }

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return [(p, null)];
  }
}

```

## Parser builder usage example

A typical example of using a parser builder.

```dart
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

```

An example of the generated source code.

```dart
Map<String, Object?>? _object(State<String> state) {
  Map<String, Object?>? $0;
  (String, List<MapEntry<String, Object?>>, String)? $1;
  final pos$0 = state.pos;
  String? $2;
  // => _openBrace
  final pos$1 = state.pos;
  String? $3;
  const tag$0 = '{';
  if (state.ok = state.pos + 1 <= state.input.length &&
      state.input.codeUnitAt(state.pos) == 123) {
    state.pos += 1;
    $3 = tag$0;
  } else {
    state.fail(const ErrorExpectedTags([tag$0]));
  }
  if (state.ok) {
    _ws(state);
    if (state.ok) {
      $2 = $3;
    } else {
      state.pos = pos$1;
    }
  }
  // <= _openBrace
  if (state.ok) {
    List<MapEntry<String, Object?>>? $5;
    $5 = _keyValues(state);
    if (state.ok) {
      String? $32;
      // => _closeBrace
      final pos$12 = state.pos;
      String? $33;
      const tag$6 = '}';
      if (state.ok = state.pos + 1 <= state.input.length &&
          state.input.codeUnitAt(state.pos) == 125) {
        state.pos += 1;
        $33 = tag$6;
      } else {
        state.fail(const ErrorExpectedTags([tag$6]));
      }
      if (state.ok) {
        _ws(state);
        if (state.ok) {
          $32 = $33;
        } else {
          state.pos = pos$12;
        }
      }
      // <= _closeBrace
      if (state.ok) {
        $1 = ($2!, $5!, $32!);
      }
    }
  }
  if (!state.ok) {
    state.pos = pos$0;
  }
  if (state.ok) {
    final v = $1!;
    $0 = Map.fromEntries(v.$2);
  }
  return $0;
}

```

## Fast build example

A typical example of a source code builder.

```dart
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

```

## Error reporting

All errors are generated automatically.  
But if you need elegant error messages, then you can use the built-in parsers for this, which generate more informative error messages.  
Or you can always write your own parser builder for this purpose.  
Moreover, this parser builder will be the same as all the others, no different from any other.  

Error handling customization example:  

```dart
const _hexValueChecked = Named(
    '_hexValueChecked',
    ReplaceErrors(
      _hexValue,
      Expr(
          "(true, [ErrorMessage({{1}} - {{0}}, 'Expected 4 digit hexadecimal number')])"),
    ));

```

Data source (JSON):  

```
"abc\u123  "
```

Error report:  

```
line 1, column 7: Expected 4 digit hexadecimal number
"abc\u123  "
      ^^^
```

An example of standard error messages.  
Error messages will directly depend on the selected parsing algorithm.  

Data source (JSON):  

```
{"rocket": "🚀 flies to the stars}
```

Error report:  

```
line 1, column 35: Unexpected end of file
{"rocket": "🚀 flies to the stars}
                                  ^

line 1, column 35: Expected '"'
{"rocket": "🚀 flies to the stars}
                                  ^
```

## Parser test generator

Example of usage:

```dart
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
    addErrorMessageCode: false,
    footer: _footer,
    header: _header + tester.generate(),
  );
}

```

Generated tests (part of this file):

```dart
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: inference_failure_on_collection_literal
// ignore_for_file: unnecessary_cast

import 'package:test/test.dart' hide escape;

void main() {
  _test();
}

void _test() {
  // Many
  _test_Many$0();
  // Preceded
  _test_Preceded$0();
}

void _test_Many$0() {
  // Many
  test('Many', () {
    final state$0 = State('1112');
    final result$0 = _Many$0(state$0);
    expect(state$0.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 1112');
    final value$0 = result$0!;
    expect(value$0, [49, 49, 49],
        reason: 'Testing \'result = value\' failed, input: 1112');
    expect(state$0.pos, 3, reason: 'Testing \'state.pos\' failed, input: 1112');
    final state$1 = State('1112');
    final result$1 = _Many_NoResult$0(state$1);
    expect(state$1.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 1112');
    final value$1 = result$1;
    expect(value$1, null,
        reason: 'Testing \'result == null\' failed, input: 1112');
    expect(state$1.pos, 3, reason: 'Testing \'state.pos\' failed, input: 1112');
    final state$2 = State('');
    final result$2 = _Many$0(state$2);
    expect(state$2.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: ');
    final value$2 = result$2!;
    expect(value$2, [], reason: 'Testing \'result = value\' failed, input: ');
    expect(state$2.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    final state$3 = State('');
    final result$3 = _Many_NoResult$0(state$3);
    expect(state$3.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: ');
    final value$3 = result$3;
    expect(value$3, null, reason: 'Testing \'result == null\' failed, input: ');
    expect(state$3.pos, 0, reason: 'Testing \'state.pos\' failed, input: ');
    final state$4 = State('2');
    final result$4 = _Many$0(state$4);
    expect(state$4.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 2');
    final value$4 = result$4!;
    expect(value$4, [], reason: 'Testing \'result = value\' failed, input: 2');
    expect(state$4.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
    final state$5 = State('2');
    final result$5 = _Many_NoResult$0(state$5);
    expect(state$5.ok, true,
        reason: 'Testing \'state.ok == true\' failed, input: 2');
    final value$5 = result$5;
    expect(value$5, null,
        reason: 'Testing \'result == null\' failed, input: 2');
    expect(state$5.pos, 0, reason: 'Testing \'state.pos\' failed, input: 2');
  });
}

```

## Performance

Test results based on data from this source https://github.com/miloyip/nativejson-benchmark.  

JIT code execution.

```
Parse 20 times: E:\prj\test_json\bin\data\canada.json (2251.05 Kb)
Dart SDK JSON : k: 2.75, 54.78 MB/s, 783.7180 ms (100.00%),
JSON Parser: k: 1.00, 150.85 MB/s, 284.6280 ms (36.32%),

Parse 20 times: E:\prj\test_json\bin\data\citm_catalog.json (1727.03 Kb)
Dart SDK JSON : k: 1.00, 108.23 MB/s, 304.3650 ms (85.31%),
JSON Parser: k: 1.17, 92.33 MB/s, 356.7710 ms (100.00%),

Parse 20 times: E:\prj\test_json\bin\data\twitter.json (567.93 Kb)
Dart SDK JSON : k: 1.00, 68.83 MB/s, 157.3720 ms (89.55%),
JSON Parser: k: 1.12, 61.64 MB/s, 175.7270 ms (100.00%),

OS: Њ ©Єа®б®дв Windows 10 Pro 10.0.19045
Kernel: Windows_NT 10.0.19045
Processor (4 core) Intel(R) Core(TM) i5-3450 CPU @ 3.10GHz
```

AOT code execution.

```
Parse 20 times: E:\prj\test_json\bin\data\canada.json (2251.05 Kb)
Dart SDK JSON : k: 1.76, 49.26 MB/s, 871.5480 ms (100.00%),
JSON Parser: k: 1.00, 86.89 MB/s, 494.1260 ms (56.70%),

Parse 20 times: E:\prj\test_json\bin\data\citm_catalog.json (1727.03 Kb)
Dart SDK JSON : k: 1.00, 88.38 MB/s, 372.6970 ms (90.48%),
JSON Parser: k: 1.11, 79.97 MB/s, 411.9100 ms (100.00%),

Parse 20 times: E:\prj\test_json\bin\data\twitter.json (567.93 Kb)
Dart SDK JSON : k: 1.00, 61.71 MB/s, 175.5400 ms (87.40%),
JSON Parser: k: 1.14, 53.93 MB/s, 200.8460 ms (100.00%),

OS: Њ ©Єа®б®дв Windows 10 Pro 10.0.19045
Kernel: Windows_NT 10.0.19045
Processor (4 core) Intel(R) Core(TM) i5-3450 CPU @ 3.10GHz
```
