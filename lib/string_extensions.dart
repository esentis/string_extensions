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
    var words = split(RegExp(r'(\s+)'));
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
    var words = split(RegExp(r'(\s+)'));
    return words.length;
  }

  /// Removes only the numbers from the String.
  /// ### Example 1
  /// ```dart
  /// String foo = 'es4e5523nt1is';
  /// String noNums = foo.removeNumbers() // returns 'esentis'
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = '1244e*s*4e*5523n*t*1i*s'
  /// String noNums = foo.removeNumbers() // returns 'e*s*e*n*t*i*s'
  /// ```
  String removeNumbers() {
    var regex = RegExp(r'(\d+)');
    return replaceAll(regex, '');
  }

  /// Returns only the letters from the String.
  /// ### Example
  /// ```dart
  /// String foo = '4*%^55/es4e5523nt1is';
  /// String letters = foo.onlyLetters() // returns 'esentis'
  /// ```
  String onlyLetters() {
    // ignore: unnecessary_raw_strings
    var regex = RegExp(r'([^a-zA-Z]+)');
    return replaceAll(regex, '');
  }

  /// Returns wheter the string is mail or not.
  /// ### Example
  /// ```dart
  /// String foo = 'esentis@esentis.com'
  /// bool isMail = foo.isMail() // returns true
  /// ```
  bool isMail() {
    var regex = RegExp(r"(^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$)");
    return regex.hasMatch(this);
  }
}
