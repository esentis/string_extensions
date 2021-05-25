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
    if (isEmpty) {
      return 0;
    }
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
    if (isEmpty) {
      return this;
    }
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
    if (isEmpty) {
      return 0;
    }
    var words = trim().split(RegExp(r'(\s+)'));
    return words.length;
  }

  /// Returns the word title cased.
  ///
  /// ```dart
  /// String foo = 'Hello dear friend how you doing ?';
  /// Sting titleCased = foo.toTitleCase() // returns 'Hello Dear Friend How You Doing'.
  /// ```
  String toTitleCase() {
    if (isEmpty) {
      return this;
    }
    var words = toLowerCase().split(' ');
    for (var i = 0; i < words.length; i++) {
      words[i] = words[i].substring(0, 1).toUpperCase() + words[i].substring(1);
    }

    return words.join(' ');
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
    if (isEmpty) {
      return this;
    }
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
    if (isEmpty) {
      return this;
    }
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
    if (isEmpty) {
      return false;
    }
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
    if (isEmpty) {
      return this;
    }
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
    if (isEmpty) {
      return this;
    }
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
    if (isEmpty) {
      return this;
    }
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
  List<Map<String, int>> charOccurences() {
    if (isEmpty) {
      return [];
    }
    // ignore: omit_local_variable_types
    List<Map<String, int>> occurences = [];
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
  String mostFrequent() {
    if (isEmpty) {
      return this;
    }

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

  /// Returns the String reversed.
  /// ### Example
  /// ```dart
  /// String foo = 'Hello World';
  /// String reversed = foo.reverse() ; // returns 'dlrow olleH'
  /// ```
  String reverse() {
    if (isEmpty) {
      return this;
    }

    var letters = split('').toList().reversed;
    return letters.reduce((current, next) => current + next);
  }

  /// Returns whether the String is valid IPv4.
  /// ### Example 1
  /// ```dart
  /// String foo = '192.168.1.14';
  /// bool isIpv4 = foo.isIpv4(); // returns true
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = '192.168.1.14.150.1225';
  /// bool isIpv4 = foo.isIpv4(); // returns false
  /// ```
  bool isIpv4() {
    if (isEmpty) {
      return false;
    }

    substring(0, 1);
    var regex = RegExp(
        r'((?:^|\s)([a-z]{3,6}(?=://))?(://)?((?:25[0-5]|2[0-4]\d|[01]?\d\d?)\.(?:25[0-5]|2[0-4]\d|[01]?\d\d?)\.(?:25[0-5]|2[0-4]\d|[01]?\d\d?)\.(?:25[0-5]|2[0-4]\d|[01]?\d\d?))(?::(\d{2,5}))?(?:\s|$))');
    return regex.hasMatch(this);
  }

  /// Returns the first [n] characters of the string.
  ///
  /// n is optional, by default it returns the first character of the string.
  ///
  /// If [n] provided is longer than the string's length, the string will be returned.
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
  String first({int n = 1}) {
    if (isEmpty) {
      return this;
    }

    if (length < n) {
      return this;
    }
    return substring(0, n);
  }

  /// Returns the last [n] characters of the string.
  ///
  /// [n] is optional, by default it returns the first character of the string.
  ///
  /// If [n] provided is longer than the string's length, the string will be returned.
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
  String last({int n = 1}) {
    if (isEmpty) {
      return this;
    }

    if (length < n) {
      return this;
    }
    return substring(length - n, length);
  }

  /// Returns the string to slug case.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'hello world';
  /// String fooSlug = foo.toSlug(); // returns 'hello_world'
  /// ```
  String toSlug() {
    var words = trim().split(RegExp(r'(\s+)'));
    var slugWord = '';

    if (isEmpty) {
      return this;
    }

    if (length == 1) {
      return this;
    }

    for (var i = 0; i < length; i++) {
      if (i != length - 1) {
        slugWord += words[i] + '_';
      } else {
        slugWord += words[i];
      }
    }
    return slugWord;
  }

  /// Replaces all greek words with latin. Comes handy when you want to normalize text for search.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'Αριστοτέλης';
  /// String fooReplaced = foo.replaceGreek(); // returns 'aristotelis'
  /// ```
  String replaceGreek() {
    if (isEmpty) {
      return this;
    }
    var normalizedWord = replaceAll(RegExp(r'\ευ'), 'ef')
        .replaceAll(RegExp(r'\εύ'), 'ef')
        .replaceAll(RegExp(r'\αυ'), 'av')
        .replaceAll(RegExp(r'\αύ'), 'av')
        .replaceAll(RegExp(r'\α'), 'a')
        .replaceAll(RegExp(r'\ά'), 'a')
        .replaceAll(RegExp(r'\Α'), 'a')
        .replaceAll(RegExp(r'\Ά'), 'a')
        .replaceAll(RegExp(r'\β'), 'v')
        .replaceAll(RegExp(r'\Β'), 'v')
        .replaceAll(RegExp(r'\γ'), 'g')
        .replaceAll(RegExp(r'\Γ'), 'g')
        .replaceAll(RegExp(r'\δ'), 'd')
        .replaceAll(RegExp(r'\Δ'), 'd')
        .replaceAll(RegExp(r'\ε'), 'e')
        .replaceAll(RegExp(r'\έ'), 'e')
        .replaceAll(RegExp(r'\Έ'), 'e')
        .replaceAll(RegExp(r'\Ε'), 'e')
        .replaceAll(RegExp(r'\ζ'), 'z')
        .replaceAll(RegExp(r'\Ζ'), 'z')
        .replaceAll(RegExp(r'\ι'), 'i')
        .replaceAll(RegExp(r'\ί'), 'i')
        .replaceAll(RegExp(r'\ϊ'), 'i')
        .replaceAll(RegExp(r'\ΐ'), 'i')
        .replaceAll(RegExp(r'\Ι'), 'i')
        .replaceAll(RegExp(r'\Ί'), 'i')
        .replaceAll(RegExp(r'\Ϊ'), 'i')
        .replaceAll(RegExp(r'\κ'), 'k')
        .replaceAll(RegExp(r'\Κ'), 'k')
        .replaceAll(RegExp(r'\λ'), 'l')
        .replaceAll(RegExp(r'\Λ'), 'l')
        .replaceAll(RegExp(r'\μ'), 'm')
        .replaceAll(RegExp(r'\Μ'), 'm')
        .replaceAll(RegExp(r'\ξ'), 'ks')
        .replaceAll(RegExp(r'\Ξ'), 'ks')
        .replaceAll(RegExp(r'\ο'), 'o')
        .replaceAll(RegExp(r'\ό'), 'o')
        .replaceAll(RegExp(r'\Ό'), 'o')
        .replaceAll(RegExp(r'\Ο'), 'o')
        .replaceAll(RegExp(r'\π'), 'p')
        .replaceAll(RegExp(r'\Π'), 'p')
        .replaceAll(RegExp(r'\ρ'), 'r')
        .replaceAll(RegExp(r'\Ρ'), 'r')
        .replaceAll(RegExp(r'\σ'), 's')
        .replaceAll(RegExp(r'\Σ'), 's')
        .replaceAll(RegExp(r'\ς'), 's')
        .replaceAll(RegExp(r'\τ'), 't')
        .replaceAll(RegExp(r'\Τ'), 't')
        .replaceAll(RegExp(r'\υ'), 'y')
        .replaceAll(RegExp(r'\ύ'), 'y')
        .replaceAll(RegExp(r'\ϋ'), 'y')
        .replaceAll(RegExp(r'\ΰ'), 'y')
        .replaceAll(RegExp(r'\Υ'), 'y')
        .replaceAll(RegExp(r'\Ύ'), 'y')
        .replaceAll(RegExp(r'\Ϋ'), 'y')
        .replaceAll(RegExp(r'\φ'), 'f')
        .replaceAll(RegExp(r'\Φ'), 'f')
        .replaceAll(RegExp(r'\χ'), 'ch')
        .replaceAll(RegExp(r'\Χ'), 'ch')
        .replaceAll(RegExp(r'\ψ'), 'ps')
        .replaceAll(RegExp(r'\Ψ'), 'ps')
        .replaceAll(RegExp(r'\ω'), 'o')
        .replaceAll(RegExp(r'\ώ'), 'o')
        .replaceAll(RegExp(r'\Ω'), 'o')
        .replaceAll(RegExp(r'\Ώ'), 'o');
    return normalizedWord;
  }

  /// Given a pattern returns the starting indices of all occurences of the pattern in the string.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'abracadabra';
  /// String fooOccs = foo.findPatterns(pattern:'abr'); // returns '[0, 7]'
  /// ```
  List<int> findPattern({required String pattern}) {
    if (isEmpty) {
      return [];
    }
    // ignore: omit_local_variable_types
    List<int> occurences = [];
    // How many times the pattern can fit the text provided
    var fitCount = (length / pattern.length).truncate().toInt();

    if (fitCount > length) {
      return [];
    }
    if (fitCount == 1) {
      if (this == pattern) {
        return [0];
      }
      return [];
    }

    for (var i = 0; i <= length; i++) {
      if (i + pattern.length > length) {
        return occurences;
      }
      if (substring(i, i + pattern.length) == pattern) {
        occurences.add(i);
      }
    }

    return occurences;
  }

  /// Returns a list of the string's characters.
  ///
  /// O(n)
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'abracadabra';
  /// List<String> fooArray = foo.toStringArray(); // returns '[a,b,r,a,c,a,d,a,b,r,a]'
  /// ```
  List<String> toStringArray() {
    if (isEmpty) {
      return [];
    }
    // ignore: omit_local_variable_types
    List<String> characters = [];
    for (var i = 0; i < length; i++) {
      characters.add(substring(i, i + 1));
    }
    return characters;
  }

  /// Strips all HTML code from String.
  ///
  /// ### Example
  /// ```dart
  /// String html = '<script>Hacky hacky.</script> <p>Here is some text. <span class="bold">This is bold. </span></p>';
  /// String stripped = foo.stripHtml(); // returns 'Hacky hacky. Here is some text. This is bold.'
  /// ```
  String stripHtml() {
    if (isEmpty) {
      return this;
    }
    // ignore: unnecessary_raw_strings
    var regex = RegExp(r'<[^>]*>');
    return replaceAll(regex, '');
  }

  /// Returns whether the String is a "strong" password which complies to below rules :
  ///  * At least 1 uppercase
  ///  * At least 1 special character
  ///  * At least 1 number
  ///  * At least 8 characters in length
  /// ### Example
  /// ```dart
  /// String foo = 'qwerty'
  /// bool isStrong = foo.isStrongPassword() // returns false
  /// ```
  /// ```dart
  /// String foo = 'IsTh!$Strong'
  /// bool isStrong = foo.isStrongPassword() // returns true
  /// ```
  bool isStrongPassword() {
    if (isEmpty) {
      return false;
    }
    var regex = RegExp(
        r'^(?=.*([A-Z]){1,})(?=.*[!@#$&*]{1,})(?=.*[0-9]{1,})(?=.*[a-z]{1,}).{8,100}$');
    return regex.hasMatch(this);
  }
}
