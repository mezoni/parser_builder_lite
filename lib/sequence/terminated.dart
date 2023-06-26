import '../parser_builder.dart';

class Terminated<I, O> extends ParserBuilder<I, O> {
  final ParserBuilder<I, O> parser;

  final ParserBuilder<I, dynamic> terminate;

  const Terminated(this.parser, this.terminate);

  @override
  String get template => '''
final pos = state.pos;
final r1 = {{p1}};
if (r1 != null) {
  final r2 = {{p2}};
  if (r2 != null) {
    return r1;
  }
  state.pos = pos;
}
return null;''';

  @override
  Map<String, Object?> get values => {
        'p1': parser,
        'p2': terminate,
      };
}
