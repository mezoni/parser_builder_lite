# parser_builder_lite

Parser Builder Lite is a lightweight and uncomplicated parser builder.

Version: 0.2.3

## What is it and what is it for?

Parser Builder is designed to quickly write parsers through source code templates.  
The main feature and advantage is that a very simple (simplest) builder is used to build parsers (less than 4 kb of source code).  
Static and dynamic templates are supported.  
Static templates are easier to create and understand.  
Dynamic templates are more difficult to create, but the generated code can be much more efficient.  
The included templates are mostly static templates, for reliability, not performance.  
You can always implement your own parser builders to suit your needs.

A typical example of a parser builder (with static template).

```dart
class Many0<I, O> extends ParserBuilder<I, List<O>> {
  final ParserBuilder<I, O> parser;

  const Many0(this.parser);

  @override
  String get template => '''
final list = <{{O}}>[];
while (true) {
  final r1 = {{p1}};
  if (r1 == null) {
    break;
  }
  list.add(r1.value);
}
return Result(list);''';

  @override
  Map<String, Object?> get values => {
        'O': O,
        'p1': parser,
      };
}

```

A typical example of using a parser builder.

```dart
const _stringChars = Named(
    '_stringChars',
    Many0(Alt3(
      _normalChars,
      _escape,
      _hexChar,
    )));

```

An example of the generated source code.  
As you can see, there is not a lot of source code, just as much as is generated from the template.

```dart
Result<String>? _$g4(State<String> state) {
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
    final r1 = _$g4(state);
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
    unawaited(process.stdout.transform(utf8.decoder).forEach(print));
    unawaited(process.stderr.transform(utf8.decoder).forEach(print));
  }
}

```