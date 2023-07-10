import 'build_context.dart';

abstract interface class Calculable<T> {
  String calculate(BuildContext context, List<String> arguments);
}
