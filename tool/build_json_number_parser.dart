import 'package:parser_builder_lite/allocator.dart';
import 'package:parser_builder_lite/expr.dart';
import 'package:parser_builder_lite/fast_build.dart';
import 'package:parser_builder_lite/helper.dart';
import 'package:parser_builder_lite/parser/delimited.dart';
import 'package:parser_builder_lite/parser/eof.dart';
import 'package:parser_builder_lite/parser/named.dart';
import 'package:parser_builder_lite/parser/skip_while.dart';
import 'package:parser_builder_lite/parser/terminated.dart';
import 'package:parser_builder_lite/parser_builder.dart';

Future<void> main(List<String> args) async {
  final context = BuildContext(
    allocator: Allocator('_'),
    output: StringBuffer(),
  );
  await fastBuild(
    context: context,
    parsers: [_parser],
    filename: 'test/_json_number_parser.dart',
    // addErrorMessageCode: false,
    header: __header,
  );
}

const parser = Number();

const __header = r'''
void main() {
    const s = '100000.00123e3';
    final x = double.parse(s);
    print(s);
    print(x);
    final r = parse(s);
    print(r);
}

num? parse(String input) {
  final state = State(input);
  final r = number(state);
  if (r == null) {
    final message = _errorMessage(input, state.pos, state.errors);
    throw FormatException('\n$message');
  }
  return r.value;
}''';

const _isWhitespace =
    Expr<bool>('{{0}} == 0x9 || {{0}} == 0xa || {{0}} == 0xd || {{0}} == 0x20');

const _number = Terminated(parser, _ws);

const _parser = Named<String, num>('number', Delimited(_ws, _number, Eof()));

const _ws = Named('_ws', SkipWhile(_isWhitespace));

class Number extends ParserBuilder<String, num> {
  static const _template = '''
  final start = state.pos;
  final input = state.input;
  num? v;
  while (true) {
    //  '-'?('0'|[1-9][0-9]*)('.'[0-9]+)?([eE][+-]?[0-9]+)?
    const eof = 0x110000;
    const mask = 0x30;
    const powersOfTen = [
      1.0,
      1e1,
      1e2,
      1e3,
      1e4,
      1e5,
      1e6,
      1e7,
      1e8,
      1e9,
      1e10,
      1e11,
      1e12,
      1e13,
      1e14,
      1e15,
      1e16,
      1e17,
      1e18,
      1e19,
      1e20,
      1e21,
      1e22,
    ];
    final length = input.length;
    var pos = state.pos;
    var c = eof;
    if (pos < length) {
      c = input.codeUnitAt(pos);
    } else {
      c = eof;
    }
    var hasSign = false;
    if (c == 0x2d) {
      pos++;
      if (pos < length) {
        c = input.codeUnitAt(pos);
      } else {
        c = eof;
      }
      hasSign = true;
    }
    var digit = c ^ mask;
    if (digit > 9) {
      v = null;
      state.pos = pos;
      break;
    }
    final intPartPos = pos;
    var intPartLen = 0;
    intPartLen = 1;
    var intValue = 0;
    if (digit == 0) {
      pos++;
      if (pos < length) {
        c = input.codeUnitAt(pos);
      } else {
        c = eof;
      }
    } else {
      pos++;
      if (pos < length) {
        c = input.codeUnitAt(pos);
      } else {
        c = eof;
      }
      intValue = digit;
      while (true) {
        digit = c ^ mask;
        if (digit > 9) {
          break;
        }
        pos++;
        if (pos < length) {
          c = input.codeUnitAt(pos);
        } else {
          c = eof;
        }
        if (intPartLen++ < 18) {
          intValue = intValue * 10 + digit;
        }
      }
    }
    var hasDot = false;
    var decPartLen = 0;
    var decValue = 0;
    if (c == 0x2e) {
      pos++;
      if (pos < length) {
        c = input.codeUnitAt(pos);
      } else {
        c = eof;
      }
      hasDot = true;
      digit = c ^ mask;
      if (digit > 9) {
        v = null;
        state.pos = pos;
        break;
      }
      pos++;
      if (pos < length) {
        c = input.codeUnitAt(pos);
      } else {
        c = eof;
      }
      decPartLen = 1;
      decValue = digit;
      while (true) {
        digit = c ^ mask;
        if (digit > 9) {
          break;
        }
        pos++;
        if (pos < length) {
          c = input.codeUnitAt(pos);
        } else {
          c = eof;
        }
        if (decPartLen++ < 18) {
          decValue = decValue * 10 + digit;
        }
      }
    }
    var hasExp = false;
    var hasExpSign = false;
    var expPartLen = 0;
    var exp = 0;
    if (c == 0x45 || c == 0x65) {
      pos++;
      if (pos < length) {
        c = input.codeUnitAt(pos);
      } else {
        c = eof;
      }
      hasExp = true;
      switch (c) {
        case 0x2b:
          pos++;
          if (pos < length) {
            c = input.codeUnitAt(pos);
          } else {
            c = eof;
          }
          break;
        case 0x2d:
          pos++;
          if (pos < length) {
            c = input.codeUnitAt(pos);
          } else {
            c = eof;
          }
          hasExpSign = true;
          break;
      }
      digit = c ^ mask;
      if (digit > 9) {
        v = null;
        state.pos = pos;
        break;
      }
      pos++;
      if (pos < length) {
        c = input.codeUnitAt(pos);
      } else {
        c = eof;
      }
      expPartLen = 1;
      exp = digit;
      while (true) {
        digit = c ^ mask;
        if (digit > 9) {
          break;
        }
        pos++;
        if (pos < length) {
          c = input.codeUnitAt(pos);
        } else {
          c = eof;
        }
        if (expPartLen++ < 18) {
          exp = exp * 10 + digit;
        }
      }
      if (expPartLen > 18) {
        state.pos = pos;
        v = double.parse(input.substring(start, pos));
        break;
      }
      if (hasExpSign) {
        exp = -exp;
      }
    }
    state.pos = pos;
    final singlePart = !hasDot && !hasExp;
    if (singlePart && intPartLen <= 18) {
      v = hasSign ? -intValue : intValue;
      break;
    }
    if (singlePart && intPartLen == 19) {
      if (intValue == 922337203685477580) {
        final digit = input.codeUnitAt(intPartPos + 18) - 0x30;
        if (digit <= 7) {
          intValue = intValue * 10 + digit;
          v = hasSign ? -intValue : intValue;
          break;
        }
      }
    }
    var doubleValue = intValue * 1.0;
    var expRest = intPartLen - 18;
    expRest = expRest < 0 ? 0 : expRest;
    exp = expRest + exp;
    final modExp = exp < 0 ? -exp : exp;
    if (modExp > 22) {
      state.pos = pos;
      v = double.parse(input.substring(start, pos));
      break;
    }
    final k = powersOfTen[modExp];
    if (exp > 0) {
      doubleValue *= k;
    } else {
      doubleValue /= k;
    }
    if (decValue != 0) {
      var value = decValue * 1.0;
      final diff = exp - decPartLen;
      final modDiff = diff < 0 ? -diff : diff;
      final sign = diff < 0;
      var rest = modDiff;
      while (rest != 0) {
        var i = rest;
        if (i > 20) {
          i = 20;
        }
        rest -= i;
        final k = powersOfTen[i];
        if (sign) {
          value /= k;
        } else {
          value *= k;
        }
      }
      doubleValue += value;
    }
    v = hasSign ? -doubleValue : doubleValue;
    break;
  }
  if (v != null) {
    return Result(v);
  }
  final failPos = state.pos;
  state.pos = start;
  if (failPos < input.length) {
    return state.failAt(failPos, const ErrorUnexpectedChar());
  }
  return state.failAt(failPos, const ErrorUnexpectedEof());''';

  const Number();

  @override
  String buildBody(BuildContext context) {
    return render(_template, {});
  }
}