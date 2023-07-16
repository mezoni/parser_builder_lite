class Token<T> {
  final int end;

  final TokenKind kind;

  final String source;

  final int start;

  final T value;

  const Token({
    required this.end,
    required this.kind,
    required this.source,
    required this.start,
    required this.value,
  });

  @override
  String toString() {
    return source.substring(start, end);
  }
}

enum TokenKind {
  closeBrace,
  closeBracket,
  closeParenthesis,
  comma,
  colon,
  double,
  else$,
  for$,
  identifiers,
  if$,
  integer,
  openBrace,
  openBracket,
  openParenthesis,
  semicolon,
  string,
}
