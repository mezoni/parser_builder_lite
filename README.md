# parser_builder_lite

Parser Builder Lite is a lightweight and uncomplicated parser combinator builder (source code generator).

Version: 0.5.1

## What is it and what is it for?

Parser Builder is intended to quickly implement (and test) parsers through source code templates.  
The main feature and advantage is that a very simple builder is used to build parsers.  
The error reporting system is simple, but at the same time very flexible and informative.  
For quick implementation of parser tests, a simple and convenient test generator is included.  
Parsing is supported not only for text data, but also for binary data.  

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
Error reporting example.  

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

```dart
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

const _prefix = '\$';

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
}

void _test_Many$0() {
  // Many
  test('Many', () {
    final $$2 = State('1112');
    final $$0 = _Many$0($$2);
    expect($$0 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'1112\'');
    final $$1 = $$0!.value;
    expect($$1, [49, 49, 49],
        reason: 'Testing \'result.value\' failed, source: \'1112\'');
    expect($$2.pos, 3,
        reason: 'Testing \'state.pos\' failed, source: \'1112\'');
    final $$5 = State('');
    final $$3 = _Many$0($$5);
    expect($$3 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'\'');
    final $$4 = $$3!.value;
    expect($$4, [], reason: 'Testing \'result.value\' failed, source: \'\'');
    expect($$5.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'\'');
    final $$8 = State('2');
    final $$6 = _Many$0($$8);
    expect($$6 != null, true,
        reason: 'Testing \'result != null\' failed, source: \'2\'');
    final $$7 = $$6!.value;
    expect($$7, [], reason: 'Testing \'result.value\' failed, source: \'2\'');
    expect($$8.pos, 0, reason: 'Testing \'state.pos\' failed, source: \'2\'');
  });
}
```