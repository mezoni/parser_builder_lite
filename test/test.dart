import 'package:test/test.dart';

import 'test_parser.dart';

void main() {
  _testInRangeFunc();
  _testNotInRangeFunc();
  _testSwitchTag();
}

Result<O>? parse<I, O>(
    Result<O>? Function(State<I> state) parser, State<I> state) {
  return parser(state);
}

String _getReason(String subject, State<String> state) {
  return 'Subject: $subject\nsource: ${state.source}';
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
