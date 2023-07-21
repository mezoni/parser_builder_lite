import '../allocator.dart';
import '../function_builder.dart';
import '../helper.dart';
import '../parser_builder.dart';

class Named<I, O> extends ParserBuilder<I, O> {
  static const _template = '''
@r = @name(state);''';

  static const _templateNoResult = '''
@name(state);''';

  @override
  final String name;

  final ParserBuilder<I, O> p;

  const Named(this.name, this.p);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    _generate(context);
    return renderBody(
      this,
      context,
      hasResult,
      _template,
      _templateNoResult,
      {'name': name},
    );
  }

  @override
  Iterable<(ParserBuilder<I, Object?>, bool?)> getCombinedParsers() {
    return [(p, true)];
  }

  @override
  String toString() {
    return '$name($p)';
  }

  void _generate(BuildContext context) {
    FunctionBuilder().build(context, this, () {
      final allocator = context.localAllocator;
      context.localAllocator = Allocator(allocator.prefix);
      final result = p.build(context, true);
      final buffer = StringBuffer();
      buffer.writeln(result.source);
      buffer.write('return ${result.result};');
      context.localAllocator = allocator;
      return (
        body: buffer.toString(),
        name: name,
        parameters: 'State<$I> state',
        type: getResultType(),
      );
    });
  }
}
