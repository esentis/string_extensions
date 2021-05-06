# string_extensions

![pub package](https://img.shields.io/pub/v/string_extensions.svg)

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

* **toCamelCase()**

```dart
String foo = 'Find max of array';
String camelCase = foo.toCamelCase() // returns 'findMaxOfArray'
```

* **onlyNumbers()**

```dart
String foo = '4*%^55/es4e5523nt1is';
String onyNumbers = foo.onlyNumbers() // returns '455455231'
```

* **removeLetters()**

```dart
String foo = 'es4e5523nt1is';
String noLetters = foo.removeLetters() // returns '455231'
```

```dart
String foo = '1244e*s*4e*5523n*t*1i*s'
String noLetters = foo.removeLetters() // returns '1244**4*5523**1*'
```

* **charOccurences()**

```dart
String foo = 'esentis';
List occurences = foo.charOccurences() // returns '[{e:2},{i:1},{n:1},{s:2},]'
```

* **mostFrequent()**

```dart
String foo = 'Hello World';
String mostFrequent = foo.mostFrequent() // returns 'l'
```

* **reverse()**

```dart
String foo = 'Hello World';
String reversed = foo.reverse() ; // returns 'dlrow olleH'
```

* **isIpv4()**

```dart
String foo = '192.168.1.14';
bool isIpv4 = foo.isIpv4(); // returns true
```

```dart
String foo = '192.168.1.14.150.1225';
bool isIpv4 = foo.isIpv4(); // returns false
```

* **toTitleCase()**

```dart
String foo = 'hello world';
String fooTitled = foo.toTitleCase(); // returns 'Hello World'
 ```

* **first()**

```dart
String foo = 'hello world';
String firstChars = foo.first(); // returns 'h'
 ```

* **last()**

 ```dart
String foo = 'hello world';
String lastChars = foo.last(); // returns 'd'
```

* **toSlug()**

```dart
String foo = 'hello world';
String fooSlug = foo.toSlug(); // returns 'hello_world'
 ```

* **replaceGreek()**

```dart
 String foo = 'Αριστοτέλης';
 String fooReplaced = foo.replaceGreek(); // returns 'aristotelis'
 ```

* **findPatterns({required String pattern})**

```dart
String foo = 'abracadabra';
String fooOccs = foo.findPattern(pattern:'abr'); // returns '[0, 7]'
 ```
