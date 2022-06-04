/// `String` helpers
class StringHelpers {
  /// Chars from Aa to Zz
  static List<String> get alphaChars =>
      (alphaUpperChars + alphaLowerChars)..sort();

  /// Chars from Aa to Zz and Numbers (0 to 9)
  static List<String> get alphaNumericChars => alphaChars + numberChars;

  /// Chars from A to Z
  static List<String> get alphaUpperChars =>
      alphaLowerChars.map((e) => e.toUpperCase()).toList();

  /// Chars from a to z
  static List<String> get alphaLowerChars =>
      (lowerConsonants + lowerVowels)..sort();

  /// Numbers from 0 to 9
  static List<String> get numberChars =>
      ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];

  /// Line feed and carriage retrun
  static List<String> get breakLineChars => ["\n", "\r", "\r\n"];

  /// White space char
  static List<String> get whiteSpaceChars => [" "];

  /// Invisible char (white space, line feed, ident, carriage return)
  static List<String> get invisibleChars =>
      whiteSpaceChars + breakLineChars + identChars;

  /// Ident char (tab)
  static List<String> get identChars => ["\t"];

  /// Double-Quotes, Single-Quotes, Open Brackets etc
  static List<String> get openWrappers => ["(", "{", "[", "<"] + quotes;

  /// Double-Quotes, Single-Quotes, Close Brackets etc
  static List<String> get closeWrappers => [")", "}", "]", ">"] + quotes;

  /// Double-Quotes, Single-Quotes
  static List<String> get quotes => ["\"", "'", "`"];

  /// Double-Quotes, Single-Quotes, Open and Close Brackets etc
  static List<String> get wrappers => openWrappers + closeWrappers;

  /// Dot, Question mark and Exclamation Mark
  static List<String> get endOfSentenceChars => [".", "?", "!"];

  /// Upper and lower case consonants
  static List<String> get consonants =>
      (upperConsonants + lowerConsonants)..sort();

  /// Lower consonants
  static List<String> get lowerConsonants => [
        "b",
        "c",
        "d",
        "f",
        "g",
        "h",
        "j",
        "k",
        "l",
        "m",
        "n",
        "p",
        "q",
        "r",
        "s",
        "t",
        "v",
        "w",
        "x",
        "z"
      ];

  /// Upper consonants
  static List<String> get upperConsonants =>
      lowerConsonants.map((e) => e.toUpperCase()).toList();

  /// Upper and lower vowels
  static List<String> get vowels => (upperVowels + lowerVowels)..sort();

  /// Lower vowels
  static List<String> get lowerVowels => ["a", "e", "i", "o", "u", "y"];

  /// Upper vowels
  static List<String> get upperVowels =>
      lowerVowels.map((e) => e.toUpperCase()).toList();

  /// Semicolon, colon and comma
  static List<String> get midSentenceChars => [":", ";", ","];

  static Map<String, dynamic> get leetAlphabet => {
        "a": ['∆', '4', '/-\\', '/_\\', '@', '/\\', 'Д', 'а'],
        "b": ['8', '|3', '13', '|}', '|8', '|B', '|8', 'ß', 'в', 'ь'],
        "c": ['<', '{', '[', '(', '©', '¢', 'с'],
        "d": ['|)', '|}', '|]', '|>'],
        "e": ['3', '£', '₤', '€', 'е'],
        "f": ['7', '|=', 'ph', '|#', '|"', 'ƒ'],
        "g": ['9', '[', '[+', '6'],
        "h": [
          '#',
          '|-|',
          '[-]',
          '{-}',
          '}-{',
          '}{',
          '|=|',
          '[=]',
          '/-/',
          ':-:',
          'н'
        ],
        "i": ['1', '|', '!'],
        "j": ['√', '_|', '_/', '_7', '_)', '_]', '_}'],
        "k": ['|<', '1<', 'l<', '|{', 'l{'],
        "l": ['|_', '|', '1', ']['],
        "m": [
          '|\/|',
          '^^',
          '/\\/\\',
          '/X\\',
          '[]\/][',
          '[]V[]',
          ' ][\\//][',
          '(V)',
          '//., .\\',
          'N\\',
          'м'
        ],
        "n": ['|\|', '/\/', '/V', '][\\][', 'И', 'и', 'п'],
        "o": ['0', '()', '[]', '{}', '<>', 'Ø', 'oh', 'Θ', 'о', 'ө'],
        "p": ['|o', '|O', '|>', '|*', '|°', '|D', '/o', '[]D', '|7', 'р'],
        "q": ['O_', '(,)', '0', 'kw'],
        "r": ['|2', '12', '|^', 'l2', 'Я', '®'],
        "s": ['5', '\$', '§'],
        "t": ['7', '+', "'|'", '`|`', '~|~', '-|-', "']['", 'т'],
        "v": ['V'],
        "u": ['|_|', '\\_\\', '/_/', '\\_/', '(_)', '[_]', '{_}'],
        "w": [
          '\\/\\/',
          '(/\\)',
          '\\^/',
          '|/\|',
          '\\X/',
          'VV',
          '\\_|_/',
          '\\//\\//',
          'Ш',
          '2u',
          '\V/'
        ],
        "x": ['×', '%', '*', '><', 'Ж'],
        "y": ['¥', '\|/', 'Ч', 'ү', 'у'],
        "z": ['5', '>_'],
      };
}
