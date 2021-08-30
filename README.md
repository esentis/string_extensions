<p align="center">
  <img src="https://i.imgur.com/irnKSr0.png" height="160" alt="Feelm" /><br/>
</p>

<p align="center">
 <img src="https://img.shields.io/pub/v/string_extensions?color=637d0d&style=for-the-badge" alt="Version" /></br>
 <img src="https://travis-ci.com/esentis/string_extensions.svg?branch=master" alt="Version" />
 <a href='https://coveralls.io/github/esentis/string_extensions?branch=master'><img src='https://coveralls.io/repos/github/esentis/string_extensions/badge.svg?branch=master' alt='Coverage Status' /></a>
</br>
</p>

---

## Current Methods

- **You can use `>, >=, <, <=` operators, to compare `String` lengths.**

```dart
String s1 = 'esentis';
String s2 = 'dev';
print(s1 > s2); // prints true
print(s1 >= s2); // prints true
print(s1 < s2); // prints false
print(s1 <= s2); // prints false
```

- **isGuid()**

```dart
String foo = '6d64-4396-8547-1ec1b86e081e'
bool isGuid = foo.isGuid() // returns false
```

- **isUrl()**

```dart
String foo = 'esentis';
bool isUrl = foo.isUrl() // 'false';
```

- **isDate()**

```dart
String foo = 'esentis';
bool isDate = foo.isDate() // 'false';
```

- **isMail()**

```dart
String foo = 'esentis@esentis.com'
bool isMail = foo.isMail() // returns true
```

```dart
String foo = 'esentis@esentis'
bool isMail = foo.isMail() // returns false
```

- **isIpv4()**

```dart
String foo = '192.168.1.14';
bool isIpv4 = foo.isIpv4(); // returns true
```

```dart
String foo = '192.168.1.14.150.1225';
bool isIpv4 = foo.isIpv4(); // returns false
```

- **isIpv6()**

```dart
String foo = '2001:0db8:85a3:0000:0000:8a2e:0370:7334';
bool isIpv6 = foo.isIpv6(); // returns true
```

```dart
String foo = '92.168.1.14';
bool isIpv6 = foo.isIpv6(); // returns false
```

- **isNumber()**

```dart
String foo = '44';
bool isNumber = foo.isNumber(); // returns true
```

```dart
String foo = '92.168.1.14';
bool isNumber = foo.isNumber(); // returns false
```

- **isIn()**

```dart
String foo = '6d64-4396-8547-1ec1b86e081e';
var iterable = ['fff','gasd'];
bool isIn = foo.isIn(iterable) // returns false
```

- **toStringArray()**

```dart
String foo = 'abracadabra';
List<String> fooArray = foo.toStringArray(); // returns '[a,b,r,a,c,a,d,a,b,r,a]'
```

- **toCamelCase()**

```dart
String foo = 'Find max of array';
String camelCase = foo.toCamelCase() // returns 'findMaxOfArray'
```

- **toTitleCase()**

```dart
String foo = 'hello world';
String fooTitled = foo.toTitleCase(); // returns 'Hello World'
```

- **toSlug()**

```dart
String foo = 'hello world';
String fooSlug = foo.toSlug(); // returns 'hello_world'
```

- **toNum()**

```dart
String foo = '5.5';
double fooNum = foo.toNum(); // returns 5.5

String foo2 = '5';
int fooNum2 = foo.toNum(); // returns 5

String foo3 = '5f';
var fooNum2 = foo.toNum(); // returns null
```

- **toInt()**

```dart
String foo = '5.6';
int fooInt = foo.toInt(); // returns  5

String foo2 = '5';
int fooNum2 = foo.toInt(); // returns 5

String foo3 = '5f';
var fooNum2 = foo.toInt(); // returns null
```

- **toDouble()**

```dart
String foo = '5';
double fooDouble = foo.toDouble(); // returns 5.0

String foo = '5.5';
double fooDouble = foo.toDouble(); // returns 5.5

String foo = '5f';
var fooDouble = foo.toDouble(); // returns null
```

- **onyLetters()**

```dart
String foo = '4*%^55/es4e5523nt1is';
String letters = foo.onlyLetters() // returns 'esentis';
```

- **onlyNumbers()**

```dart
String foo = '4*%^55/es4e5523nt1is';
String onyNumbers = foo.onlyNumbers() // returns '455455231'
```

- **readTime()**

```dart
String foo =  'Hello dear friend how you doing ?';
int readTime = foo.readTime() // returns 3 seconds.
```

- **removeNumbers()**

```dart
String foo = 'es4e5523nt1is';
String noNums = foo.removeNumbers() // returns 'esentis'
```

```dart
String foo = '1244e*s*4e*5523n*t*1i*s'
String noNums = foo.removeNumbers() // returns 'e*s*e*n*t*i*s'
```

- **countWords()**

```dart
String foo = 'Hello dear friend how you doing ?';
int count = foo.countWords() // returns 7 words.
```

- **capitalize()**

```dart
String foo = 'hAckErrR';
String cFoo = foo.capitalize(); // returns 'Hackerrr'.
```

- **removeLetters()**

```dart
String foo = 'es4e5523nt1is';
String noLetters = foo.removeLetters() // returns '455231'
```

```dart
String foo = '1244e*s*4e*5523n*t*1i*s'
String noLetters = foo.removeLetters() // returns '1244**4*5523**1*'
```

- **charOccurences()**

```dart
String foo = 'esentis';
List occurences = foo.charOccurences() // returns '[{e:2},{i:1},{n:1},{s:2},]'
```

- **mostFrequent()**

```dart
String foo = 'Hello World';
String mostFrequent = foo.mostFrequent() // returns 'l'
```

- **reverse()**

```dart
String foo = 'Hello World';
String reversed = foo.reverse() ; // returns 'dlrow olleH'
```

- **first()**

```dart
String foo = 'hello world';
String firstChars = foo.first(); // returns 'h'
```

- **last()**

```dart
String foo = 'hello world';
String lastChars = foo.last(); // returns 'd'
```

- **replaceGreek()**

```dart
 String foo = 'Αριστοτέλης';
 String fooReplaced = foo.replaceGreek(); // returns 'aristotelis'
```

- **findPatterns({required String pattern})**

```dart
String foo = 'abracadabra';
String fooOccs = foo.findPattern(pattern:'abr'); // returns '[0, 7]'
```

- **stripHtml()**

```dart
String html = '<script>Hacky hacky.</script> <p>Here is some text. <span class="bold">This is bold. </span></p>';
String stripped = foo.stripHtml(); // returns 'Hacky hacky. Here is some text. This is bold.'
```

- **toStringArray()**

```dart
String word = 'esentis';
List<String> letters = foo.toStringArray(); // returns '[e,s,e,n,t,i,s]'
```

- **repeat(int x)**

```dart
String string = 'foo';
String stripped = foo.repeat(2); // returns 'foofoo'
```

- **squeeze(String x)**

```dart
String foo = 'foofoofoofoofoo';
String fooSqueezed = foo.squeeze('o') // 'fofofofofo';
```

- **hasSameCharacters()**

```dart
String foo1 = 'ttttttt';
bool hasSame1 = foo.hasSameCharacters() // true;

String foo = 'ttttttt12'
bool hasSame2 = foo.hasSameCharacters() // false;
```

- **shuffle()**

```dart
String foo = 'esentis';
String fooSqueezed = foo.shuffle() // 'teienss';
```

- **getLevenshtein(String word)**

```dart
String foo = 'esentis';
int distance = foo.getLevenshtein('esen') // '3';
```

- **charCount(String char)**

```dart
String foo = 'esentis';
int distance = foo.charCount('e') // '2';
```

- **formatWithMask(String mask)**

```dart
String string = 'esentisgreece';;
String mask = 'Hello ####### you are from ######';
String masked = string3.formatWithMask(mask); // returns 'Hello esentis you are from greece'
```
