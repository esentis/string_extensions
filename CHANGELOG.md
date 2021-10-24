# [0.3.4] - New Extensions

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
