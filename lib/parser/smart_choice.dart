import '../expr.dart';
import '../parser_builder.dart';
import 'smart_choice_ex.dart';

class SmartChoice<O> extends ParserBuilder<String, O> {
  final List<ParserBuilder<String, O>> ps;

  const SmartChoice(this.ps);

  @override
  String buildBody(BuildContext context) {
    return _getSmartChoiceEx(context).buildBody(context);
  }

  @override
  List<(int, int)> getStartCharacters(BuildContext context) {
    return _getSmartChoiceEx(context).getStartCharacters(context);
  }

  @override
  List<String> getStartErrors(BuildContext context) {
    return _getSmartChoiceEx(context).getStartErrors(context);
  }

  SmartChoiceEx<String, O> _getSmartChoiceEx(BuildContext context) {
    var is32bit = false;
    for (final p in ps) {
      final chars = p.getStartCharacters(context);
      if (chars.isEmpty) {
        is32bit = true;
        break;
      }

      if (chars.any((e) => e.$1 > 0xffff || e.$2 > 0xffff)) {
        is32bit = true;
        break;
      }
    }

    const check =
        '{{0}}.pos < {{0}}.input.length ? {{0}}.input.{{reader}}({{0}}.pos) : null';
    final reader = is32bit ? 'runeAt' : 'codeUnitAt';
    final peek = check.replaceAll('{{reader}}', reader);
    return SmartChoiceEx(Expr(peek), ps);
  }
}
