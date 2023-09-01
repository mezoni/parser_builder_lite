## 0.7.3

- Fixed bugs in the implementation of parsers `SkipWhile` and `SkipWhile1`.

## 0.7.2

- Fixed bugs

## 0.7.1

- Added `InRangeExcept` predicate. It works like a combination of `NotInRange` and `InRange`. It is not the best way, but it is much better than parsing using a combination of multiple parsers.
- Added `TakeUntil` parser.

## 0.7.0

- New version with breaking changes. Now the generated parsers are faster than ever. Even faster than those that are written by hand.

## 0.6.11

- Added `context` field to `State` class to implement the ability of implementing configurable parsers.
- Fixed bugs

## 0.6.10

- Improvements have been made in code generation.

## 0.6.9

- Added parser builder `SmartChoiceEx`. It can be used not only with string data, but with any data type, which allows you to specify the type of starting characters as integer values (e.g. `TokenKind`). The `SmartChoice` parser builder is based on this builder.

## 0.6.8

- Improved implementation of `SmartChoice`. The restriction on the type and number of starting characters has been removed.

## 0.6.7

- Improved implementation of `InRange` and `NotInRange` predicates.

## 0.6.6

- Added some API documentation.

## 0.6.5

- Added `Number` parser builder.

## 0.6.4

- The functionality for determining start characters and start errors has been implemented.
- The `SmartChoice` parser builder has been implemented. It increases the performance of parsing by looking one character ahead. Now the overall performance of the generated parsers has become even higher.

## 0.6.3

- Changes in parser builder `HandleError`.

## 0.6.2

- Unified the way to create parser builders that generate custom errors. For these purposes, a universal, fairly complex parser builder was created. This eliminates mistakes when implementing parser builders that generate custom errors. This drastically simplifies the implementation of error handlers such as `unterminated`, `malformed`, `expected`, `replace_errors` and other similar (which can replace errors), since it is very easy to determine the location of the error (for example, to find out the error occurred at the starting position or later) and replace errors (or add to existing).

## 0.6.1

- Fixed bugs.

## 0.6.0

- Breaking changes. The `State.source` field has been renamed to `State.input`.
- Added initial support for parsing byte data (via `ByteData`).

## 0.5.2

- A fast and efficient universal parser for string characters has been implemented.
- Changes have been made to the JSON parser example. At the moment it is quite fast.

## 0.5.0

- Breaking changes. Simplified and improved algorithms and structures used for building parsers.
- Added the initial version of the parser tester generator.
- The process of testing parsers has begun (using the new parser tester generator.).

## 0.4.1

- Added method `State.failAt()`

## 0.4.0

- Breaking changes. Reduced `parser_builder.dart` file size to 3 kb. This is the main, and only, build and type declaration file for building parsers. The building process has been simplified, and at the same time, the building process has been improved. It will now take a few minutes to understand how the build process works.

## 0.3.0

- Breaking changes. Changes have been made to enable code generation in the global context at build time.
- Added support for parsing ranges.
- Added support for arbitrary global code generation.

## 0.2.4

- Added file `fast_build.dart`.

## 0.2.3

- Fixed bugs.
- Minor performance improvements have been made.

## 0.2.2

- Small changes in the `_errorMessage` template.

## 0.2.1

- Public release.