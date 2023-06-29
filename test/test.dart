import 'package:test/test.dart';

import 'test_parser.dart';

void main() {
  _testInRangeFunc();
  _testNotInRangeFunc();
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
      final state = State('0');
      final result = parse(parser, state);
      expect(result, Result(state.source.codeUnitAt(0)),
          reason: _getReason(subject, state));
      expect(state.pos, 1, reason: _getReason(subject, state));
    }
    {
      final state = State('a');
      final result = parse(parser, state);
      expect(result, Result(state.source.codeUnitAt(0)),
          reason: _getReason(subject, state));
      expect(state.pos, 1, reason: _getReason(subject, state));
    }
    {
      final state = State('A');
      final result = parse(parser, state);
      expect(result, Result(state.source.codeUnitAt(0)),
          reason: _getReason(subject, state));
      expect(state.pos, 1, reason: _getReason(subject, state));
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
      final state = State('/');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(state.errors, [const ErrorUnexpectedChar()],
          reason: _getReason(subject, state));
    }
    {
      final state = State(':');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(state.errors, [const ErrorUnexpectedChar()],
          reason: _getReason(subject, state));
    }
    {
      final state = State('@');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(state.errors, [const ErrorUnexpectedChar()],
          reason: _getReason(subject, state));
    }
    {
      final state = State('[');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(state.errors, [const ErrorUnexpectedChar()],
          reason: _getReason(subject, state));
    }
    {
      final state = State('`');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(state.errors, [const ErrorUnexpectedChar()],
          reason: _getReason(subject, state));
    }
    {
      final state = State('{');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(state.errors, [const ErrorUnexpectedChar()],
          reason: _getReason(subject, state));
    }
  });
}

void _testNotInRangeFunc() {
  const subject = 'NotInRangeFunc';
  test(subject, () {
    const parser = inAlphanumericRange;
    {
      final state = State('0');
      final result = parse(parser, state);
      expect(result, Result(state.source.codeUnitAt(0)),
          reason: _getReason(subject, state));
      expect(state.pos, 1, reason: _getReason(subject, state));
    }
    {
      final state = State('a');
      final result = parse(parser, state);
      expect(result, Result(state.source.codeUnitAt(0)),
          reason: _getReason(subject, state));
      expect(state.pos, 1, reason: _getReason(subject, state));
    }
    {
      final state = State('A');
      final result = parse(parser, state);
      expect(result, Result(state.source.codeUnitAt(0)),
          reason: _getReason(subject, state));
      expect(state.pos, 1, reason: _getReason(subject, state));
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
      final state = State('/');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(state.errors, [const ErrorUnexpectedChar()],
          reason: _getReason(subject, state));
    }
    {
      final state = State(':');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(state.errors, [const ErrorUnexpectedChar()],
          reason: _getReason(subject, state));
    }
    {
      final state = State('@');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(state.errors, [const ErrorUnexpectedChar()],
          reason: _getReason(subject, state));
    }
    {
      final state = State('[');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(state.errors, [const ErrorUnexpectedChar()],
          reason: _getReason(subject, state));
    }
    {
      final state = State('`');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(state.errors, [const ErrorUnexpectedChar()],
          reason: _getReason(subject, state));
    }
    {
      final state = State('{');
      final result = parse(parser, state);
      expect(result, null, reason: _getReason(subject, state));
      expect(state.failPos, 0, reason: _getReason(subject, state));
      expect(state.errors, [const ErrorUnexpectedChar()],
          reason: _getReason(subject, state));
    }
  });
}
