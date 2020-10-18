extension MiscExtensions on String {
  /// Returns the average read time duration of the given String in seconds.
  ///
  /// The default calculation is based on 200 words per minute.
  ///
  /// You can pass the [wordsPerMinute] parameter for different read speeds.
  /// ### Example
  /// ```dart
  /// String foo =  'Hello dear friend how you doing ?';
  /// int readTime = foo.readTime() // returns 3 seconds.
  /// ```
  int readTime({int wordsPerMinute = 200}) {
    var words = trim().split(RegExp(r'(\s+)'));
    var magicalNumber = words.length / wordsPerMinute;
    return (magicalNumber * 100).toInt();
  }

  /// Capitalizes the string in normal form.
  /// ### Example
  /// ```dart
  /// String foo = 'hAckErrR';
  /// String cFoo = foo.capitalize(); // returns 'Hackerrr'.
  /// ```
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// Returns the word count in the given string.
  ///
  /// The pattern is based on spaces.
  /// ### Example
  /// ```dart
  /// String foo = 'Hello dear friend how you doing ?';
  /// int count = foo.countWords() // returns 7 words.
  /// ```
  int countWords() {
    var words = trim().split(RegExp(r'(\s+)'));
    return words.length;
  }

  /// Removes only the numbers from the String.
  /// ### Example 1
  /// ```dart
  /// String foo = 'es4e5523nt1is';
  /// String noNumbers = foo.removeNumbers() // returns 'esentis'
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = '1244e*s*4e*5523n*t*1i*s'
  /// String noNumbers = foo.removeNumbers() // returns 'e*s*e*n*t*i*s'
  /// ```
  String removeNumbers() {
    var regex = RegExp(r'(\d+)');
    return replaceAll(regex, '');
  }

  /// Returns only the letters from the String.
  /// ### Example
  /// ```dart
  /// String foo = '4*%^55/es4e5523nt1is';
  /// String onlyLetters = foo.onlyLetters() // returns 'esentis'
  /// ```
  String onlyLetters() {
    // ignore: unnecessary_raw_strings
    var regex = RegExp(r'([^a-zA-Z]+)');
    return replaceAll(regex, '');
  }

  /// Returns whether the String is mail or not.
  /// ### Example
  /// ```dart
  /// String foo = 'esentis@esentis.com'
  /// bool isMail = foo.isMail() // returns true
  /// ```
  bool isMail() {
    var regex = RegExp(r"(^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$)");
    return regex.hasMatch(this);
  }

  /// Returns the String in camelcase.
  /// ### Example
  /// ```dart
  /// String foo = 'Find max of array';
  /// String camelCase = foo.toCamelCase() // returns 'findMaxOfArray'
  /// ```
  String toCamelCase() {
    var words = trim().split(RegExp(r'(\s+)'));
    print(words.length);
    var result = words[0].toLowerCase();
    for (var i = 1; i < words.length; i++) {
      result += words[i].substring(0, 1).toUpperCase() +
          words[i].substring(1).toLowerCase();
    }
    return result;
  }

  /// Returns only the numbers from the String.
  /// ### Example
  /// ```dart
  /// String foo = '4*%^55/es4e5523nt1is';
  /// String onyNumbers = foo.onlyNumbers() // returns '455455231'
  /// ```
  String onlyNumbers() {
    // ignore: unnecessary_raw_strings
    var regex = RegExp(r'([^0-9]+)');
    return replaceAll(regex, '');
  }

  /// Removes only the letters from the String.
  /// ### Example 1
  /// ```dart
  /// String foo = 'es4e5523nt1is';
  /// String noLetters = foo.removeLetters() // returns '455231'
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = '1244e*s*4e*5523n*t*1i*s'
  /// String noLetters = foo.removeLetters() // returns '1244**4*5523**1*'
  /// ```
  String removeLetters() {
    // ignore: unnecessary_raw_strings
    var regex = RegExp(r'([a-zA-Z]+)');
    return replaceAll(regex, '');
  }

  /// Finds all character ooccurences and returns count as:
  /// ```dart
  /// List<Map<dynamic,dynamic>>
  /// ```
  /// ### Example 1
  /// ```dart
  /// String foo = 'esentis';
  /// List occurences = foo.charOccurences() // returns '[{e:2},{i:1},{n:1},{s:2},]'
  /// ```
  dynamic charOccurences() {
    var occurences = [];
    var letters = split('')..sort();
    var checkingLetter = letters[0];
    var count = 0;
    for (var i = 0; i < letters.length; i++) {
      if (letters[i] == checkingLetter) {
        count++;
        if (i == letters.length - 1) {
          occurences.add({checkingLetter: count});
          checkingLetter = letters[i];
        }
      } else {
        occurences.add({checkingLetter: count});
        checkingLetter = letters[i];
        count = 1;
      }
    }
    return occurences;
  }

  /// Finds the most frequent character in the String.
  /// ### Example 1
  /// ```dart
  /// String foo = 'Hello World';
  /// String mostFrequent = foo.mostFrequent() // returns 'l'
  /// ```
  dynamic mostFrequent() {
    var occurences = [];
    var letters = split('')..sort();
    var checkingLetter = letters[0];
    var count = 0;
    for (var i = 0; i < letters.length; i++) {
      if (letters[i] == checkingLetter) {
        count++;
        if (i == letters.length - 1) {
          occurences.add({checkingLetter: count});
          checkingLetter = letters[i];
        }
      } else {
        occurences.add({checkingLetter: count});
        checkingLetter = letters[i];
        count = 1;
      }
    }
    var mostFrequent = '';
    var occursCount = -1;
    occurences.forEach((element) {
      element.forEach((character, occurs) {
        if (occurs > occursCount) {
          mostFrequent = character;
          occursCount = occurs;
        }
      });
    });
    return mostFrequent;
  }
}
