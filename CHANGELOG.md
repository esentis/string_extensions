# [0.3.0] - New extensions & Code improvements

Successfully converts library to extend String? from String.
Further code optimization and bug fixes.

#### New extensions

Converts the string to a numeric value if possible, else returns null.

```dart
toNum()
```

Converts the string to int if possible, else returns null.

```dart
toInt()
```

Converts the string to double if possible, else returns null.

```dart
toDouble()
```

## [0.2.4] - New extensions

Improves and renames toStringArray (toArray now)

Adds a new extension that counts specific charater occurences in a string.

```dart
charCount(String char)
```

## [0.2.3] - New extensions

Squeezes a string to a character

```dart
squeeze(String x);
```

Check if the string is consisted of same characters.

```dart
hasSameCharacters();
```

Shuffles the word's letters.

```dart
shuffle();
```

Gets the Levenshtein distance of two strings

```dart
getLevenshtein();
```

Checks if a string is a valid Url.

```dart
isUrl();
```

Checks if a string is a valid Date.

```dart
isDate();
```

## [0.2.2] - New extensions

Repeats a string x times

```dart
repeat(int x);
```

Check if the string is a valid Ipv6

```dart
isIpv6();
```

Check if the string is a number

```dart
isNumber();
```

An extension that makes easier handling empty strings.

```dart
ifEmpty(()=>print('The string is empty'));
```

## [0.2.1] - Downgrade test library version

Some projects were breaking due to they depending on test_api:3.0.0 version.

## [0.2.0] - Adds tests

## [0.1.4] - New extension

Method to check whether a string is a valid Guid.

```dart
isGuid()
```

## [0.1.3] - New extensions

Method to get a list of characters in a string.

```dart
toStringArray()
```

Method to strip all HTML code from a string.

```dart
stripHtml()
```

Method to check whether a string is a strong password.

```dart
isStrongPassword()
```

## [0.1.2] - New extensions & Code refactor

- Adds isEmpty checks on all extensions.

- Given a string and a pattern, finds the starting indices of all occurrences of the pattern in the string.

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

Migrates library to null safety.

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
