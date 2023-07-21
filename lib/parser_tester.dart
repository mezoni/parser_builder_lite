import 'allocator.dart';
import 'calculable.dart';
import 'expr.dart';
import 'helper.dart';
import 'parser/named.dart';
import 'parser/no_result.dart';
import 'parser_builder.dart';

const errorExpectedChar = 'ErrorExpectedChar';

const errorExpectedEof = 'ErrorExpectedEof';

const errorExpectedInt = 'ErrorExpectedInt';

const errorExpectedTags = 'ErrorExpectedTags';

const errorMessage = 'ErrorMessage';

const errorUnexpectedChar = 'ErrorUnexpectedChar';

const errorUnexpectedEof = 'ErrorUnexpectedEof';

const errorUnexpectedInput = 'ErrorUnexpectedInput';

class ParserTest<I, O> {
  final Allocator allocator;

  final BuildContext context;

  final String Function(I input)? inputAsCode;

  final String Function(I input)? inputAsString;

  final StringSink output;

  final ParserBuilder<I, O> parser;

  final String parserName;

  final String parserNameNoResult;

  final ParserBuilder<I, Object?> parserNoResult;

  ParserTest({
    required this.context,
    required this.allocator,
    this.inputAsCode,
    this.inputAsString,
    required this.output,
    required this.parser,
    required this.parserName,
    required this.parserNameNoResult,
    required this.parserNoResult,
  });

  String getReason({
    required I input,
    required String subject,
  }) {
    final inputString = _inputAsString(input);
    final message = getAsCode("Testing '$subject' failed, input: $inputString");
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
    required I input,
    required int pos,
  }) {
    for (final name in [parserName, parserNameNoResult]) {
      final resultVar = allocator.allocate('result');
      final stateVar = allocator.allocate('state');
      final errorCountCode = getAsCode(errors.length);
      final inputCode = _inputAsCode(input);
      output.writeln('final $stateVar = State($inputCode);');
      output.writeln('final $resultVar = $name($stateVar);');
      output.writeln(
          'expect($stateVar.ok, false, reason: ${getReason(input: input, subject: 'state.ok == false')});');
      output.writeln(
          'expect($resultVar, null, reason: ${getReason(input: input, subject: 'result == null')});');
      output.writeln(
          'expect($stateVar.pos, $pos, reason: ${getReason(input: input, subject: 'state.pos')});');
      output.writeln(
          'expect($stateVar.failPos, $failPos, reason: ${getReason(input: input, subject: 'state.failPos')});');
      output.writeln(
          'expect($stateVar.errorCount, $errorCountCode, reason: ${getReason(input: input, subject: 'state.errorCount')});');
      for (var i = 0; i < errors.length; i++) {
        final error = errors[i];
        output.writeln(
            'expect($stateVar.errors[$i], isA<$error>(), reason: ${getReason(input: input, subject: 'state.error')});');
      }
      if (errorTests != null) {
        for (var resultError in errorTests) {
          final actual =
              resultError.actual.calculate(context, ['$stateVar.errors']);
          final expected =
              resultError.expected.calculate(context, ['$stateVar.errors']);
          final reason = resultError.reason;
          output.writeln(
              'expect($actual, $expected, reason: ${getReason(input: input, subject: reason)});');
        }
      }
    }
  }

  void testSuccess({
    required I input,
    required int pos,
    O? result,
    List<({String reason, Expr<Object?> actual, Expr<Object?> expected})>?
        resultTests,
  }) {
    for (final name in [parserName, parserNameNoResult]) {
      final resultVar = allocator.allocate('result');
      final resultValue = allocator.allocate('value');
      final stateVar = allocator.allocate('state');
      final resultCode = getAsCode(result);
      final inputCode = _inputAsCode(input);
      final resultValueChecked =
          parser.isNullableResultType() ? resultVar : '$resultVar!';
      output.writeln('final $stateVar = State($inputCode);');
      output.writeln('final $resultVar = $name($stateVar);');
      output.writeln(
          'expect($stateVar.ok, true, reason: ${getReason(input: input, subject: 'state.ok == true')});');
      if (name == parserName) {
        output.writeln('final $resultValue = $resultValueChecked;');
        if (resultTests != null) {
          for (var resultTest in resultTests) {
            final actual = resultTest.actual.calculate(context, [resultValue]);
            final expected =
                resultTest.expected.calculate(context, [resultValue]);
            final reason = resultTest.reason;
            output.writeln(
                'expect($actual, $expected, reason: ${getReason(input: input, subject: reason)});');
          }
        } else {
          output.writeln(
              'expect($resultValue, $resultCode, reason: ${getReason(input: input, subject: 'result = value')});');
        }
      } else {
        output.writeln('final $resultValue = $resultVar;');
        output.writeln(
            'expect($resultValue, null, reason: ${getReason(input: input, subject: 'result == null')});');
      }

      output.writeln(
          'expect($stateVar.pos, $pos, reason: ${getReason(input: input, subject: 'state.pos')});');
    }
  }

  String _inputAsCode(I input) {
    if (inputAsCode != null) {
      return inputAsCode!(input);
    }

    return getAsCode(input);
  }

  String _inputAsString(I input) {
    if (inputAsString != null) {
      return inputAsString!(input);
    }

    return input.toString();
  }
}

class ParserTester<I> {
  final BuildContext context;

  final StringBuffer localOutput;

  final List<Named<I, Object?>> parsers = [];

  final List<String> _tests = [];

  ParserTester({
    required this.context,
    required this.localOutput,
  });

  String _getValidIdentifier(String text) {
    return String.fromCharCodes(text
        .replaceAll(' ', '_')
        .codeUnits
        .where((e) =>
            (e >= 0x30 && e <= 0x39) ||
            (e >= 0x41 && e <= 0x5a) ||
            (e >= 0x61 && e <= 0x7a))
        .toList());
  }

  void addTest<O>(
    String description,
    ParserBuilder<I, O> parser,
    String Function(
            String parserName,
            String parserNameNoResult,
            ParserBuilder<I, O> parser,
            ParserBuilder<I, Object?> parserNoResult)
        test,
  ) {
    if (description.isEmpty) {
      throw ArgumentError.value(
          description, 'description', 'Must not be empty');
    }

    final globalAllocator = context.globalAllocator;
    final nameFromDescription = _getValidIdentifier(description);
    final parserName = globalAllocator.allocate(nameFromDescription);
    final parserNameNoResult =
        globalAllocator.allocate('${nameFromDescription}_NoResult');
    final parserNoResult = NoResult<I>([parser]);
    final namedParser = Named(parserName, parser);
    final namedParserNoResult = Named(parserNameNoResult, parserNoResult);
    parsers.add(namedParser);
    parsers.add(namedParserNoResult);
    final body = test(parserName, parserNameNoResult, parser, parserNoResult);
    final titleCode = getAsCode(description);
    final source = '''
test($titleCode, () {
$body
});''';
    final buffer = StringBuffer();
    buffer.writeln('void _test$parserName() {');
    buffer.writeln(' // $description');
    buffer.writeln(source);
    buffer.writeln('}');
    _tests.add(buffer.toString());
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
    final globalOutput = context.globalOutput;
    final output = StringBuffer();
    globalOutput.writeln(source);
    globalOutput.writeln(_tests.join('\n\n'));
    return output.toString();
  }
}
