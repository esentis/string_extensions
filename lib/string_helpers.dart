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

  static Map<String, dynamic> leetAlphabet = {
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

  static Map<String, dynamic> ibanLen = {
    "NO": 15,
    "BE": 16,
    "DK": 18,
    "FI": 18,
    "FO": 18,
    "GL": 18,
    "NL": 18,
    "MK": 19,
    "SI": 19,
    "AT": 20,
    "BA": 20,
    "EE": 20,
    "KZ": 20,
    "LT": 20,
    "LU": 20,
    "CR": 21,
    "CH": 21,
    "HR": 21,
    "LI": 21,
    "LV": 21,
    "MA": 28,
    "BG": 22,
    "BH": 22,
    "DE": 22,
    "GB": 22,
    "GE": 22,
    "IE": 22,
    "ME": 22,
    "RS": 22,
    "AE": 23,
    "GI": 23,
    "IL": 23,
    "AD": 24,
    "CZ": 24,
    "ES": 24,
    "MD": 24,
    "PK": 24,
    "RO": 24,
    "SA": 24,
    "SE": 24,
    "SK": 24,
    "VG": 24,
    "TN": 24,
    "PT": 25,
    "IS": 26,
    "TR": 26,
    "FR": 27,
    "GR": 27,
    "IT": 27,
    "MC": 27,
    "MR": 27,
    "SM": 27,
    "AL": 28,
    "AZ": 28,
    "CY": 28,
    "DO": 28,
    "GT": 28,
    "HU": 28,
    "LB": 28,
    "PL": 28,
    "BR": 29,
    "PS": 29,
    "KW": 30,
    "MU": 30,
    "MT": 31,
    "DZ": 26,
    "AO": 25,
    "BJ": 28,
    "BF": 28,
    "CM": 27,
    "CV": 25,
    "CF": 27,
    "TD": 27,
    "KM": 27,
    "CG": 27,
    "GQ": 27,
    "GA": 27,
    "GW": 25,
    "HN": 28,
    "IR": 26,
    "CI": 28,
    "MG": 27,
    "ML": 28,
    "MN": 20,
    "MZ": 28,
    "NI": 32,
    "NE": 28,
    "SN": 28,
    "TG": 28,
    "BY": 28,
    "BI": 27,
    "DJ": 27,
    "EG": 29,
    "SV": 28,
    "VA": 22,
    "IQ": 23,
    "JO": 30,
    "XK": 20,
    "LY": 25,
    "QA": 29,
    "RU": 33,
    "LC": 32,
    "ST": 25,
    "SC": 31,
    "SD": 18,
    "TL": 23,
    "UA": 29,
  };

  static List<String> validLetters = [
    // GREEK VARIATION
    "Α",
    "A",
    // GREEK VARIATION
    "Β",
    "B",
    // GREEK VARIATION
    "Ε",
    "E",
    // GREEK VARIATION
    "Ζ",
    "Z",
    // GREEK VARIATION
    "Η",
    "H",
    // GREEK VARIATION
    "Ι",
    "I",
    // GREEK VARIATION
    "Κ",
    "K",
    // GREEK VARIATION
    "Μ",
    "M",
    // GREEK VARIATION
    "Ν",
    "N",
    // GREEK VARIATION
    "Ο",
    "O",
    // GREEK VARIATION
    "Ρ",
    "P",
    // GREEK VARIATION
    "Τ",
    "T",
    // GREEK VARIATION
    "Υ",
    "Y",
    // GREEK VARIATION
    "Χ",
    "X"
  ];

  static Map<String, String> greekToLatin = {
    'ά': 'a',
    'Α': 'a',
    'έ': 'e',
    'Έ': 'e',
    'Ε': 'e',
    'ή': 'i',
    'Η': 'i',
    'η': 'i',
    'Ή': 'i',
    'ί': 'i',
    'Ι': 'i',
    'Ί': 'i',
    'Ϊ': 'i',
    'ϊ': 'i',
    'ΐ': 'i',
    'ό': 'o',
    'Ό': 'o',
    'Ο': 'o',
    'ο': 'o',
    'ύ': 'y',
    'υ': 'y',
    'Ύ': 'y',
    'Ϋ': 'y',
    'ϋ': 'y',
    'ε': 'e',
    'ευ': 'ef',
    'εύ': 'ef',
    'α': 'a',
    'αυ': 'av',
    'αύ': 'av',
    'β': 'v',
    'Β': 'v',
    'γ': 'g',
    'Γ': 'g',
    'δ': 'd',
    'Δ': 'd',
    'ζ': 'z',
    'Ζ': 'z',
    'θ': 'th',
    'Θ': 'th',
    'ι': 'i',
    'κ': 'k',
    'Κ': 'k',
    'λ': 'l',
    'Λ': 'l',
    'μ': 'm',
    'Μ': 'm',
    'ν': 'n',
    'Ν': 'n',
    'ξ': 'ks',
    'Ξ': 'ks',
    'π': 'p',
    'Π': 'p',
    'ρ': 'r',
    'Ρ': 'r',
    'σ': 's',
    'Σ': 's',
    'ς': 's',
    'τ': 't',
    'Τ': 't',
    'φ': 'f',
    'Φ': 'f',
    'χ': 'x',
    'Χ': 'x',
    'ψ': 'ps',
    'Ψ': 'ps',
    'ω': 'o',
    'Ω': 'o',
    'Ώ': 'o',
    'ώ': 'o',
  };
}
