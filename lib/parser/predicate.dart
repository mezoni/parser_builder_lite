import '../ranges.dart';

const isAlpha = InRange([('A', 'Z'), ('a', 'z')]);

const isAlphanumeric = InRange([('0', '9'), ('A', 'Z'), ('a', 'z')]);

const isDigit = InRange([('0', '9')]);

const isHexDigit = InRange([('0', '9'), ('A', 'F'), ('a', 'f')]);
