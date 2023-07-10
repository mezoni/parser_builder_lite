import 'build_context.dart';
import 'calculable.dart';

class Expr<T> implements Calculable<T> {
  final String closeTag;

  final String openTag;

  final String template;

  const Expr(this.template, [this.openTag = '{{', this.closeTag = '}}']);

  @override
  String calculate(BuildContext context, List<String> arguments) {
    var source = template;
    for (var i = 0; i < arguments.length; i++) {
      source = source.replaceAll('$openTag$i$closeTag', arguments[i]);
    }

    return source;
  }
}
