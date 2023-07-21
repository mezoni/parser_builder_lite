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
final @input = state.input;
final @list = <String>[];
var @str = '';
while (state.pos < @input.length) {
  final @pos = state.pos;
  @str = '';
  var c = -1;
  while (state.pos < @input.length) {
    c = @input.runeAt(state.pos);
    final ok = @normalChar;
    if (!ok) {
      break;
    }
    state.pos += c < 0xffff ? 1 : 2;
  }
  if (state.pos != @pos) {
    @str = @input.substring(@pos, state.pos);
    if (@list.isNotEmpty) {
      @list.add(@str);
    }
  }
  if (c != @controlChar) {
    break;
  }
  state.pos += @size;
  @p1
  if (!state.ok) {
    state.pos = @pos;
    break;
  }
  if (@list.isEmpty && @str != '') {
    @list.add(@str);
  }
  @list.add(@rv1);
}
state.ok = true;
if (@list.isEmpty) {
  @r = @str;
} else {
  @r = @list.join();
}''';

  static const _templateNoResult = '''
final @input = state.input;
final @list = <String>[];
var @str = '';
while (state.pos < @input.length) {
  final @pos = state.pos;
  @str = '';
  var c = -1;
  while (state.pos < @input.length) {
    c = @input.runeAt(state.pos);
    final ok = @normalChar;
    if (!ok) {
      break;
    }
    state.pos += c < 0xffff ? 1 : 2;
  }
  if (state.pos != @pos) {
    @str = @input.substring(@pos, state.pos);
    if (@list.isNotEmpty) {
      @list.add(@str);
    }
  }
  if (c != @controlChar) {
    break;
  }
  state.pos += @size;
  @p1
  if (!state.ok) {
    state.pos = @pos;
    break;
  }
  if (@list.isEmpty && @str != '') {
    @list.add(@str);
  }
  @list.add(@rv1);
}
state.ok = true;''';

  final int controlChar;

  final ParserBuilder<String, String> escape;

  final Calculable<bool> normalChar;

  const StringChars(this.normalChar, this.controlChar, this.escape);

  @override
  BuildBodyResult buildBody(BuildContext context, bool hasResult) {
    final size = controlChar > 0xffff ? 2 : 1;
    return renderBody(
      this,
      context,
      hasResult,
      _template,
      _templateNoResult,
      {
        'controlChar': '$controlChar',
        'normalChar': normalChar.calculate(context, ['c']),
        'size': '$size',
      },
      parsers: [(escape, true)],
    );
  }
}
