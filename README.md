# parser_builder_lite

Parser Builder Lite is a lightweight and uncomplicated parser combinator builder (source code generator).

Version: 0.5.1

## What is it and what is it for?

Parser Builder is designed to quickly implement (and test) parsers through source code templates.  
The main feature and advantage is that a very simple builder is used to build parsers.  
Availability of tools for quick generation of tests of parsers.  
Parsing is supported not only for text data, but also for binary data.  
The error reporting algorithm is quite informative.  

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

  final ParserBuilder<I, O> parser;

  const Many(this.parser);

  @override
  String buildBody(BuildContext context) {
    return render(_template, {
      'O': '$O',
      'p1': parser.build(context).name,
    });
  }
}

```

A typical example of using a parser builder.

```dart
const _stringChars = Named(
    '_stringChars',
    Many(Choice3(
      _normalChars,
      _escape,
      _hexChar,
    )));

```

An example of the generated source code.  
As you can see, there is not a lot of source code, just as much as is generated from the template.

```dart
Result<String>? _p5(State<String> state) {
  final r1 = _normalChars(state);
  if (r1 != null) {
    return r1;
  }
  final r2 = _escape(state);
  if (r2 != null) {
    return r2;
  }
  final r3 = _hexChar(state);
  if (r3 != null) {
    return r3;
  }

  return null;
}

Result<List<String>>? _stringChars(State<String> state) {
  final list = <String>[];
  while (true) {
    final r1 = _p5(state);
    if (r1 == null) {
      break;
    }
    list.add(r1.value);
  }
  return Result(list);
}

```

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

Testing

