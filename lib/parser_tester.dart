import 'allocator.dart';
import 'calculable.dart';
import 'expr.dart';
import 'helper.dart';
import 'parser/named.dart';
import 'parser_builder.dart';

const errorExpectedChar = 'ErrorExpectedChar';

const errorExpectedEof = 'ErrorExpectedEof';

const errorExpectedTags = 'ErrorExpectedTags';

const errorMessage = 'ErrorMessage';

const errorUnexpectedChar = 'ErrorUnexpectedChar';

const errorUnexpectedEof = 'ErrorUnexpectedEof';

const errorUnexpectedInput = 'ErrorUnexpectedInput';

class ParserTest<I, O> {
  final Allocator allocator;

  final BuildContext context;

  final StringSink output;

  final ParserBuilder<I, O> parser;

  final String parserName;

  ParserTest({
    required this.context,
    required this.allocator,
    required this.output,
    required this.parser,
    required this.parserName,
  });

  String getReason({
    required String source,
    required String subject,
  }) {
    final sourceCode = getAsCode(source);
    final message = getAsCode("Testing '$subject' failed, source: $sourceCode");
    return message;
  }

  void testFailure({
    List<
            ({
              String reason,
              Calculable<Object?> actual,
              Calculable<Object?> expected
            })>?
        errorTests,
    required List<String> errors,
    required int failPos,
    required int pos,
    required String source,
  }) {
    final resultVar = allocator.allocate();
    final stateVar = allocator.allocate();
    final errorsCountCode = getAsCode(errors.length);
    final sourceCode = getAsCode(source);
    output.writeln('final $stateVar = State($sourceCode);');
    output.writeln('final $resultVar = $parserName($stateVar);');
    output.writeln(
        'expect($resultVar == null, true, reason: ${getReason(source: source, subject: 'result == null')});');
    output.writeln(
        'expect($stateVar.pos, $pos, reason: ${getReason(source: source, subject: 'state.pos')});');
    output.writeln(
        'expect($stateVar.failPos, $failPos, reason: ${getReason(source: source, subject: 'state.failPos')});');
    output.writeln(
        'expect($stateVar.errors.length, $errorsCountCode, reason: ${getReason(source: source, subject: 'state.errors.length')});');
    for (var i = 0; i < errors.length; i++) {
      final error = errors[i];
      output.writeln(
          'expect($stateVar.errors[$i], isA<$error>(), reason: ${getReason(source: source, subject: 'state.error')});');
    }
    if (errorTests != null) {
      for (var resultError in errorTests) {
        final actual =
            resultError.actual.calculate(context, ['$stateVar.errors']);
        final expected =
            resultError.expected.calculate(context, ['$stateVar.errors']);
        final reason = resultError.reason;
        output.writeln(
            'expect($actual, $expected, reason: ${getReason(source: source, subject: reason)});');
      }
    }
  }

  void testSuccess({
    required int pos,
    O? result,
    List<({String reason, Expr<Object?> actual, Expr<Object?> expected})>?
        resultTests,
    required String source,
  }) {
    final resultVar = allocator.allocate();
    final resultValue = allocator.allocate();
    final stateVar = allocator.allocate();
    final resultCode = getAsCode(result);
    final sourceCode = getAsCode(source);
    output.writeln('final $stateVar = State($sourceCode);');
    output.writeln('final $resultVar = $parserName($stateVar);');
    output.writeln(
        'expect($resultVar != null, true, reason: ${getReason(source: source, subject: 'result != null')});');
    output.writeln('final $resultValue = $resultVar!.value;');
    if (resultTests != null) {
      for (var resultTest in resultTests) {
        final actual = resultTest.actual.calculate(context, [resultValue]);
        final expected = resultTest.expected.calculate(context, [resultValue]);
        final reason = resultTest.reason;
        output.writeln(
            'expect($actual, $expected, reason: ${getReason(source: source, subject: reason)});');
      }
    } else {
      output.writeln(
          'expect($resultValue, $resultCode, reason: ${getReason(source: source, subject: 'result.value')});');
    }

    output.writeln(
        'expect($stateVar.pos, $pos, reason: ${getReason(source: source, subject: 'state.pos')});');
  }
}

class ParserTester<I> {
  final BuildContext context;

  final StringBuffer localOutput;

  final List<Named<I, Object?>> parsers = [];

  ParserTester({
    required this.context,
    required this.localOutput,
  });

  void addTest<O>(
    String description,
    ParserBuilder<I, O> parser,
    String Function(String parserName, ParserBuilder<I, O> parser) test,
  ) {
    if (description.isEmpty) {
      throw ArgumentError.value(
          description, 'description', 'Must not be empty');
    }

    final globalAllocator = context.allocator;
    final globalOutput = context.output;
    final nameFromDescription = description
        .replaceAll(' ', '_')
        .codeUnits
        .where((e) =>
            (e >= 0x30 && e <= 0x39) ||
            (e >= 0x41 && e <= 0x5a) ||
            (e >= 0x61 && e <= 0x7a))
        .toList();
    final parserName =
        globalAllocator.allocate(String.fromCharCodes(nameFromDescription));
    final namedParser = Named(parserName, parser);
    parsers.add(namedParser);
    final body = test(parserName, parser);
    final titleCode = getAsCode(description);
    final source = '''
test($titleCode, () {
$body
});''';
    globalOutput.writeln('void _test$parserName() {');
    globalOutput.writeln(' // $description');
    globalOutput.writeln(source);
    globalOutput.writeln('}');
    globalOutput.writeln();
    localOutput.writeln(' // $description');
    localOutput.writeln('_test$parserName();');
  }

  String generate() {
    final source = '''
void main() {
  _test();
}

void _test() {
  $localOutput
}
''';
    final globalOutput = context.output;
    final output = StringBuffer();
    globalOutput.writeln(source);
    return output.toString();
  }
}
