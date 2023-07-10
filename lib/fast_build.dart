import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'parser_builder.dart';
import 'runtime.dart' as runtime;

Future<void> fastBuild({
  bool addErrorMessageCode = true,
  bool addRuntimeCode = true,
  required BuildContext context,
  required String filename,
  String? footer,
  bool format = true,
  String? header,
  required List<ParserBuilder<Object?, Object?>> parsers,
}) async {
  final output = StringBuffer();
  if (header != null) {
    output.writeln(header);
    output.writeln();
  }

  for (final parser in parsers) {
    parser.build(context);
  }

  output.writeln(context.output);
  if (footer != null) {
    output.writeln(footer);
    output.writeln();
  }

  if (addErrorMessageCode) {
    output.writeln(runtime.errorMessageTemplate);
  }

  if (addRuntimeCode) {
    output.writeln(runtime.runtimeTemplate);
  }

  File(filename).writeAsStringSync(output.toString());
  if (format) {
    final process =
        await Process.start(Platform.executable, ['format', filename]);
    unawaited(process.stdout.transform(utf8.decoder).forEach(print));
    unawaited(process.stderr.transform(utf8.decoder).forEach(print));
  }
}
