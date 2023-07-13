import '../calculable.dart';
import '../helper.dart';
import '../parser_builder.dart';

/// Parses the string characters using the [normalChar] predicate to
/// parse regular (unescaped) characters, using the [controlChar] character to
/// match an escape character, and the [escape] parser to parse the
/// interpretation of the escape sequence.
///
/// Example:
/// ```dart
/// StringValue(_isNormalChar, 0x5c, _escaped);
/// ```
class StringChars extends ParserBuilder<String, String> {
  static const _template = '''
final input = state.input;
final list = <String>[];
var str = '';
while (state.pos < input.length) {
  final pos = state.pos;
  str = '';
  var c = -1;
  while (state.pos < input.length) {
    c = input.runeAt(state.pos);
    final ok = {{normalChar}};
    if (!ok) {
      break;
    }
    state.pos += c < 0xffff ? 1 : 2;
  }
  if (state.pos != pos) {
    str = input.substring(pos, state.pos);
    if (list.isNotEmpty) {
      list.add(str);
    }
  }
  if (c != {{controlChar}}) {
    break;
  }
  state.pos += {{size}};
  final r1 = {{p1}}(state);
  if (r1 == null) {
    state.pos = pos;
    break;
  }
  if (list.isEmpty && str != '') {
    list.add(str);
  }
  list.add(r1.value);
}
if (list.isEmpty) {
  return Result(str);
} else {
  return  Result(list.join());
}''';

  final int controlChar;

  final ParserBuilder<String, String> escape;

  final Calculable<bool> normalChar;

  const StringChars(this.normalChar, this.controlChar, this.escape);

  @override
  String buildBody(BuildContext context) {
    final size = controlChar > 0xffff ? 2 : 1;
    return render(_template, {
      'controlChar': '$controlChar',
      'normalChar': normalChar.calculate(context, ['c']),
      'p1': escape.build(context).name,
      'size': '$size',
    });
  }
}
