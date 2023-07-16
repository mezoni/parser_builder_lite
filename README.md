# parser_builder_lite

Parser Builder Lite is a lightweight and uncomplicated parser combinator builder (source code generator).

Version: 0.6.9

## What is it and what is it for?

Parser Builder is intended to quickly implement (and test) parsers through source code templates.  
The main features and advantage:
- A very simple builder is used to build parsers
- Parsers are generated into source code
- The generated parsers are very fast and efficient
- The `SmartChoice` parser builder increases the performance of parsing by looking one character ahead.
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
final list = <{{O}}>[];
while (true) {
  final r1 = {{p1}}(state);
  if (r1 == null) {
    break;
  }
  list.add(r1.value);
}
return Result(list);''';

  final ParserBuilder<I, O> p;

  const Many(this.p);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'O': '$O',
      'p1': p.build(context).name,
    });
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
As you can see, there is not a lot of source code, just as much as is generated from the template.

```dart
Result<(String, List<MapEntry<String, Object?>>, String)>? _p$0(
    State<String> state) {
  final pos = state.pos;
  final r1 = _openBrace(state);
  if (r1 != null) {
    final r2 = _keyValues(state);
    if (r2 != null) {
      final r3 = _closeBrace(state);
      if (r3 != null) {
        return Result((r1.value, r2.value, r3.value));
      }
    }
  }
  state.pos = pos;
  return null;
}

Result<Map<String, Object?>>? _object(State<String> state) {
  final r1 = _p$0(state);
  if (r1 != null) {
    final v = Map.fromEntries(r1.value.$2);
    return Result(v);
  }
  return null;
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
      Expr<Object?>(
          '''ErrorMessage({{1}} - {{0}}, 'Expected 4 digit hexadecimal number')'''),
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
Unhandled exception:
line 1, column 35: Unexpected end of file
{"rocket": "🚀 flies to the stars}
                                  ^

line 1, column 35: Expected '\', '\u', '"'
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

  tester.addTest('Preceded', const Preceded(Char(0x31), Char(0x32)),
      (parserName, parser) {
    final buffer = StringBuffer();
    final t1 = ParserTest(
      allocator: Allocator(_prefix),
      context: context,
      output: buffer,
      parser: parser,
      parserName: parserName,
    );
    t1.testSuccess(
      source: '123',
      result: 0x32,
      pos: 2,
    );
    t1.testFailure(
      source: '',
      failPos: 0,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    t1.testFailure(
      source: '1',
      failPos: 1,
      pos: 0,
      errors: [errorUnexpectedEof],
    );
    t1.testFailure(
      source: '2',
      failPos: 0,
      pos: 0,
      errors: [errorExpectedChar],
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
    expect(result$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'1112\'');
    final value$0 = result$0!.value;
    expect(value$0, [49, 49, 49],
        reason: 'Testing \'result.value\' failed, source: \'1112\'');
    expect(state$0.pos, 3,
        reason: 'Testing \'state.pos\' failed, source: \'1112\'');
    final state$1 = State('');
    final result$1 = _Many$0(state$1);
    expect(result$1 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'\'');
    final value$1 = result$1!.value;
    expect(value$1, [],
        reason: 'Testing \'result.value\' failed, source: \'\'');
    expect(state$1.pos, 0,
        reason: 'Testing \'state.pos\' failed, source: \'\'');
    final state$2 = State('2');
    final result$2 = _Many$0(state$2);
    expect(result$2 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'2\'');
    final value$2 = result$2!.value;
    expect(value$2, [],
        reason: 'Testing \'result.value\' failed, source: \'2\'');
    expect(state$2.pos, 0,
        reason: 'Testing \'state.pos\' failed, source: \'2\'');
  });
}

void _test_Preceded$0() {
  // Preceded
  test('Preceded', () {
    final state$0 = State('123');
    final result$0 = _Preceded$0(state$0);
    expect(result$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'123\'');
    final value$0 = result$0!.value;
    expect(value$0, 50,
        reason: 'Testing \'result.value\' failed, source: \'123\'');
    expect(state$0.pos, 2,
        reason: 'Testing \'state.pos\' failed, source: \'123\'');
    final state$1 = State('');
    final result$1 = _Preceded$0(state$1);
    expect(result$1 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'\'');
    expect(state$1.pos, 0,
        reason: 'Testing \'state.pos\' failed, source: \'\'');
    expect(state$1.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'\'');
    expect(state$1.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'\'');
    expect(state$1.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'\'');
    final state$2 = State('1');
    final result$2 = _Preceded$0(state$2);
    expect(result$2 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'1\'');
    expect(state$2.pos, 0,
        reason: 'Testing \'state.pos\' failed, source: \'1\'');
    expect(state$2.failPos, 1,
        reason: 'Testing \'state.failPos\' failed, source: \'1\'');
    expect(state$2.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'1\'');
    expect(state$2.errors[0], isA<ErrorUnexpectedEof>(),
        reason: 'Testing \'state.error\' failed, source: \'1\'');
    final state$3 = State('2');
    final result$3 = _Preceded$0(state$3);
    expect(result$3 == null, true,
        reason: 'Testing \'result == null\' failed, source: \'2\'');
    expect(state$3.pos, 0,
        reason: 'Testing \'state.pos\' failed, source: \'2\'');
    expect(state$3.failPos, 0,
        reason: 'Testing \'state.failPos\' failed, source: \'2\'');
    expect(state$3.errors.length, 1,
        reason: 'Testing \'state.errors.length\' failed, source: \'2\'');
    expect(state$3.errors[0], isA<ErrorExpectedChar>(),
        reason: 'Testing \'state.error\' failed, source: \'2\'');
  });
}

```

## Performance

JIT code execution.

```
Test failures

Parse 20 times: E:\prj\test_json\bin\data\canada.json (2251.05 Kb)
Dart SDK JSON : k: 2.05, 53.75 MB/s, 798.7460 ms (100.00%),
JSON Parser: k: 1.00, 110.03 MB/s, 390.2050 ms (48.85%),

Parse 20 times: E:\prj\test_json\bin\data\citm_catalog.json (1727.03 Kb)
Dart SDK JSON : k: 1.00, 106.24 MB/s, 310.0440 ms (72.65%),
JSON Parser: k: 1.38, 77.19 MB/s, 426.7540 ms (100.00%),

Parse 20 times: E:\prj\test_json\bin\data\twitter.json (567.93 Kb)
Dart SDK JSON : k: 1.00, 67.48 MB/s, 160.5340 ms (80.84%),
JSON Parser: k: 1.24, 54.55 MB/s, 198.5810 ms (100.00%),

OS: Њ ©Єа®б®дв Windows 10 Pro 10.0.19045
Kernel: Windows_NT 10.0.19045
Processor (4 core) Intel(R) Core(TM) i5-3450 CPU @ 3.10GHz
```

AOT code execution.

```
Test failures

Parse 20 times: E:\prj\test_json\bin\data\canada.json (2251.05 Kb)
Dart SDK JSON : k: 1.54, 50.20 MB/s, 855.2930 ms (100.00%),
JSON Parser: k: 1.00, 77.43 MB/s, 554.5380 ms (64.84%),

Parse 20 times: E:\prj\test_json\bin\data\citm_catalog.json (1727.03 Kb)
Dart SDK JSON : k: 1.00, 91.70 MB/s, 359.2160 ms (79.55%),
JSON Parser: k: 1.26, 72.95 MB/s, 451.5760 ms (100.00%),

Parse 20 times: E:\prj\test_json\bin\data\twitter.json (567.93 Kb)
Dart SDK JSON : k: 1.00, 61.09 MB/s, 177.3080 ms (79.32%),
JSON Parser: k: 1.26, 48.46 MB/s, 223.5440 ms (100.00%),

OS: Њ ©Єа®б®дв Windows 10 Pro 10.0.19045
Kernel: Windows_NT 10.0.19045
Processor (4 core) Intel(R) Core(TM) i5-3450 CPU @ 3.10GHz
```