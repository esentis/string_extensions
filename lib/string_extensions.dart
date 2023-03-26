import 'dart:convert';
import 'dart:math';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:string_extensions/string_helpers.dart';

extension MiscExtensions on String? {
  /// Checks if the [length!] of the `String` is more than the length of [s].
  ///
  /// If the `String` is null or empty, it returns false.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'Hello';
  /// bool isMore = foo > 'Hi'; // returns true.
  /// ```
  bool operator >(String s) {
    if (this.isBlank) {
      return false;
    }
    return this!.length > s.length;
  }

  /// Checks if the [length!] of the `String` is more or equal than the length of [s].
  ///
  /// If the `String` is null or empty, it returns false.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'Hello';
  /// bool isMoreOrEqual = foo >= 'Hi'; // returns true.
  /// ```
  bool operator >=(String s) {
    if (this.isBlank) {
      return false;
    }
    return this!.length >= s.length;
  }

  /// Checks if the [length!] of the `String` is less than the length of [s].
  ///
  /// If the `String` is null or empty, it returns false.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'Hello';
  /// bool isLess = foo < 'Hi'; // returns false.
  /// ```
  bool operator <(String s) {
    if (this.isBlank) {
      return false;
    }
    return this!.length < s.length;
  }

  /// Checks if the [length!] of the `String` is less or equal than the length of [s].
  ///
  /// If the `String` is null or empty, it returns false.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'Hello';
  /// bool isLessOrEqual = foo <= 'Hi'; // returns false.
  /// ```
  bool operator <=(String s) {
    if (this.isBlank) {
      return false;
    }
    return this!.length <= s.length;
  }

  /// Removes a text from the `String`.
  String operator -(String? s) {
    if (this.isBlank) {
      return '';
    }
    if (s.isBlank) {
      return this!;
    }
    return this!.replaceAll(s!, '');
  }

  /// Returns the average read time duration of the given `String` in seconds.
  ///
  /// The default calculation is based on 200 words per minute.
  ///
  /// You can pass the [wordsPerMinute] parameter for different read speeds.
  /// ### Example
  /// ```dart
  /// String foo =  'Hello dear friend how you doing ?';
  /// int readTime = foo.readTime(); // returns 3 seconds.
  /// ```
  int readTime({int wordsPerMinute = 200}) {
    if (this.isBlank) {
      return 0;
    }
    var words = this!.trim().split(RegExp(r'(\s+)'));
    var magicalNumber = words.length / wordsPerMinute;
    return (magicalNumber * 100).toInt();
  }

  /// Capitalizes the `String` in normal form.
  /// ### Example
  /// ```dart
  /// String foo = 'hAckErrR';
  /// String cFoo = foo.capitalize; // returns 'Hackerrr'.
  /// ```
  String? get capitalize {
    if (this.isBlank) {
      return this;
    }
    return '${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}';
  }

  /// Returns the word count in the given `String`.
  ///
  /// The pattern is based on spaces.
  /// ### Example
  /// ```dart
  /// String foo = 'Hello dear friend how you doing ?';
  /// int count = foo.countWords; // returns 6 words.
  /// ```
  int get countWords {
    if (this.isBlank) {
      return 0;
    }
    var words = this!.trim().split(RegExp(r'(\s+)'));
    // We filter out symbols and numbers from the word count
    var filteredWords = words.where((e) => e.onlyLatin!.isNotEmpty);
    return filteredWords.length;
  }

  /// Removes only the numbers from the `String`.
  /// ### Example 1
  /// ```dart
  /// String foo = 'es4e5523nt1is';
  /// String noNumbers = foo.removeNumbers; // returns 'esentis'
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = '1244e*s*4e*5523n*t*1i*s';
  /// String noNumbers = foo.removeNumbers; // returns 'e*s*e*n*t*i*s'
  /// ```
  String? get removeNumbers {
    if (this.isBlank) {
      return this;
    }
    var regex = RegExp(r'(\d+)');
    return this!.replaceAll(regex, '');
  }

  /// Returns only the numbers from the `String`.
  /// ### Example
  /// ```dart
  /// String foo = '4*%^55/es4e5523nt1is';
  /// String onyNumbers = foo.onlyNumbers; // returns '455455231'
  /// ```
  String? get onlyNumbers {
    if (this.isBlank) {
      return this;
    }
    // ignore: unnecessary_raw_strings
    var regex = RegExp(r'([^0-9]+)');
    return this!.replaceAll(regex, '');
  }

  /// Returns only the Latin characters from the `String`.
  /// ### Example
  /// ```dart
  /// String foo = '4*%^55/es4e5523nt1is';
  /// String onlyLatin = foo.onlyLatin; // returns 'esentis'
  /// ```
  String? get onlyLatin {
    if (this.isBlank) {
      return this;
    }
    // ignore: unnecessary_raw_strings
    var regex = RegExp(r'([^a-zA-Z\s]+)');
    return this!.replaceAll(regex, '');
  }

  /// Returns only the Greek characters from the `String`.
  /// ### Example
  /// ```dart
  /// String foo = '4*%^55/σοφ4e5523ια';
  /// String onlyGreek = foo.onlyGreek; // returns 'σοφια'
  /// String foo2 = '4*%^55/σοφ4e5523ια aaggαγάπ112η';
  /// String onlyGreek2 = foo2.onlyGreek; // returns 'σοφια αγάπη'
  /// ```
  String? get onlyGreek {
    if (this.isBlank) {
      return this;
    }
    // ignore: unnecessary_raw_strings
    var regex = RegExp(r'([^α-ωΑ-ΩίϊΐόάέύϋΰήώΊΪΌΆΈΎΫΉΏ\s]+)');
    return this!.replaceAll(regex, '');
  }

  /// Checks whether the supplied string contains any Greek character.
  bool get containsAnyGreekCharacter {
    if (this.isBlank) {
      return false;
    }

    String onlyGreekLetters = this.onlyGreek!.replaceAll(" ", "");
    return onlyGreekLetters.isNotEmpty;
  }

  /// Returns only the Latin OR Greek characters from the `String`.
  /// ### Example
  /// ```dart
  /// String foo = '4*%^55/σοφ4e5523ια';
  /// String onlyL1 = foo.onlyLetters; // returns 'σοφια'
  /// String foo2 = '4*%^55/es4e5523nt1is';
  /// String onlyL2 = foo2.onlyLetters; // returns 'esentis'
  /// ```
  String? get onlyLetters {
    if (this.isBlank) {
      return this;
    }
    // ignore: unnecessary_raw_strings
    var regex = RegExp(r'([^α-ωΑ-ΩίϊΐόάέύϋΰήώΊΪΌΆΈΎΫΉΏa-zA-Z\s]+)');
    return this!.replaceAll(regex, '');
  }

  /// Returns all special characters from the `String`.
  /// ### Example
  /// ```dart
  /// String foo = '/!@#\$%^\-&*()+",.?":{}|<>~_-`*%^/ese?:"///ntis/!@#\$%^&*(),.?":{}|<>~_-`';
  /// String removed = foo.removeSpecial; // returns 'esentis'
  /// ```
  String? get removeSpecial {
    if (this.isBlank) {
      return this;
    }
    // ignore: unnecessary_raw_strings
    var regex = RegExp(r'[/!@#$%^\-&*()+",.?":{}|<>~_-`]');
    return this!.replaceAll(regex, '');
  }

  /// Checks whether the `String` is `null`.
  /// ### Example 1
  /// ```dart
  /// String? foo;
  /// bool isNull = foo.isNull; // returns true
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = 'fff';
  /// bool isNull = foo.isNull; // returns false
  /// ```
  bool get isNull {
    return this == null;
  }

  /// Checks whether the `String` is not `null`.
  /// ### Example 1
  /// ```dart
  /// String? foo;
  /// bool isNull = foo.isNotNull; // returns false
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = 'fff';
  /// bool isNull = foo.isNotNull; // returns true
  /// ```
  bool get isNotNull {
    return isNull == false;
  }

  /// Checks whether the `String` is a valid IPv4.
  /// ### Example 1
  /// ```dart
  /// String foo = '192.168.1.14';
  /// bool isIpv4 = foo.isIpv4; // returns true
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = '192.168.1.14.150.1225';
  /// bool isIpv4 = foo.isIpv4; // returns false
  /// ```
  bool get isIpv4 {
    if (this.isBlank) {
      return false;
    }
    var regex = RegExp(
        r'((?:^|\s)([a-z]{3,6}(?=://))?(://)?((?:25[0-5]|2[0-4]\d|[01]?\d\d?)\.(?:25[0-5]|2[0-4]\d|[01]?\d\d?)\.(?:25[0-5]|2[0-4]\d|[01]?\d\d?)\.(?:25[0-5]|2[0-4]\d|[01]?\d\d?))(?::(\d{2,5}))?(?:\s|$))');
    return regex.hasMatch(this!);
  }

  /// Checks whether the `String` is a valid IPv6.
  /// ### Example 1
  /// ```dart
  /// String foo = '2001:0db8:85a3:0000:0000:8a2e:0370:7334';
  /// bool isIpv6 = foo.isIpv6; // returns true
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = '192.168.1.14.150.1225';
  /// bool isIpv6 = foo.isIpv6; // returns false
  /// ```
  bool get isIpv6 {
    if (this.isBlank) {
      return false;
    }
    this!.substring(0, 1);
    var regex = RegExp(
        r'(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))');
    return regex.hasMatch(this!);
  }

  /// Checks whether the `String` is a valid URL.
  /// ### Example 1
  /// ```dart
  /// String foo = 'foo.1com';
  /// bool isUrl = foo.isUrl; // returns false
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = 'google.com';
  /// bool isUrl = foo.isUrl; // returns true
  /// ```
  bool get isUrl {
    if (this.isBlank) {
      return false;
    }
    var regex = RegExp(
        r'[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)');
    return regex.hasMatch(this!);
  }

  /// Checks whether the `String` is a valid Date:
  ///
  /// ### Valid formats
  ///
  /// * dd/mm/yyyy
  /// * dd-mm-yyyyy
  /// * dd.mm.yyyy
  /// * yyyy-mm-dd
  /// * yyyy-mm-dd hrs
  /// * 20120227 13:27:00
  /// * 20120227T132700
  /// * 20120227
  /// * +20120227
  /// * 2012-02-27T14Z
  /// * 2012-02-27T14+00:00
  /// * -123450101 00:00:00 Z": in the year -12345
  /// * 2002-02-27T14:00:00-0500": Same as "2002-02-27T19:00:00Z
  bool get isDate {
    if (this.isBlank) {
      return false;
    }
    var regex = RegExp(
        r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$');
    if (regex.hasMatch(this!)) {
      return true;
    }
    try {
      DateTime.parse(this!);
      return true;
    } on FormatException {
      return false;
    }
  }

  /// Checks whether the `String` is a valid mail.
  /// ### Example
  /// ```dart
  /// String foo = 'esentis@esentis.com';
  /// bool isMail = foo.isMail; // returns true
  /// ```
  bool get isMail {
    if (this.isBlank) {
      return false;
    }
    var regex = RegExp(r"(^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$)");
    return regex.hasMatch(this!);
  }

  /// Checks whether the `String` is a number.
  /// ### Example
  /// ```dart
  /// String foo = '45';
  /// bool isNumber = foo.isNumber; // returns true
  /// ```
  /// ```dart
  /// String foo = '45s';
  /// String isNumber = foo.isNumber; // returns false
  bool get isNumber {
    if (this.isBlank) {
      return false;
    }
    return num.tryParse(this!) != null;
  }

  /// Checks whether the `String` complies to below rules :
  ///  * At least 1 uppercase
  ///  * At least 1 special character
  ///  * At least 1 number
  ///  * At least 8 characters in length
  /// ### Example
  /// ```dart
  /// String foo = 'qwerty';
  /// bool isStrong = foo.isStrongPassword; // returns false
  /// ```
  /// ```dart
  /// String foo = 'IsTh!$Strong';
  /// bool isStrong = foo.isStrongPassword; // returns true
  /// ```
  bool get isStrongPassword {
    if (this.isBlank) {
      return false;
    }
    var regex = RegExp(
        r'^(?=.*([A-Z]){1,})(?=.*[!@#$&*]{1,})(?=.*[0-9]{1,})(?=.*[a-z]{1,}).{8,100}$');
    return regex.hasMatch(this!);
  }

  /// Checks whether the `String` is a valid Guid.
  ///
  /// ### Example
  /// ```dart
  /// String foo = '6d64-4396-8547-1ec1b86e081e';
  /// bool isGuid = foo.isGuid; // returns false
  /// ```
  /// ```dart
  /// String foo = '887b7923-6d64-4396-8547-1ec1b86e081e';
  /// bool isGuid = foo.isGuid; // returns true
  /// ```
  bool get isGuid {
    if (this.isBlank) {
      return false;
    }
    var regex = RegExp(
        r'^(\{{0,1}([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}\}{0,1})$');
    return regex.hasMatch(this!);
  }

  /// Checks if the `String` exists in a given `Iterable<String>`
  /// ### Example
  /// ```dart
  /// String foo = '6d64-4396-8547-1ec1b86e081e';
  /// var iterable = ['fff','gasd'];
  /// bool isIn = foo.isIn(iterable); // returns false
  /// ```
  bool isIn(Iterable<String?> strings) {
    if (this.isBlank) {
      return false;
    }
    return strings.contains(this);
  }

  /// Checks if the `String` has only Latin characters.
  /// ### Example
  /// ```dart
  /// String foo = 'this is a τεστ';
  /// bool isLatin = foo.isLatin; // returns false
  /// String foo2 = 'this is hello world';
  /// bool isLatin2 = foo2.isLatin; // returns true
  /// ```
  bool get isLatin {
    if (this.isBlank) {
      return false;
    }
    return RegExp(r'^[a-zA-Z\s]+$').hasMatch(this!);
  }

  /// Checks if the `String` has only Greek characters.
  /// ### Example
  /// ```dart
  /// String foo = 'this is a τεστ';
  /// bool isLatin = foo.isGreek; // returns false
  /// String foo2 = 'Τα αγαθά κόποις κτώνται';
  /// bool isLatin2 = foo2.isGreek; // returns true
  /// ```
  bool? get isGreek {
    if (this.isBlank) {
      return false;
    }

    return RegExp(r'^[α-ωΑ-ΩίϊΐόάέύϋΰήώΊΪΌΆΈΎΫΉΏ\s]+$').hasMatch(this!);
  }

  /// Removes only the letters from the `String`.
  /// ### Example 1
  /// ```dart
  /// String foo = 'es4e5523nt1is';
  /// String noLetters = foo.removeLetters; // returns '455231'
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = '1244e*s*4e*5523n*t*1i*s';
  /// String noLetters = foo.removeLetters; // returns '1244**4*5523**1*'
  /// ```
  String? get removeLetters {
    if (this.isBlank) {
      return this;
    }
    // ignore: unnecessary_raw_strings
    var regex = RegExp(r'([a-zA-Z]+)');
    return this!.replaceAll(regex, '');
  }

  /// Finds all character occurrences and returns count as:
  /// ```dart
  /// List<Map<dynamic,dynamic>>
  /// ```
  /// ### Example 1
  /// ```dart
  /// String foo = 'esentis';
  /// List occurrences = foo.charOccurrences; // returns '[{e:2},{i:1},{n:1},{s:2},]'
  /// ```
  List<Map<String, int>> get charOccurences {
    if (this.isBlank) {
      return [];
    }
    // ignore: omit_local_variable_types
    List<Map<String, int>> occurrences = [];
    var letters = this!.split('')..sort();
    var checkingLetter = letters[0];
    var count = 0;
    for (var i = 0; i < letters.length; i++) {
      if (letters[i] == checkingLetter) {
        count++;
        if (i == letters.length - 1) {
          occurrences.add({checkingLetter: count});
          checkingLetter = letters[i];
        }
      } else {
        occurrences.add({checkingLetter: count});
        checkingLetter = letters[i];
        count = 1;
      }
    }
    return occurrences;
  }

  /// Finds a specific's character occurrence in the `String`.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'foo';
  /// int occ = foo.charCount('o'); // returns 2
  /// ```
  int charCount(String char) {
    if (this.isBlank) {
      return 0;
    }
    return this!.split('').fold<int>(
        0, (previousValue, ch) => previousValue + (ch == char ? 1 : 0));
  }

  /// Finds the most frequent character in the `String`.
  /// ### Example 1
  /// ```dart
  /// String foo = 'Hello World';
  /// String mostFrequent = foo.mostFrequent; // returns 'l'
  /// ```
  String? mostFrequent({bool ignoreSpaces = false}) {
    if (this.isBlank) {
      return this;
    }
    if (ignoreSpaces) {
      return this!.replaceAll(' ', '').mostFrequent();
    }
    var occurrences = <String, int>{};
    var letters = this!.split('')..sort();
    var checkingLetter = letters[0];
    var count = 0;

    for (var i = 0, len = letters.length; i < len; i++) {
      if (letters[i] == checkingLetter) {
        count++;
        if (i == len - 1) {
          occurrences[checkingLetter] = count;
        }
      } else {
        occurrences[checkingLetter] = count;
        checkingLetter = letters[i];
        count = 1;
      }
    }

    var mostFrequent = '';
    var occursCount = -1;

    occurrences.forEach((character, occurs) {
      if (occurs > occursCount) {
        mostFrequent = character;
        occursCount = occurs;
      }
    });

    return mostFrequent;
  }

  /// Returns the `String` reversed.
  /// ### Example
  /// ```dart
  /// String foo = 'Hello World';
  /// String reversed = foo.reverse; // returns 'dlrow olleH'
  /// ```
  String? get reverse {
    if (this.isBlank) {
      return this;
    }

    var letters = this!.split('').toList().reversed;
    return letters.reduce((current, next) => current + next);
  }

  /// Returns the first [n] characters of the `String`.
  ///
  /// n is optional, by default it returns the first character of the `String`.
  ///
  /// If [n] provided is longer than the `String`'s length, the string will be returned.
  ///
  /// Faster than using
  /// ```dart
  /// substring(0,count)
  /// ```
  /// ### Example 1
  /// ```dart
  /// String foo = 'hello world';
  /// String firstChars = foo.first(); // returns 'h'
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = 'hello world';
  /// bool firstChars = foo.first(3); // returns 'hel'
  /// ```
  String? first({int n = 1}) {
    if (this.isBlank || this!.length < n || n < 0) {
      return this;
    }

    return this!.substring(0, n);
  }

  /// Returns the last [n] characters of the `String`.
  ///
  /// [n] is optional, by default it returns the first character of the `String`.
  ///
  /// If [n] provided is longer than the `String`'s length, the string will be returned.
  ///
  /// Faster than using
  /// ```dart
  /// substring(length-n,length)
  /// ```
  /// ### Example 1
  /// ```dart
  /// String foo = 'hello world';
  /// String firstChars = foo.last(); // returns 'd'
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = 'hello world';
  /// bool firstChars = foo.last(3); // returns 'rld'
  /// ```
  String? last({int n = 1}) {
    if (this.isBlank || this!.length < n || n < 0) {
      return this;
    }

    return this!.substring(this!.length - n, this!.length);
  }

  /// Returns the `String` to slug case.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'sLuG Case';
  /// String fooSlug = foo.toSlug; // returns 'sLuG_Case'
  /// ```
  String? get toSlug {
    if (this.isBlank) {
      return this;
    }

    var words = this!.trim().split(RegExp(r'(\s+)'));
    var slugWord = '';

    if (this!.length == 1) {
      return this;
    }
    for (var i = 0; i <= words.length - 1; i++) {
      if (i == words.length - 1) {
        slugWord += words[i];
      } else {
        slugWord += words[i] + '_';
      }
    }
    return slugWord;
  }

  /// Returns the `String` to snake_case.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'SNAKE CASE';
  /// String fooSNake = foo.toSnakeCase; // returns 'snake_case'
  /// ```
  String? get toSnakeCase {
    if (this.isBlank) {
      return this;
    }

    var words = this!.toLowerCase().trim().split(RegExp(r'(\s+)'));
    var snakeWord = '';

    if (this!.length == 1) {
      return this;
    }
    for (var i = 0; i <= words.length - 1; i++) {
      if (i == words.length - 1) {
        snakeWord += words[i];
      } else {
        snakeWord += words[i] + '_';
      }
    }
    return snakeWord;
  }

  /// Returns the `String` in camelcase.
  /// ### Example
  /// ```dart
  /// String foo = 'Find max of array';
  /// String camelCase = foo.toCamelCase; // returns 'findMaxOfArray'
  /// ```
  String? get toCamelCase {
    if (this.isBlank) {
      return this;
    }

    var words = this!.trim().split(RegExp(r'(\s+)'));
    var result = words[0].toLowerCase();
    for (var i = 1; i < words.length; i++) {
      result += words[i].substring(0, 1).toUpperCase() +
          words[i].substring(1).toLowerCase();
    }
    return result;
  }

  /// Returns the `String` title cased.
  ///
  /// ```dart
  /// String foo = 'Hello dear friend how you doing ?';
  /// Sting titleCased = foo.toTitleCase; // returns 'Hello Dear Friend How You Doing'.
  /// ```
  String? get toTitleCase {
    if (this.isBlank) {
      return this;
    }

    var words = this!.trim().toLowerCase().split(' ');
    for (var i = 0; i < words.length; i++) {
      words[i] = words[i].substring(0, 1).toUpperCase() + words[i].substring(1);
    }

    return words.join(' ');
  }

  /// Returns a list of the `String`'s characters.
  ///
  /// O(n)
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'abracadabra';
  /// List<String> fooArray = foo.toArray; // returns '[a,b,r,a,c,a,d,a,b,r,a]'
  /// ```
  List<String> get toArray {
    if (this.isBlank) {
      return [];
    }

    return this!.split('');
  }

  /// Converts a `String` to a numeric value if possible.
  ///
  /// If conversion fails, `null` is returned.
  ///
  /// ### Example
  /// ```dart
  /// String foo = '4';
  /// int fooInt = foo.toNum(); // returns 4;
  /// ```
  /// ```dart
  /// String foo = '4f';
  /// var fooNull = foo.toNum(); // returns null;
  /// ```
  num? toNum() {
    if (this.isBlank) {
      return null;
    }

    return num.tryParse(this!);
  }

  /// Converts a `String` to`int` if possible.
  ///
  /// If conversion fails, `null` is returned.
  ///
  /// ### Example
  /// ```dart
  /// String foo = '4';
  /// int fooInt = foo.toInt(); // returns 4;
  /// ```
  /// ```dart
  /// String foo = '4f';
  /// var fooNull = foo.toInt(); // returns null;
  /// ```
  /// ```dart
  /// String foo = '4.0';
  /// var fooNull = foo.toInt(); // returns 4;
  /// ```
  int? toInt() {
    if (this.isBlank) {
      return null;
    }

    return int.tryParse(this!) ?? double.tryParse(this!)?.floor();
  }

  /// Converts a `String` to`double` if possible.
  ///
  /// If conversion fails, `null` is returned.
  ///
  /// ### Example
  /// ```dart
  /// String foo = '4';
  /// int fooInt = foo.toDouble(); // returns 4.0;
  /// ```
  /// ```dart
  /// String foo = '4f';
  /// var fooNull = foo.toDouble(); // returns null;
  /// ```
  double? toDouble() {
    if (this.isBlank) {
      return null;
    }

    return double.tryParse(this!);
  }

  /// Properly upper cases Greek letters removing their tones.
  ///
  /// ### Example
  /// ```dart
  /// String greek = 'Τι κάνεις πώς τα περνάς φίλτατέ μου';
  /// String greekUpper = greek.toGreekUpperCase(); // returns 'ΤΙ ΚΑΝΕΙΣ ΠΩΣ ΤΑ ΠΕΡΝΑΣ ΦΙΛΤΑΤΕ ΜΟΥ'
  /// ```
  String? toGreekUpperCase() {
    if (this.isBlank) {
      return this;
    }
    return this!.toUpperCase().replaceAllMapped(RegExp(r'[ΆΈΉΊΎΏΌ]'), (match) {
      switch (match.group(0)) {
        case 'Ά':
          return 'Α';
        case 'Έ':
          return 'Ε';
        case 'Ή':
          return 'Η';
        case 'Ί':
          return 'Ι';
        case 'Ύ':
          return 'Υ';
        case 'Ώ':
          return 'Ω';
        case 'Ό':
          return 'Ο';
        default:
          return match.group(0) ?? this!.toUpperCase();
      }
    });
  }

  /// Replaces all greek characters with latin. Comes handy when you want to normalize text for search.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'Αριστοτέλης';
  /// String fooReplaced = foo.replaceGreek; // returns 'aristotelis'
  /// ```
  String? get replaceGreek {
    if (this.isBlank) return this;
    var normalizedWord = '';
    for (var i = 0; i < this!.length; i++) {
      var character = this![i];
      if (StringHelpers.greekToLatin.containsKey(character)) {
        normalizedWord += StringHelpers.greekToLatin[character]!;
      } else {
        normalizedWord += character;
      }
    }
    return normalizedWord;
  }

  /// Adds a [replacement] character at [index] of the `String`.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'hello';
  /// String replaced = foo.replaceAtIndex(index:2,replacement:''); // returns 'helo';
  /// ```
  String? replaceAtIndex({required int index, required String replacement}) {
    if (this.isBlank) {
      return this;
    }
    if (index > this!.length) {
      return this;
    }
    if (index < 0) {
      return this;
    }

    return '${this!.substring(0, index)}$replacement${this!.substring(index + 1, this!.length)}';
  }

  /// Given a pattern returns the starting indices of all occurrences of the [pattern] in the `String`.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'abracadabra';
  /// String fooOccs = foo.findPatterns(pattern:'abr'); // returns '[0, 7]'
  /// ```
  List<int> findPattern({required String pattern}) {
    if (this.isBlank) {
      return [];
    }

    // ignore: omit_local_variable_types
    List<int> occurrences = [];
    // How many times the pattern can fit the text provided
    var fitCount = (this!.length / pattern.length).truncate().toInt();

    if (fitCount > this!.length) {
      return [];
    }
    if (fitCount == 1) {
      if (this == pattern) {
        return [0];
      }
      return [];
    }

    for (var i = 0; i <= this!.length; i++) {
      if (i + pattern.length > this!.length) {
        return occurrences;
      }
      if (this!.substring(i, i + pattern.length) == pattern) {
        occurrences.add(i);
      }
    }

    return occurrences;
  }

  /// Strips all HTML code from `String`.
  ///
  /// ### Example
  /// ```dart
  /// String html = '<script>Hacky hacky.</script> <p>Here is some text. <span class="bold">This is bold. </span></p>';
  /// String stripped = foo.stripHtml; // returns 'Hacky hacky. Here is some text. This is bold.';
  /// ```
  String? get stripHtml {
    if (this.isBlank) {
      return this;
    }

    // ignore: unnecessary_raw_strings
    var regex = RegExp(r'<[^>]*>');
    return this!.replaceAll(regex, '');
  }

  /// If the provided `String` is empty do something.
  ///
  /// ### Example
  /// ```dart
  /// String foo = '';
  /// foo.ifEmpty(()=>print('String is empty'));
  /// ```
  String? ifEmpty(Function act) {
    if (this == null) {
      return null;
    }

    return this!.trim().isEmpty ? act() : this;
  }

  /// If the provided `String` is `null` do something.
  ///
  /// ### Example
  /// ```dart
  /// String foo = ''
  /// foo.ifEmpty(()=>print('String is null'));
  /// ```
  String ifNull(Function act) {
    if (this != null) {
      return this!;
    }

    return act();
  }

  /// Provide default value if the `String` is `null`.
  ///
  /// ### Example
  /// ```dart
  /// String? foo = null;
  /// foo.ifNull('dont be null'); // returns 'dont be null'
  /// ```
  String? defaultValue(String defaultValue) {
    if (this != null) {
      return this;
    }
    return defaultValue;
  }

  /// Repeats the `String` [count] times.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'foo';
  /// String fooRepeated = foo.repeat(5); // 'foofoofoofoofoo'
  /// ```
  String? repeat(int count) {
    if (this.isBlank || count <= 0) {
      return this;
    }
    var repeated = this!;
    for (var i = 0; i < count - 1; i++) {
      repeated += this!;
    }
    return repeated;
  }

  /// Squeezes the `String` by removing repeats of a given character.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'foofoofoofoofoo';
  /// String fooSqueezed = foo.squeeze('o'); // 'fofofofofo';
  /// ```
  String? squeeze(String char) {
    if (this.isBlank) {
      return this;
    }

    var sb = '';
    for (var i = 0; i < this!.length; i++) {
      if (i == 0 ||
          this![i - 1] != this![i] ||
          (this![i - 1] == this![i] && this![i] != char)) {
        sb += this![i];
      }
    }
    return sb;
  }

  /// Checks if the `String` is consisted of same characters (ignores cases).
  ///
  /// ### Example
  /// ```dart
  /// String foo1 = 'ttttttt'
  /// bool hasSame1 = foo.hasSameCharacters(); // true;
  /// ```
  /// ```dart
  /// String foo = 'ttttttt12'
  /// bool hasSame2 = foo.hasSameCharacters();  // false;
  /// ```
  bool get hasSameCharacters {
    if (this.isBlank) {
      return false;
    }

    if (this!.length > 1) {
      var b = this![0].toLowerCase();
      for (var i = 1; i < this!.length; i++) {
        var c = this![i].toLowerCase();
        if (c != b) {
          return false;
        }
      }
    }
    return true;
  }

  /// Shuffles the given `String`'s characters.
  ///
  /// ### Example
  /// ```dart
  /// String foo1 = 'esentis';
  /// String shuffled = foo.shuffle; // 'tsniees'
  /// ```
  String? get shuffle {
    if (this.isBlank) {
      return this;
    }

    var stringArray = toArray;
    stringArray.shuffle();
    return stringArray.join();
  }

  /// The Levenshtein distance between two words is the minimum number of single-character
  ///
  /// edits (insertions, deletions or substitutions) required to change one word into the other.
  ///
  /// ### Example
  /// ```dart
  /// String foo1 = 'esentis';
  /// int dist = foo.getLevenshtein('esentis2'); // 1
  /// ```
  int? getLevenshtein(String b) {
    if (this.isBlank) {
      return null;
    }

    var a = this!.toLowerCase();
    b = b.toLowerCase();

    List<int> costs = List<int>.filled(b.length + 1, 0);

    for (var j = 0; j <= b.length; j++) {
      costs[j] = j;
    }

    for (var i = 1; i <= a.length; i++) {
      int nw = costs[0];
      costs[0] = i;

      for (var j = 1; j <= b.length; j++) {
        int cj = min(1 + min(costs[j], costs[j - 1]),
            a[i - 1] == b[j - 1] ? nw : nw + 1);
        nw = costs[j];
        costs[j] = cj;
      }
    }

    return costs[b.length];
  }

  /// Inspired from Vincent van Proosdij.
  ///
  /// Formats the `String` with a specific mask.
  ///
  /// You can assign your own [specialChar], defaults to '#'.
  ///
  /// ### Example
  /// ```dart
  ///var string3 = 'esentisgreece';
  ///var mask3 = 'Hello ####### you are from ######';
  ///var masked3 = string3.formatWithMask(mask3); // returns 'Hello esentis you are from greece'
  /// ```
  String? formatWithMask(String mask, {String specialChar = '#'}) {
    if (this.isBlank) {
      return this;
    }

    //var buffer = StringBuffer();
    var maskChars = mask.toArray;
    var index = 0;
    var out = '';
    for (var m in maskChars) {
      if (m == specialChar) {
        if (index < this!.length) {
          out += this![index];
          index++;
        }
      } else {
        out += m;
      }
    }
    return out;
  }

  /// Removes the first [n] characters from the `String`.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'esentis'
  /// String newFoo = foo.removeFirst(3) // 'ntis';
  /// ```
  String? removeFirst(int n) {
    if (this.isBlank) {
      return this;
    }

    if (n <= 0) {
      return this;
    }
    if (n >= this!.length) {
      return '';
    }
    return this!.substring(n, this!.length);
  }

  /// Removes the last [n] characters from the `String`.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'esentis';
  /// String newFoo = foo.removeLast(3); // 'esen';
  /// ```
  String? removeLast(int n) {
    if (this.isBlank || n <= 0) {
      return this;
    }

    if (n >= this!.length) {
      return '';
    }
    return this!.substring(0, this!.length - n);
  }

  /// Trims the `String` to have maximum [n] characters.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'esentis';
  /// String newFoo = foo.maxChars(3); // 'esen';
  /// ```
  String? maxChars(int n) {
    if (this.isBlank || n >= this!.length) {
      return this;
    }

    if (n <= 0) {
      return '';
    }

    return this!.substring(0, n);
  }

  /// Reverses slash in the `String`, by providing [direction],
  ///
  /// `0 = / -> \\`
  ///
  /// `1 = \\-> /`
  ///
  /// ### Example
  /// ```dart
  /// String foo1 = 'C:/Documents/user/test';
  /// String revFoo1 = foo1.reverseSlash(0); // returns 'C:\Documents\user\test'
  ///
  /// String foo2 = 'C:\\Documents\\user\\test';
  /// String revFoo2 = foo1.reverseSlash(1); // returns 'C:/Documents/user/test'
  /// ```
  String? reverseSlash(int direction) {
    if (this.isBlank) {
      return this;
    }

    switch (direction) {
      case 0:
        return this!.replaceAll('/', '\\');
      case 1:
        return this!.replaceAll('\\', '/');
      default:
        return this;
    }
  }

  /// Returns the character at [index] of the `String`.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo1 = 'esentis';
  /// String char1 = foo1.charAt(0); // returns 'e'
  /// String char2 = foo1.charAt(4); // returns 'n'
  /// String? char3 = foo1.charAt(-20); // returns null
  /// String? char4 = foo1.charAt(20); // returns null
  /// ```
  String? charAt(int index) {
    if (this.isBlank) {
      return this;
    }

    if (index > this!.length) {
      return null;
    }
    if (index < 0) {
      return null;
    }
    return this!.split('')[index];
  }

  /// Appends a [suffix] to the `String`.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'hello';
  /// String newFoo = foo1.append(' world'); // returns 'hello world'
  /// ```
  String append(String suffix) {
    if (this.isBlank) {
      return suffix;
    }

    return this! + suffix;
  }

  /// Prepends a [prefix] to the `String`.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'world';
  /// String newFoo = foo1.prepend('hello '); // returns 'hello world'
  /// ```
  String prepend(String prefix) {
    if (this.isBlank) {
      return prefix;
    }

    return prefix + this!;
  }

  /// Tries to format the current `String` to price amount.
  ///
  /// You can optionally pass the [currencySymbol] to append a symbol to the formatted text.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String price = '1234567';
  /// String formattedPrice = foo1.toPriceAmount(currencySymbol: '€'); // returns '12.345,67 €'
  /// ```
  String? toPriceAmount({String? currencySymbol}) {
    if (this.isBlank) {
      return this;
    }

    try {
      var f = NumberFormat.currency(locale: 'el_GR');

      return f
          .format(double.tryParse(this!.replaceAll(',', '.')))
          .replaceAll('EUR', '')
          .trim()
          .append(currencySymbol == null ? '' : ' $currencySymbol');
    } catch (e) {
      return null;
    }
  }

  /// Returns the day name of the date provided in `String` format.
  ///
  /// If the date is in `DateTime` format, you can convert it to `String` `DateTime().toString()`.
  ///
  /// You can provide the [locale] to filter the result to a specific language.
  ///
  /// Defaults to 'en-US'.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String date = '2021-10-23';
  /// String day = date.getDayFromDate(); // returns 'Saturday'
  /// String grDay = date.getDayFromDate(locale:'el'); // returns 'Σάββατο'
  /// ```
  String? getDayFromDate({String locale = 'en'}) {
    initializeDateFormatting(locale);
    if (this.isBlank) {
      return this;
    }

    var date = DateTime.tryParse(this!);
    if (date == null) {
      return null;
    }
    return DateFormat('EEEE', locale).format(date).toString();
  }

  /// Returns the month name of the date provided in `String` format.
  ///
  /// If the date is in `DateTime` format, you can convert it to `String` `DateTime().toString()`.
  ///
  /// You can provide the [locale] to filter the result to a specific language.
  ///
  /// Defaults to 'en-US'.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String date = '2021-10-23';
  /// String month = date.getMonthFromDate(); // returns 'August'
  /// String grMonth = date.getMonthFromDate(locale:'el'); // returns 'Αυγούστου'
  /// ```
  String? getMonthFromDate({String locale = 'en'}) {
    initializeDateFormatting(locale);
    if (this.isBlank) {
      return this;
    }

    var date = DateTime.tryParse(this!);
    if (date == null) {
      return null;
    }
    return DateFormat('MMMM', locale).format(date).toString();
  }

  /// Returns the first day of the month from the provided `DateTime` in `String` format.
  ///
  /// If the date is in `DateTime` format, you can convert it to `String` `DateTime().toString()`.
  ///
  /// You can provide the [locale] to filter the result to a specific language.
  ///
  /// Defaults to 'en-US'.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String date = '2021-10-23';
  /// String day = date.firstDayOfDate(); // returns 'Friday'
  /// String grDay = date.firstDayOfDate(locale:'el'); // returns 'Παρασκευή'
  /// ```
  String? firstDayOfMonth({String locale = 'en'}) {
    initializeDateFormatting(locale);
    if (this.isBlank) {
      return this;
    }

    var date = DateTime.tryParse(this!);
    if (date == null) {
      return null;
    }
    return DateFormat('EEEE', locale)
        .format(DateTime(date.year, date.month, 1))
        .toString();
  }

  /// Returns the last day of the month from the provided `DateTime` in `String` format.
  ///
  /// If the date is in `DateTime` format, you can convert it to `String` `DateTime().toString()`.
  ///
  /// You can provide the [locale] to filter the result to a specific language.
  ///
  /// Defaults to 'en-US'.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String date = '2021-10-23';
  /// String day = date.firstDayOfDate(); // returns 'Friday'
  /// String grDay = date.firstDayOfDate(locale:'el'); // returns 'Παρασκευή'
  /// ```
  String? lastDayOfMonth({String locale = 'en'}) {
    initializeDateFormatting(locale);
    if (this.isBlank) {
      return this;
    }

    var date = DateTime.tryParse(this!);
    if (date == null) {
      return null;
    }
    return DateFormat('EEEE', locale)
        .format(
          DateTime(date.year, date.month + 1, 1).add(
            const Duration(days: -1),
          ),
        )
        .toString();
  }

  /// Replaces the Greek 12-hour time literals with the English 12-hour time literals.
  /// πμ -> pm -> AM (ante meridiem / before mesembria / before noon)
  /// μμ -> mm -> PM (post meridiem / after mesembria / after noon)
  ///
  /// For example:
  /// ```
  /// 05/12/2023 05:45:17 μ.μ.
  /// ```
  /// will return
  /// ```
  /// 05/12/2023 05:45:17 PM
  /// ```
  String get greekTimeLiteralToEnglish {
    // If the String does not contain any Greek characters, return it as is.
    if (!this.containsAnyGreekCharacter) {
      return this!;
    }

    // Translate all the Greek letters to the equivalent English ones.
    String onlyEnglishCharacters = this.replaceGreek!.trim();

    // Transform to the equivalent English time literals.
    onlyEnglishCharacters =
        onlyEnglishCharacters.replaceAll(".", "").toLowerCase();

    onlyEnglishCharacters = onlyEnglishCharacters.contains("pm")
        ? onlyEnglishCharacters.replaceAll("pm", "AM")
        : onlyEnglishCharacters.replaceAll("mm", "PM");

    return onlyEnglishCharacters;
  }

  /// Returns the left side of the `String` starting from [char].
  ///
  /// If [char] doesn't exist, `null` is returned.
  /// ### Example
  ///
  /// ```dart
  ///  String s = 'peanutbutter';
  ///  String foo = s.leftOf('butter'); // returns 'peanut'
  /// ```
  String? leftOf(String char) {
    if (this.isBlank) {
      return this;
    }

    int index = this!.indexOf(char);
    if (index == -1) {
      return null;
    }

    return this!.substring(0, index);
  }

  /// Returns the right side of the `String` starting from [char].
  ///
  /// If [char] doesn't exist, `null` is returned.
  ///
  /// ### Example
  ///
  /// ```dart
  ///  String s = 'peanutbutter';
  ///  String foo = s.rightOf('peanut'); // returns 'butter'
  /// ```
  String? rightOf(String char) {
    if (this.isBlank) {
      return this;
    }

    int index = this!.indexOf(char);

    if (index == -1) {
      return null;
    }
    return this!.substring(index + char.length, this!.length);
  }

  /// Truncates the `String` when more than `length` characters exist.
  ///
  /// [length] must be more than 0.
  ///
  /// If [length] > String.length the same `String` is returned without truncation.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String f = 'congratulations';
  /// String truncated = f.truncate(3); // Returns 'con...'
  /// ```
  String? truncate(int length) {
    if (this.isBlank || length <= 0 || length >= this!.length) {
      return this;
    }

    return '${this!.substring(0, length)}...';
  }

  /// Truncates a long `String` in the middle while retaining the beginning and the end.
  ///
  /// [maxChars] must be more than 0.
  ///
  /// If [maxChars] > String.length the same `String` is returned without truncation.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String f = 'congratulations';
  /// String truncated = f.truncateMiddle(5); // Returns 'con...ns'
  /// ```
  String? truncateMiddle(int maxChars) {
    if (this.isBlank || maxChars <= 0 || maxChars > this!.length) {
      return this;
    }

    int leftChars = (maxChars / 2).ceil();
    int rightChars = maxChars - leftChars;
    return '${this!.first(n: leftChars)}...${this!.last(n: rightChars)}';
  }

  /// Quotes the `String` adding "" at the start & at the end.
  ///
  /// Removes all " characters from the `String` before adding the quotes.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String text = '"""Is this real"';
  /// String quote = text.quote; // "Is this real"
  /// ```
  String? get quote {
    if (this.isBlank) {
      return this;
    }

    String normalizedString = this!.replaceAll('"', '');

    return normalizedString.append('"').prepend('"');
  }

  /// Trims leading and trailing spaces from the `String`, so as extra spaces in between words.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String text = '    esentis    thinks   ';
  /// String trimmed = text.trimAll ; // returns 'esentis thinks'
  /// ```
  String? get trimAll {
    if (this.isBlank) {
      return this;
    }

    return this!.trim().replaceAll(RegExp(' +'), ' ');
  }

  /// Checks the `String` and maps the value to a `bool` if possible.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String text = 'yes';
  /// bool? textBool = text.toBool ; // returns true
  /// ```
  bool? get toBool {
    if (this.isBlank) {
      return null;
    }

    if (this?.toLowerCase() == 'true' || this?.toLowerCase() == 'yes') {
      return true;
    }
    if (this?.toLowerCase() == 'false' || this?.toLowerCase() == 'no') {
      return false;
    }
    return null;
  }

  /// Returns the `String` after a specific character.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String test = 'hello brother what a day today';
  /// String afterString = test.after('brother'); // returns ' what a day today'
  /// ```
  String? after(String pattern) {
    if (this.isBlank) {
      return this;
    }

    if (!this!.contains(pattern)) {
      return '';
    }

    List<String> patternWords = pattern.split(' ');

    if (patternWords.isEmpty) {
      return '';
    }
    int indexOfLastPatternWord = this!.indexOf(patternWords.last);

    if (patternWords.last.length == 0) {
      return '';
    }

    return this!.substring(
        indexOfLastPatternWord + patternWords.last.length, this!.length);
  }

  /// Returns the `String` before a specific character
  ///
  /// ### Example
  ///
  /// ```dart
  /// String test = 'brother what a day today';
  /// String beforeString = test.before('brother'); // returns 'hello '
  /// ```
  String? before(String pattern) {
    if (this.isBlank) {
      return this;
    }

    if (!this!.contains(pattern)) {
      return '';
    }

    List<String> patternWords = pattern.split(' ');

    if (patternWords.isEmpty) {
      return '';
    }
    int indexOfFirstPatternWord = this!.indexOf(patternWords.first);

    if (patternWords.last.length == 0) {
      return '';
    }

    return this!.substring(
      0,
      indexOfFirstPatternWord,
    );
  }

  /// The Jaro distance is a measure of edit distance between two strings
  ///
  /// its inverse, called the Jaro similarity, is a measure of two `String`'s similarity:
  ///
  /// the higher the value, the more similar the strings are.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String t1 = 'esentis';
  /// String t2 = 'esen';
  /// print(t1.getJaro(t2)); // prints 0.8571428571428571
  /// ```
  double getJaro(String t) {
    if (this.isBlank) {
      return 1;
    }

    final int sLen = this!.length;
    final int tLen = t.length;

    if (sLen == 0 && tLen == 0) return 1;

    final int matchDistance = (max(sLen, tLen) / 2 - 1).toInt();

    final List<bool> sMatches = List<bool>.filled(sLen, false);
    final List<bool> tMatches = List<bool>.filled(tLen, false);

    int matches = 0;
    int transpositions = 0;

    for (int i = 0; i < sLen; i++) {
      final int start = max(0, i - matchDistance);
      final int end = min(i + matchDistance + 1, tLen);

      for (int j = start; j < end; j++) {
        if (tMatches[j]) continue;
        if (this!.charAt(i) != t.charAt(j)) continue;
        sMatches[i] = true;
        tMatches[j] = true;
        matches++;
        break;
      }
    }

    if (matches == 0) return 0;

    int k = 0;
    for (int i = 0; i < sLen; i++) {
      if (!sMatches[i]) continue;
      while (!tMatches[k]) {
        k++;
      }
      if (this!.charAt(i) != t.charAt(k)) transpositions++;
      k++;
    }

    return ((matches / sLen) +
            (matches / tLen) +
            ((matches - transpositions / 2.0) / matches)) /
        3.0;
  }

  /// Checks if the `String` is Blank (null, empty or only white spaces).
  bool get isBlank => this?.trim().isEmpty ?? true;

  /// Checks if the `String` is not blank (null, empty or only white spaces).
  bool get isNotBlank => isBlank == false;

  /// Return [this] if not blank. Otherwise return [newString].
  String? ifBlank(String? newString) =>
      asIf((s) => s.isNotBlank, this, newString);

  /// Compares [this] using [comparison] and returns [trueString] if true, otherwise return [falseString].
  ///
  /// ### Example
  ///
  /// ```dart
  /// String s = 'OK'.asIf((s) => s == "OK", "is OK", "is not OK"); // returns "is OK";
  /// ```
  String? asIf(bool Function(String?) comparison, String? trueString,
          String? falseString) =>
      comparison(this) ? trueString : falseString;

  /// Wraps the `String` between two strings. If [before] is a wrap char and [after] is omitted, the method resolve [after] using [getOppositeChar].
  ///
  /// ### Example
  ///
  /// ```dart
  /// String s = "esentis".wrap("AA", after: "BB"); // returns "AAesentisBB";
  /// ```
  String wrap(String? before, {String? after}) {
    before = before.ifBlank("");
    if (after.isBlank) {
      if (before.isCloseWrapChar()) {
        before = before.getOppositeChar();
      }
      after = before.getOppositeChar();
    }
    return "$before${this as String}${after.ifBlank(before)}";
  }

  /// Returns the opposite wrap char of the `String` if possible, otherwise returns the same `String`.
  ///
  /// ## Example
  ///
  /// ```dart
  /// String foo = '(';
  /// String oppositeFood = foo.getOppositeChar(); // returns ')';
  /// ```
  String? getOppositeChar() {
    switch (this) {
      case "(":
        return ")";
      case ")":
        return "(";
      case "[":
        return "]";
      case "]":
        return "[";
      case "{":
        return "}";
      case "}":
        return "{";
      case "<":
        return ">";
      case ">":
        return "<";
      case "\\":
        return "/";
      case "/":
        return "\\";
      case "¿":
        return "?";
      case "?":
        return "¿";
      case "!":
        return "¡";
      case "¡":
        return "!";
      default:
        return this;
    }
  }

  /// Check if `String` is a open wrap char: `<`, `{`, `[`, `"`, `'`.
  /// ### Example
  ///
  /// ```dart
  /// bool isOpenWrap = "(".isOpenWrapChar(); // returns true;
  /// ```
  bool isOpenWrapChar() =>
      this.isNotNull && StringHelpers.openWrappers.contains(this);

  /// Check if the `String` is a close wrap char: `>`, `}`, `]`, `"`, `'`.
  ///
  /// ### Example
  ///
  /// ```dart
  /// bool isCloseWrap = ")".isCloseWrapChar(); // returns true;
  /// ```
  bool isCloseWrapChar() =>
      this.isNotNull && StringHelpers.closeWrappers.contains(this);

  /// Continuously removes from the beginning of the `String` any match in [patterns].
  ///
  /// ### Example
  ///
  /// ```dart
  /// String s = "esentis".removeFirstAny(["s", "ng"]);// returns "esentis";
  /// ```
  String? removeFirstAny(List<String?> patterns) {
    var from = this;
    if (from.isNotBlank) {
      for (var pattern in patterns) {
        if (pattern != null && pattern.isNotEmpty) {
          while (from!.startsWith(pattern)) {
            from = from.removeFirst(pattern.length);
          }
        }
      }
    }
    return from;
  }

  /// Continuously removes from the end of the `String`, any match in [patterns].
  ///
  /// ### Example
  ///
  /// ```dart
  /// String s = "esentisfs12".removeLastAny(["12","s","ng","f",]); // returns "esentis";
  /// ```
  String? removeLastAny(List<String?> patterns) {
    var from = this;
    if (from.isNotBlank) {
      for (var pattern in patterns) {
        if (pattern != null && pattern.isNotEmpty) {
          while (from!.endsWith(pattern)) {
            from = from.removeLast(pattern.length);
          }
        }
      }
    }
    return from;
  }

  /// Continuously removes from the beginning & the end of the `String`, any match in [patterns].
  String? removeFirstAndLastAny(List<String?> patterns) =>
      removeFirstAny(patterns).removeLastAny(patterns);

  /// Removes the [pattern] from the end of the `String`.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String s = "coolboy".removeLastEqual("y"); // returns "coolbo";
  /// ```
  String? removeLastEqual(String? pattern) => removeLastAny([pattern]);

  /// Removes any [pattern] match from the beginning of the `String`.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String s = "djing".removeFirstEqual("dj"); // returns "ing"
  /// ```
  String? removeFirstEqual(String? pattern) => removeFirstAny([pattern]);

  /// Removes any [pattern] match from the beginning & the end of the `String`.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String edited = "abracadabra".removeFirstAndLastEqual("a"); // returns "bracadabr";
  /// ```
  String? removeFirstAndLastEqual(String? pattern) =>
      removeFirstEqual(pattern).removeLastEqual(pattern);

  /// Removes everything in the `String` after the first match of the [pattern].
  ///
  /// ### Example
  /// ```dart
  /// String test = 'hello brother what a day today';
  /// String afterString = test.removeAfter('brother'); // returns 'hello ';
  /// ```
  String? removeAfter(String pattern) {
    if (this.isBlank) {
      return this;
    }

    if (!this!.contains(pattern)) {
      return '';
    }

    List<String> patternWords = pattern.split(' ');

    if (patternWords.isEmpty) {
      return '';
    }
    int indexOfLastPatternWord = this!.indexOf(patternWords.last);

    if (patternWords.last.length == 0) {
      return '';
    }

    return this!.substring(0, indexOfLastPatternWord);
  }

  /// Removes everything in the `String` before the match of the [pattern].
  ///
  /// ### Example
  ///
  /// ```dart
  /// String test = 'hello brother what a day today';
  /// String afterString = test.removeBefore('brother'); // returns 'brother what a day today';
  /// ```
  String? removeBefore(String pattern) {
    if (this.isBlank) {
      return this;
    }

    if (!this!.contains(pattern)) {
      return '';
    }

    List<String> patternWords = pattern.split(' ');

    if (patternWords.isEmpty) {
      return '';
    }
    int indexOfFirstPatternWord = this!.indexOf(patternWords.first);

    if (patternWords.last.length == 0) {
      return '';
    }

    return this!.substring(
      indexOfFirstPatternWord + 1,
      this!.length,
    );
  }

  /// Adds a `String` after the first match of the [pattern]. The [pattern] should not be `null`.
  ///
  /// If there is no match, the `String` is returned unchanged.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String test = 'hello brother what a day today';
  /// String afterString = test.addAfter('brother', ' sam '); // returns 'hello brother sam what a day today ';
  /// ```
  String? addAfter(String pattern, String addition) {
    if (this.isBlank) {
      return this;
    }

    if (!this!.contains(pattern)) {
      return this;
    }

    List<String> patternWords = pattern.split(' ');

    if (patternWords.isEmpty) {
      return '';
    }
    int indexOfLastPatternWord = this!.indexOf(patternWords.last);

    if (patternWords.last.length == 0) {
      return '';
    }

    return this!.substring(0, indexOfLastPatternWord + 1) +
        addition +
        this!.substring(indexOfLastPatternWord + 1, this!.length);
  }

  /// Adds a `String` before the first match of the [pattern]. The [pattern] should not be `null`.
  ///
  /// If there is no match, the `String` is returned unchanged.
  ///
  /// ### Example
  /// ```dart
  /// String test = 'hello brother what a day today';
  /// String afterString = test.addBefore('brother', 'big '); // returns 'hello big brother what a day today';
  /// ```
  String? addBefore(String pattern, String adition) {
    if (this.isBlank) {
      return this;
    }

    if (!this!.contains(pattern)) {
      return this;
    }

    List<String> patternWords = pattern.split(' ');

    if (patternWords.isEmpty) {
      return '';
    }
    int indexOfFirstPatternWord = this!.indexOf(patternWords.first);

    if (patternWords.last.length == 0) {
      return '';
    }

    return this!.substring(0, indexOfFirstPatternWord) +
        adition +
        this!.substring(
          indexOfFirstPatternWord,
          this!.length,
        );
  }

  /// Checks if the `String` matches **ANY** of the given [patterns].
  ///
  /// ### Example
  ///
  /// ```dart
  /// bool contains = "abracadabra".containsAny(["a", "p"]); // returns true;
  /// ```
  bool containsAny(List<String?> patterns) {
    if (this.isNotBlank) {
      for (String? item in patterns.where((element) => element.isNotBlank)) {
        if (this!.contains(item!)) {
          return true;
        }
      }
    }
    return false;
  }

  /// Checks if the `String` matches **ALL** given [patterns].
  ///
  /// ### Example
  ///
  /// ```dart
  /// bool contains = "abracadabra".containsAll(["abra", "cadabra"]; // returns true;
  /// ```
  bool containsAll(List<String?> patterns) {
    for (String? item in patterns.where((element) => element.isNotBlank)) {
      if (this.isBlank || this!.contains(item!) == false) {
        return false;
      }
    }
    return true;
  }

  /// Returns the MD5 hash of the `String`.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String md5 = '123456'.md5; // returns "e10adc3949ba59abbe56e057f20f883e";
  /// ```
  String? get md5 {
    String? data = this;
    if (data.isNotBlank) {
      var content = const Utf8Encoder().convert(data!);
      var md5 = crypto.md5;
      var digest = md5.convert(content);
      data = hex.encode(digest.bytes);
    }
    return data;
  }

  /// Formats the `String` to show its proper file size.
  ///
  /// If the `String` is not a valid integer, it is returned unchanged.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = '24117248';
  /// String formatted = foo.formatFileSize; // returns '23 MB';
  /// ```
  String? get formatFileSize {
    if (this.isBlank) {
      return this;
    }
    var number = this.toInt();
    if (number == null) {
      return this;
    }

    List<String> suffix = ["bytes", "KB", "MB", "GB"];

    int j = 0;

    while (number! >= 1024 && j < 4) {
      number = (number / 1024).floor();
      j++;
    }
    return "$number ${suffix[j]}";
  }

  /// Transforms the `String` to 1337 alphabet.
  ///
  /// The letters are randomized since each letter can have multiple variations.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'esentis';
  /// String leet = foo.toLeet ; // returns '€5£п+!$';
  /// ```
  String? get toLeet {
    if (this.isBlank) {
      return this;
    }
    final letters = this!.split('');

    final leetLetters = [];
    letters.forEach((e) {
      final count = StringHelpers.leetAlphabet[e].length;
      final random = Random().nextInt(count);
      print(StringHelpers.leetAlphabet[e][random]);
      leetLetters.add(StringHelpers.leetAlphabet[e][random]);
    });

    return leetLetters.join();
  }

  /// Transforms the leet symbols of a string to their equivalent letters.
  ///
  /// For example:
  /// ```
  /// th!s !s just @ t3st
  /// ```
  /// will produce:
  /// ```
  /// this is just a test
  /// ```
  String? get fromLeet {
    List<String> stringWithSymbols = this!.split('');
    List<String> letters = [];

    for (int i = 0; i < stringWithSymbols.length; i++) {
      String currentCharacter = stringWithSymbols[i].toLowerCase().trim();
      if (currentCharacter.isEmpty) {
        letters.add(" ");
      }

      if (StringHelpers.leetAlphabet.containsKey(currentCharacter)) {
        letters.add(currentCharacter);
      } else {
        // The current character is a leet symbol - find it's equivalent letter.
        StringHelpers.leetAlphabet.forEach((key, value) {
          if (value.contains(currentCharacter)) {
            letters.add(key);
          }
        });
      }
    }

    return letters.join();
  }

  /// Checks if the `String` provided is a valid credit card number using Luhn Algorithm.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String cc = '5104 4912 8031 9406';
  /// bool isCreditCard = cc.isCreditCard ; returns true;
  /// ```
  bool? get isCreditCard {
    if (this.isBlank) {
      return false;
    }

    String trimmed = this!.removeWhiteSpace!;

    int sum = 0;
    bool alternate = false;
    for (int i = trimmed.length - 1; i >= 0; i--) {
      List<String> nx = trimmed.toArray;
      int n = int.parse(nx[i]);

      if (alternate) {
        n *= 2;

        if (n > 9) {
          n = (n % 10) + 1;
        }
      }
      sum += n;
      alternate = !alternate;
    }
    return (sum % 10 == 0);
  }

  /// Removes all whitespace from the `String`.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = '   Hel l o W   orld';
  /// String striped = foo.removeWhiteSpace; // returns 'HelloWorld';
  /// ```
  String? get removeWhiteSpace {
    if (this.isBlank) {
      return this;
    }
    return this!.replaceAll(RegExp(r'\s+'), '');
  }

  /// Checks whether the `String` is a valid IBAN.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String iban = 'GR1601101250000000012300695';
  /// bool isIban = iban.isIban; // returns true;
  /// ```
  ///
  /// ```dart
  /// String iban = 'GR01250000000012300695';
  /// bool isIban = iban.isIban; // returns false;
  /// ```
  bool get isIban {
    if (this.isBlank) {
      return false;
    }

    if (this!.length <= 2) {
      return false;
    }
    final countryCode = this.first(n: 2);

    if (!StringHelpers.ibanLen.containsKey(countryCode)) {
      return false;
    }

    if (StringHelpers.ibanLen[countryCode] != this!.length) {
      return false;
    }

    var regex = RegExp(
        r'(^[a-zA-Z]{2}(?:0[2-9]|[1-8][0-9]|9[0-8])[a-zA-Z0-9]{4}[0-9]{6}[a-zA-Z0-9]{0,20}$)');
    return regex.hasMatch(this!);
  }

  /// Checks whether the provided `String` is a valid Greek ID number.
  ///
  /// The number should be of format XX999999, where XX are letters from both the Greek and the Latin alphabet (ABEZHIKMNOPTYX).
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'AB123456';
  /// bool isGreekId = foo.isGreekId; // returns true;
  /// ```
  ///
  /// ```dart
  /// String foo = 'AB1234567';
  /// bool isGreekId = foo.isGreekId; // returns false;
  /// ```
  bool get isGreekId {
    if (this.isBlank) {
      return false;
    }

    if (this!.length != 8) {
      return false;
    }

    final List<String> firstTwoLetters = this.first(n: 2)!.split('');
    final String restLetters = this!.last(n: 6)!;

    // Besides the first two letters, the rest of the ID should be a 6digit number.
    if (!restLetters.isNumber) {
      return false;
    }

    // If the first two letters of the provided String are not valid ones.
    if (!StringHelpers.validLetters.contains(firstTwoLetters.first) ||
        !StringHelpers.validLetters.contains(firstTwoLetters.last)) {
      return false;
    }

    return true;
  }

  /// Checks whether the `String` is in lowercase.
  bool? get isLowerCase {
    if (this.isBlank) {
      return false;
    }
    return this == this!.toLowerCase();
  }

  /// Checks whether the `String` is in uppercase.
  bool? get isUpperCase {
    if (this.isBlank) {
      return false;
    }
    return this == this!.toGreekUpperCase();
  }

  /// Swaps the case in the `String`.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'Hello World';
  /// String swapped = foo.swapCase(); // returns 'hELLO wORLD';
  /// ```
  String? swapCase() {
    if (this.isBlank) {
      return this;
    }

    List<String> letters = this!.toArray;

    String swapped = '';

    for (final l in letters) {
      if (l.isUpperCase!) {
        swapped += l.toLowerCase();
      } else {
        swapped += l.toUpperCase();
      }
    }
    return swapped;
  }

  /// Checks whether the provided `String` is a valid Swift code.
  bool? get isSwiftCode {
    var regex = RegExp(r'(^[A-Za-z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$)');
    return regex.hasMatch(this!);
  }

  /// Returns the digit count of the `String`.
  ///
  ///### Example
  ///
  ///```dart
  ///String foo = 'Hello World';
  ///int digitCount = foo.getDigitCount(); // returns 0;
  ///```
  ///
  ///```dart
  ///String foo = 'Hello World 123';
  ///int digitCount = foo.getDigitCount(); // returns 3;
  ///```
  int get digitCount {
    if (this.isBlank) {
      return 0;
    }
    RegExp digitsOnly = RegExp(r'\d');
    return digitsOnly.allMatches(this!).length;
  }

  /// Checks whether the `String` is a valid ASCII string.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'Hello World';
  /// bool isAscii = foo.isAscii; // returns true;
  /// ```
  ///
  /// ```dart
  /// String foo = 'œ∑´®†¥¨ˆøπ';
  /// bool isAscii = foo.isAscii; // returns false;
  /// ```
  bool get isAscii {
    if (this == null) {
      return false;
    }
    if (this!.isEmpty) {
      return true;
    }
    final ascii = new RegExp(r'^[\x00-\x7F]+$');
    return ascii.hasMatch(this!);
  }

  /// Checks whether the `String` is an anagram of the provided `String`.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'Hello World';
  /// bool isAnagram = foo.isAnagram('World Hello'); // returns true;
  /// ```
  ///
  /// ```dart
  /// String foo = 'Hello World';
  /// bool isAnagram = foo.isAnagram('World Hello!'); // returns false;
  /// ```
  bool isAnagramOf(String s) {
    if (this.isBlank || s.isBlank) {
      return false;
    }
    final String word1 = this!.removeWhiteSpace!;

    final String word2 = s.removeWhiteSpace!;

    if (word1.length != word2.length) {
      return false;
    }

    Map<String, int> charCount = {};

    word1
        .split('')
        .forEach((char) => charCount[char] = (charCount[char] ?? 0) + 1);

    word2
        .split('')
        .forEach((char) => charCount[char] = (charCount[char] ?? 0) - 1);

    return charCount.values.every((count) => count == 0);
  }

  /// Checks whether the `String` is a palindrome.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'Hello World';
  /// bool isPalindrome = foo.isPalindrome; // returns false;
  /// ```
  ///
  /// ```dart
  /// String foo = 'racecar';
  /// bool isPalindrome = foo.isPalindrome; // returns true;
  /// ```
  bool get isPalindrome {
    if (this.isBlank) {
      return false;
    }
    return this == this.reverse;
  }

  /// Checks whether the `String` is consisted of both upper and lower case letters.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'Hello World';
  /// bool isMixedCase = foo.isMixedCase; // returns true;
  /// ```
  ///
  /// ```dart
  /// String foo = 'hello world';
  /// bool isMixedCase = foo.isMixedCase; // returns false;
  ///
  bool isMixedCase() {
    if (this.isBlank) {
      return false;
    }
    return this!.toUpperCase() != this && this!.toLowerCase() != this;
  }
}
