import 'build_context.dart';
import 'build_result.dart';
import 'function_builder.dart';

export 'build_context.dart';

abstract class ParserBuilder<I, O> {
  const ParserBuilder();

  String? get name => null;

  BuildResult build(BuildContext context) {
    final name = this.name ?? context.allocator.allocate();
    final body = buildBody(context);
    return const FunctionBuilder()
        .build(context, this, 'Result<$O>?', name, 'State<$I> state', body);
  }

  String buildBody(BuildContext context);

  String getResultType() {
    final name = '$O';
    final isNullable = isNullableResultType();
    final result = isNullable ? name : '$name?';
    return result;
  }

  String getResultValue(String name) {
    if (name.isEmpty) {
      throw StateError('The name must not be empty');
    }

    final isNullable = isNullableResultType();
    return (isNullable ? name : '$name!');
  }

  List<(int, int)> getStartCharacters(BuildContext context) {
    final parser = getStartParser(context);
    if (parser == null) {
      return const [];
    }

    return parser.getStartCharacters(context);
  }

  List<String> getStartErrors(BuildContext context) {
    final parser = getStartParser(context);
    if (parser == null) {
      return const [];
    }

    return parser.getStartErrors(context);
  }

  ParserBuilder<I, Object?>? getStartParser(BuildContext context) {
    return null;
  }

  bool isNullableResultType() {
    final result = isNullableType<O>();
    return result;
  }

  bool isNullableType<T>() {
    try {
      // ignore: unused_local_variable
      final T val = null as T;
    } catch (e) {
      return false;
    }

    return true;
  }
}
