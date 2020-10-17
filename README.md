# string_extensions 0.0.1

Useful String extensions to save you time in production.

## Getting Started

Current String extensions :

* **readTime()**

```dart
String foo =  'Hello dear friend how you doing ?';
int readTime = foo.readTime() // returns 3 seconds.
```

* **isMail()**

```dart
String foo = 'esentis@esentis.com'
bool isMail = foo.isMail() // returns true
```

```dart
String foo = 'esentis@esentis'
bool isMail = foo.isMail() // returns false
```

* **onyLetters()**

```dart
String foo = '4*%^55/es4e5523nt1is';
String letters = foo.onlyLetters() // returns 'esentis';
```

* **removeNumbers()**

```dart
String foo = 'es4e5523nt1is';
String noNums = foo.removeNumbers() // returns 'esentis'
```

```dart
String foo = '1244e*s*4e*5523n*t*1i*s'
String noNums = foo.removeNumbers() // returns 'e*s*e*n*t*i*s'
```

* **countWords()**

```dart
String foo = 'Hello dear friend how you doing ?';
int count = foo.countWords() // returns 7 words.
```

* **capitalize()**

```dart
String foo = 'hAckErrR';
String cFoo = foo.capitalize(); // returns 'Hackerrr'.
```
