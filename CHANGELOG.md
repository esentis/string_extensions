# [0.6.7] - New Extensions & Optimizations

#### New methods

- `isSwiftCode` : A static method to check whether the provided `String` is a valid Swift code. [Source](https://en.wikipedia.org/wiki/ISO_9362#:~:text=The%20SWIFT%20code%20is%208,institution%20code%20or%20bank%20code.&text=if%20the%20second%20character%20is,used%20on%20the%20live%20network.)
- `digitCount` : A static method to count (if any) digits in the `String`
- `isAscii` : A static method to check whether a `String` is consisted only from ASCII characters
- `isAnagramOf(String s)` : A static method to check whether the provided `s` `String` is anagram of the extended `String`
- `isPalindrome` : A static method to check whether the `String` is palindrome
- `isMixedCase` : A static method to check whether the `String` is consisted of both upper & lower case letters

#### Optimized methods

- Optimizes `replaceGreek` method
- Optimizes `toGreekUppercase` method
- Optimizes `getLevenshtein` by using Wagner-Fisher algorithm

## [0.6.6] - New Extensions

- `isIban` : A static method to check whether the provided `String` is a valid IBAN. [Source](https://www.iban.com/structure)
- `isGreekId` : A static method to check whether the provided `String` is a valid Greek Identification Number. [Source](https://en.wikipedia.org/wiki/National_identification_number#Greece)
- `isLowerCase` : Checks whether the `String` is in upper case
- `isUpperCase` : Checks whether the `String` is in lower case
- `swapCase()` : Swaps the case in the `String`.

```dart
String foo = 'Hello World';
String swapped = foo.swapCase(); // returns 'hELLO wORLD'
```

## [0.6.5] - Code Improvements

Updates project dependencies, to improve pub.dev score.

## [0.6.4] - New Extensions

- `toGreekUpperCase()` : Properly uppercases Greek letters, removing the tones.

```dart
String greek = 'Τι κάνεις πώς τα περνάς φίλτατέ μου';
String wrongUpperCase = greek.toUpperCase(); // returns 'ΤΙ ΚΆΝΕΙΣ ΠΏΣ ΤΑ ΠΕΡΝΆΣ ΦΊΛΤΑΤΈ ΜΟΥ'
String correctUpperCase = greek.toGreekUpperCase(); // returns 'ΤΙ ΚΑΝΕΙΣ ΠΩΣ ΤΑ ΠΕΡΝΑΣ ΦΙΛΤΑΤΕ ΜΟΥ'
```

## [0.6.3] - Bug Fixes & Documentation improvements

- Fixes `truncate(length)` method. If the `String` is equal to `length` then the `String` should be returned as it is.

## [0.6.2] - New Extensions & Documentation improvements

- `toLeet` : Transform the `String` to 1337 alphabet. The letters are randomized since each letter can have multiple variations.

```dart
String foo = 'esentis';
String leet = foo.toLeet ; // returns '€5£п+!$'
```

- `isCreditCard` : Checks if the provided `String` is a valid credit card number using Luhn algorithm
- `removeWhiteSpace` : Removes all white space from the provided `String`.

## [0.6.1] - New Extensions

- `formatFileSize` : Formats a `String` representing bytes to show the proper file size.

```dart
String foo = '24117248';
String formatted = foo.formatFileSize; // returns '23 MB'
```

- `replaceAtIndex(index,replacement)` : Adds a [replacement] at the [index] of the `String`.
- `removeSpecial` : Removes all special characters from the `String`. [Issue #22](https://github.com/esentis/string_extensions/issues/22)
- `onlyLetters` : Removes everything but characters from the `String`.[Issue #21](https://github.com/esentis/string_extensions/issues/21)

## [0.6.0] - Breaking Changes, New Extensions & Bug Fixes

- Project depends on `crypto` (`3.0.2`) due to new `md5` method wich returns the MD5 hash of the `String`.
- Bug fixes for various methods, `after`, `before`, `toTitleCase`, `openCloseWrappers`, `removeFirstAndLastAny`.
- Various improvements.

## [0.5.1] - Bug fix

- Fixes `titleCase` not trimming whitespaces.

## [0.5.0] - Breaking Changes & New Extensions

- All methods will now trim the `String` before operations.
- `toSnakeCase` : Converts a `String` to snake case format.

## [0.4.5] - New extensions

- `addAfter` : Adds a `String` after the first occurence of a specific pattern.
- `addBefore` : Adds a `String` before the first occurence of a specific pattern.

## [0.4.4] - New Extensions

- `removeAfter` : Removes everything after the first occurence of a specific pattern.

- `removeBefore` : Removes everything before the first occurence of a specific pattern.

Thanks to [zonaro](https://github.com/zonaro)

- `wrap` : Wraps a `String` between two `String`s.

- `getOppositeChar` : Returns the opposite wrap char of the `String`.

- `isOpenWrapChar` : Check if `String` is a open wrap char: `<`, `{`, `[`, `"`, `'`.

- `isCloseWrapChar` : Checks if `String` is a close wrap char: `>`, `}`, `]`, `"`, `'`.

- `removeFirstAny` : Continuously removes from the beginning of a `String` any `String` contained in [patterns].

- `removeLastAny` : Continuously removes from the end of a `String` any `String` contained in [patterns].

- `removeFirstAndLastAny` : Continuously removes from the beggining and end of a `String` any `String` contained in [patterns].

- `removeLastEqual` : Remove a `String` from the end of other string if equal [pattern].

- `removeFirstEqual` : Remove a `String` in the beginning of other string if equal [pattern].

- `removeFirstAndLastEqual` : Remove `String` from the beginning and the end of `String` if equal [pattern].

- `containsAny` : Check if `String` contains any `String`s of [list].

- `containsAll` : Check if `String` contains all `String`s of [list].

## [0.4.3] - New Extensions

Thanks to [zonaro](https://github.com/zonaro)

- `isBlank` : Checks if a `String` is `null` empty or contains only whitespaces.

- `isNotBlank` : Checks if a `String` is NOT `null` empty or contains only whitespaces.

- `asIf` : Compares a `String` to another and returns the first if equal, otherwise returns the second one.

- `ifBlank(String default)` : Checks if a `String` is blank and gives it a default value.

## [0.4.2] - Minor improvements & New Extensions

- Returns the `String` after a character / word.

```dart
after(String pattern)
```

- Returns the `String` before a character / word.

```dart
before(String pattern)
```

- Gets Jaro distance to check `String` similarity. The higher the number the similar the two `String`s/

```dart
getJaro(String wordToCompare)
```

## [0.4.1] - Minor improvements & New Extensions

- Converts the `String` to a `bool` value if possible.

```dart
tooBool
```

## [0.4.0] - Breaking Changes & New Extensions

### Breaking changes

Following extension methods are now created using `get` and can now being accessed without `()`.

- capitalize
- countWords
- removeNumbers
- onlyLatin
- onlyGreek
- isNull
- isIpv4
- isIpv6
- isUrl
- isDate
- isMail
- isNumber
- isStrongPassword
- isGuid
- isLatin
- isGreek
- onlyNumbers
- removeLetters
- charOccurences
- mostFrequent
- reverse
- toSlug
- toCamelCase
- toTitleCase
- toArray
- replaceGreek
- stripHtml
- hasSameCharacters
- shuffle

#### New Extensions

- Truncates `String` with "..." when more than `n` characters.

```dart
truncate(int maxChars)
```

- Truncates `String` in the middle with "..." keeping max `n` characters.

```dart
truncateMiddle(int maxChars)
```

- Quotes a `String` adding " at the start & at the end.

```dart
quote
```

- Trims leading and trailing spaces, so as extra spaces in between words.

```dart
trimAll
```

### [0.3.5] - New Extensions

- Returns the month name of the `DateTime` (in `String` format).

```dart
getMonthFromDate(locale:'en')
```

- Returns the first day of the month from the provided `DateTime` (in `String` format).

```dart
firstDayOfMonth(locale:'en')
```

- Returns the last day of the month from the provided `DateTime` (in `String` format).

```dart
latsDayOfMonth(locale:'en')
```

- Returns left side of the `String` starting from `char`.

```dart
leftOf(String char)
```

- Returns right side of the `String` starting from `char`.

```dart
rightOf(String char)
```

## [0.3.4] - New Extensions

- `formatWithMask` now accepts optional parameter `specialChar` which defaults to '#'

- Add a `String` at the beginning of your `String`.

```dart
prepend(String prefix)
```

- Adds `-` operator subtracting a text from a `String`
- Returns the day name of the `DateTime` (in `String` format).

```dart
String date = '2021-10-23';
String day = date.getDayFromDate(); // returns 'Saturday'
String grDay = date.getDayFromDate(locale:'el'); // returns 'Σάββατο'
```

## [0.3.3] - New Extensions

- Removes the first `n` characters of the `String`.

```dart
removeFirst(int n)
```

- Removes the last `n` characters of the `String`.

```dart
removeLast(int n)
```

- Trims the `String` to have exactly `n` characters. If `n` is larger than the `String` length, the same `String` is returned.

```dart
maxChars(int n)
```

- Reverses slash provided the slash direction (`int`). 0 for / to \ and 1 for \ to /.

```dart
reverseSlash(int direction)
```

- Returns the character at `index`.

```dart
charAt(int index)
```

- Checks if a string is `null`.

```dart
isNull()
```

- Do something if a string is `null`.

```dart
ifNull(Function())
```

- Provide default value if a string is `null`.

```dart
defaultValue(String defaultValue)
```

- Append a `String` at the end of your `String`.

```dart
append(String suffix)
```

- Formats the `String` to properly show currency amount.

```dart
toPriceFormat({String? currencySymbol})
```

## [0.3.2] - Bug Fixes & New Extensions

### Bug fixes & New Extensions

- Returns only the Greek characters of the `String`.

```dart
onlyGreek()
```

- Checkes whether the `String` has only Latin characters.

```dart
isLatin()
```

- Checkes whether the `String` has only Greek characters.

```dart
isGreek()
```

- `onlyLetters()` is now `onlyLatin()` characters.
- The `countWords` extension now correctly counts only words, excluding numbers and symbols from words. For example, `Hello 5 2asd friend !` word count will return 3 words.

## [0.3.1] - New extensions

- Added `String?` operators `>, >=, <, <=` to compare `String` lengths.

- `isIn(Iterable<String>)`, checks if a given `String` is in an `Iterable<String>`.

- `formatWithMask(String mask)`, formats a `String` with a specific mask.

## [0.3.0] - New extensions & Code improvements

Successfully converts library to extend `String?` from `String`.
Further code optimization and bug fixes.

#### New extensions

- Converts the `String` to a `num` value if possible, else returns `null`.

```dart
toNum()
```

- Converts the `String` to `int` if possible, else returns `null`.

```dart
toInt()
```

- Converts the `String` to `double` if possible, else returns `null`.

```dart
toDouble()
```

## [0.2.4] - New extensions

Improves and renames toStringArray (toArray now)

Adds a new extension that counts specific charater occurences in a `String`.

```dart
charCount(String char)
```

## [0.2.3] - New extensions

- Squeezes a `String` to a character

```dart
squeeze(String x);
```

- Check if the `String` is consisted of same characters.

```dart
hasSameCharacters();
```

- Shuffles the word's letters.

```dart
shuffle();
```

- Gets the Levenshtein distance of two `String`

```dart
getLevenshtein();
```

- Checks if a `String` is a valid `Url`.

```dart
isUrl();
```

- Checks if a `String` is a valid `Date`.

```dart
isDate();
```

## [0.2.2] - New extensions

- Repeats a `String` x times

```dart
repeat(int x);
```

- Check if the `String` is a valid Ipv6

```dart
isIpv6();
```

- Check if the `String` is a `num`

```dart
isNumber();
```

- An extension that makes easier handling empty strings.

```dart
ifEmpty(()=>print('The string is empty'));
```

## [0.2.1] - Downgrade test library version

Some projects were breaking due to they depending on test_api:3.0.0 version.

## [0.2.0] - Adds tests

## [0.1.4] - New extension

Method to check whether a `String` is a valid `Guid`.

```dart
isGuid()
```

## [0.1.3] - New extensions

- Method to get a `List<String>` from a `String`.

```dart
toStringArray()
```

- Method to strip all `HTML` code from a `String`.

```dart
stripHtml()
```

- Method to check whether a `String` is a strong password.

```dart
isStrongPassword()
```

## [0.1.2] - New extensions & Code refactor

- Adds isEmpty checks on all extensions.

- Given a `String` and a pattern, finds the starting indices of all occurrences of the pattern in the `String`.

  ```dart
  findPattern({required String pattern})
  ```

## [0.1.1] - New extensions

Useful method to normalize greek text for more performant text searches.

```dart
replaceGreek()
```

## [0.1.0] - New extensions

```dart
first({int count})
```

```dart
last({int count})
```

```dart
toSlug()
```

## [0.0.3] - New extensions and Null Safety

## News

Migrates library to `null` safety.

Extension added :

```dart
toTitleCase()
```

## [0.0.2] - New extensions and bug fixes

## Bug fixes

- Methods now correctly remove trailing and leading whitespaces from strings.

## New extensions

```dart
toCamelCase()
```

```dart
onlyNumbers()
```

```dart
removeLetters()
```

```dart
charOccurences()
```

```dart
mostFrequent()
```

```dart
reverse()
```

```dart
isIpv4()
```

## [0.0.1] - Initial release

### Extension methods

```dart
readTime()
```

```dart
isMail()
```

```dart
capitalize()
```

```dart
removeNumbers()
```

```dart
onlyLetters()
```

```dart
countWords()
```
