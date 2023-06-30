import 'package:test/test.dart';

import 'test_parser.dart';

void main() {
  _testDelimited();
  _testInRangeFunc();
  _testNotInRangeFunc();
  _testPreceded();
  _testSkip();
  _testSwitchTag();
  _testTerminated();
  _testTuple2();
  _testTuple3();
  _testTuple4();
  _testTuple5();
  _testTuple6();
  _testTuple7();
}

Result<O>? parse<I, O>(
    Result<O>? Function(State<I> state) parser, State<I> state) {
  return parser(state);
}

String _getReason(String subject, State<String> state) {
  return 'Subject: $subject\nsource: ${state.source}';
}

void _testDelimited() {
  const subject = 'Delimited';
  test(subject, () {
    const parser = delimited;
    {
      const source = '123';
      final state = State(source);
      final result = parse(parser, state);
      expect(result, Result('2'), reason: _getReason(subject, state));
      expect(state.pos, source.length, reason: _getReason(subject, state));
    }
    {
      final state = State('');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(
          state.errors,
          [
            const ErrorExpectedTags(['1'])
          ],
          reason: _getReason(subject, state));
    }
    {
      const source = ' ';
      final state = State(source);
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(
          state.errors,
          [
            const ErrorExpectedTags(['1'])
          ],
          reason: _getReason(subject, state));
    }
  });
}

void _testInRangeFunc() {
  const subject = 'InRangeFunc';
  test(subject, () {
    const parser = inAlphanumericRange;
    {
      final sources = [
        '0',
        '9',
        'a',
        'z',
        'A',
        'Z',
      ];
      for (final source in sources) {
        final state = State(source);
        final result = parse(parser, state);
        expect(result, Result(source.codeUnitAt(0)),
            reason: _getReason(subject, state));
        expect(state.pos, 1, reason: _getReason(subject, state));
      }
    }
    {
      final state = State('');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(state.errors, [const ErrorUnexpectedEof()],
          reason: _getReason(subject, state));
    }
    {
      final sources = [
        '/',
        ':',
        '@',
        '[',
        '`',
        '{',
      ];
      for (final source in sources) {
        final state = State(source);
        final result = parse(parser, state);
        expect(result, null, reason: _getReason(subject, state));
        expect(state.failPos, 0, reason: _getReason(subject, state));
        expect(state.errors, [const ErrorUnexpectedChar()],
            reason: _getReason(subject, state));
      }
    }
  });
}

void _testNotInRangeFunc() {
  const subject = 'NotInRangeFunc';
  test(subject, () {
    const parser = notInAlphanumericRange;
    {
      final sources = [
        '0',
        '9',
        'a',
        'z',
        'A',
        'Z',
      ];
      for (final source in sources) {
        final state = State(source);
        final result = parse(parser, state);
        expect(result, null, reason: _getReason(subject, state));
        expect(state.failPos, 0, reason: _getReason(subject, state));
        expect(state.errors, [const ErrorUnexpectedChar()],
            reason: _getReason(subject, state));
      }
    }
    {
      final state = State('');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(state.errors, [const ErrorUnexpectedEof()],
          reason: _getReason(subject, state));
    }
    {
      final sources = [
        '/',
        ':',
        '@',
        '[',
        '`',
        '{',
      ];
      for (final source in sources) {
        final state = State(source);
        final result = parse(parser, state);
        expect(result, Result(state.source.codeUnitAt(0)),
            reason: _getReason(subject, state));
        expect(state.pos, 1, reason: _getReason(subject, state));
      }
    }
  });
}

void _testPreceded() {
  const subject = 'Preceded';
  test(subject, () {
    const parser = preceded;
    {
      const source = '12';
      final state = State(source);
      final result = parse(parser, state);
      expect(result, Result('2'), reason: _getReason(subject, state));
      expect(state.pos, source.length, reason: _getReason(subject, state));
    }
    {
      final state = State('');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(
          state.errors,
          [
            const ErrorExpectedTags(['1'])
          ],
          reason: _getReason(subject, state));
    }
    {
      const source = ' ';
      final state = State(source);
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(
          state.errors,
          [
            const ErrorExpectedTags(['1'])
          ],
          reason: _getReason(subject, state));
    }
  });
}

void _testSkip() {
  const subject = 'Skip';
  test(subject, () {
    const parser = skip1;
    {
      const source = '12';
      final state = State(source);
      final result = parse(parser, state);
      expect(result, Result<Object?>(null), reason: _getReason(subject, state));
      expect(state.pos, 1, reason: _getReason(subject, state));
    }
    {
      final state = State('');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(
          state.errors,
          [
            const ErrorExpectedTags(['1'])
          ],
          reason: _getReason(subject, state));
    }
    {
      const source = ' ';
      final state = State(source);
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(
          state.errors,
          [
            const ErrorExpectedTags(['1'])
          ],
          reason: _getReason(subject, state));
    }
  });

  test(subject, () {
    const parser = skip2;
    {
      const source = '123';
      final state = State(source);
      final result = parse(parser, state);
      expect(result, Result<Object?>(null), reason: _getReason(subject, state));
      expect(state.pos, 2, reason: _getReason(subject, state));
    }
    {
      final state = State('');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(
          state.errors,
          [
            const ErrorExpectedTags(['1'])
          ],
          reason: _getReason(subject, state));
    }
    {
      const source = ' ';
      final state = State(source);
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(
          state.errors,
          [
            const ErrorExpectedTags(['1'])
          ],
          reason: _getReason(subject, state));
    }
  });

  test(subject, () {
    const parser = skip3;
    {
      const source = '1234';
      final state = State(source);
      final result = parse(parser, state);
      expect(result, Result<Object?>(null), reason: _getReason(subject, state));
      expect(state.pos, 3, reason: _getReason(subject, state));
    }
    {
      final state = State('');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(
          state.errors,
          [
            const ErrorExpectedTags(['1'])
          ],
          reason: _getReason(subject, state));
    }
    {
      const source = ' ';
      final state = State(source);
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(
          state.errors,
          [
            const ErrorExpectedTags(['1'])
          ],
          reason: _getReason(subject, state));
    }
  });
}

void _testSwitchTag() {
  const subject = 'SwitchTag';
  test(subject, () {
    const parser = switchTag;
    {
      final sources = [
        'a',
        'ab',
        'abc',
        'b',
        'cde',
      ];
      for (final source in sources) {
        final state = State(source);
        final result = parse(parser, state);
        expect(result, Result(source), reason: _getReason(subject, state));
        expect(state.pos, source.length, reason: _getReason(subject, state));
      }

      for (final source in sources) {
        final source2 = '$source ';
        final state = State(source2);
        final result = parse(parser, state);
        expect(result, Result(source), reason: _getReason(subject, state));
        expect(state.pos, source.length, reason: _getReason(subject, state));
      }
    }
    {
      final state = State('');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(state.errors, [const ErrorMessage(1, 'error')],
          reason: _getReason(subject, state));
    }
    {
      final sources = [
        'x',
        'xy',
        'xyz',
        'y',
        'z',
      ];
      for (final source in sources) {
        final state = State(source);
        final result = parse(parser, state);
        expect(result, null, reason: _getReason(subject, state));
        expect(state.failPos, 0, reason: _getReason(subject, state));
        expect(state.errors, [const ErrorMessage(1, 'error')],
            reason: _getReason(subject, state));
      }
    }
  });
}

void _testTerminated() {
  const subject = 'Terminated';
  test(subject, () {
    const parser = terminated;
    {
      const source = '12';
      final state = State(source);
      final result = parse(parser, state);
      expect(result, Result('1'), reason: _getReason(subject, state));
      expect(state.pos, source.length, reason: _getReason(subject, state));
    }
    {
      final state = State('');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(
          state.errors,
          [
            const ErrorExpectedTags(['1'])
          ],
          reason: _getReason(subject, state));
    }
    {
      const source = ' ';
      final state = State(source);
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(
          state.errors,
          [
            const ErrorExpectedTags(['1'])
          ],
          reason: _getReason(subject, state));
    }
  });
}

void _testTuple2() {
  const subject = 'Tuple2';
  test(subject, () {
    const parser = tuple2;
    {
      const source = '12';
      final state = State(source);
      final result = parse(parser, state);
      expect(result, Result(('1', '2')), reason: _getReason(subject, state));
      expect(state.pos, source.length, reason: _getReason(subject, state));
    }
    {
      final state = State('');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(
          state.errors,
          [
            const ErrorExpectedTags(['1'])
          ],
          reason: _getReason(subject, state));
    }
    {
      const source = ' ';
      final state = State(source);
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(
          state.errors,
          [
            const ErrorExpectedTags(['1'])
          ],
          reason: _getReason(subject, state));
    }
  });
}

void _testTuple3() {
  const subject = 'Tuple3';
  test(subject, () {
    const parser = tuple3;
    {
      const source = '123';
      final state = State(source);
      final result = parse(parser, state);
      expect(result, Result(('1', '2', '3')),
          reason: _getReason(subject, state));
      expect(state.pos, source.length, reason: _getReason(subject, state));
    }
    {
      final state = State('');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(
          state.errors,
          [
            const ErrorExpectedTags(['1'])
          ],
          reason: _getReason(subject, state));
    }
    {
      const source = ' ';
      final state = State(source);
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(
          state.errors,
          [
            const ErrorExpectedTags(['1'])
          ],
          reason: _getReason(subject, state));
    }
  });
}

void _testTuple4() {
  const subject = 'Tuple4';
  test(subject, () {
    const parser = tuple4;
    {
      const source = '1234';
      final state = State(source);
      final result = parse(parser, state);
      expect(result, Result(('1', '2', '3', '4')),
          reason: _getReason(subject, state));
      expect(state.pos, source.length, reason: _getReason(subject, state));
    }
    {
      final state = State('');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(
          state.errors,
          [
            const ErrorExpectedTags(['1'])
          ],
          reason: _getReason(subject, state));
    }
    {
      const source = ' ';
      final state = State(source);
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(
          state.errors,
          [
            const ErrorExpectedTags(['1'])
          ],
          reason: _getReason(subject, state));
    }
  });
}

void _testTuple5() {
  const subject = 'Tuple5';
  test(subject, () {
    const parser = tuple5;
    {
      const source = '12345';
      final state = State(source);
      final result = parse(parser, state);
      expect(result, Result(('1', '2', '3', '4', '5')),
          reason: _getReason(subject, state));
      expect(state.pos, source.length, reason: _getReason(subject, state));
    }
    {
      final state = State('');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(
          state.errors,
          [
            const ErrorExpectedTags(['1'])
          ],
          reason: _getReason(subject, state));
    }
    {
      const source = ' ';
      final state = State(source);
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(
          state.errors,
          [
            const ErrorExpectedTags(['1'])
          ],
          reason: _getReason(subject, state));
    }
  });
}

void _testTuple6() {
  const subject = 'Tuple6';
  test(subject, () {
    const parser = tuple6;
    {
      const source = '123456';
      final state = State(source);
      final result = parse(parser, state);
      expect(result, Result(('1', '2', '3', '4', '5', '6')),
          reason: _getReason(subject, state));
      expect(state.pos, source.length, reason: _getReason(subject, state));
    }
    {
      final state = State('');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(
          state.errors,
          [
            const ErrorExpectedTags(['1'])
          ],
          reason: _getReason(subject, state));
    }
    {
      const source = ' ';
      final state = State(source);
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(
          state.errors,
          [
            const ErrorExpectedTags(['1'])
          ],
          reason: _getReason(subject, state));
    }
  });
}

void _testTuple7() {
  const subject = 'Tuple7';
  test(subject, () {
    const parser = tuple7;
    {
      const source = '1234567';
      final state = State(source);
      final result = parse(parser, state);
      expect(result, Result(('1', '2', '3', '4', '5', '6', '7')),
          reason: _getReason(subject, state));
      expect(state.pos, source.length, reason: _getReason(subject, state));
    }
    {
      final state = State('');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(
          state.errors,
          [
            const ErrorExpectedTags(['1'])
          ],
          reason: _getReason(subject, state));
    }
    {
      const source = ' ';
      final state = State(source);
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(
          state.errors,
          [
            const ErrorExpectedTags(['1'])
          ],
          reason: _getReason(subject, state));
    }
  });
}
