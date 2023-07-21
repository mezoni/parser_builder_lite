import '../expr.dart';
import '../helper.dart';
import '../parser_builder.dart';
import 'smart_choice_ex.dart';

class SmartChoice<O> extends ParserBuilder<String, O> {
  final List<ParserBuilder<String, O>> ps;

  const SmartChoice(this.ps);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    return _getSmartChoiceEx(context).buildBody(context, hasResult);
  }

  SmartChoiceEx<String, O> _getSmartChoiceEx(BuildContext context) {
    var is32bit = false;
    for (final p in ps) {
      final chars = p.getStartingCharacters();
      if (chars.isEmpty) {
        is32bit = true;
        break;
      }

      if (chars.any((e) => e.$1 > 0xffff || e.$2 > 0xffff)) {
        is32bit = true;
        break;
      }
    }

    final reader = getCharReader(!is32bit, 'c');
    const check =
        '{{0}}.pos < {{0}}.input.length ? {{0}}.input.{{reader}}({{0}}.pos) : null';
    final peek = check.replaceAll('{{reader}}', reader.name);
    return SmartChoiceEx(Expr(peek), ps);
  }
}
