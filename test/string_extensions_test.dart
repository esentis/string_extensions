// Import the test package and Counter class
import 'package:string_extensions/string_extensions.dart';
import 'package:test/test.dart';

void main() {
  test(
    'Counts the words of the String',
    () {
      String? string = 'Hello world ! dear 4asd';
      expect(string.countWords, 4);
      expect('despoina '.countWords, 1);
      expect('despoina    '.countWords, 1);
      expect(null.countWords, 0);
      expect(''.countWords, 0);
      expect(' '.countWords, 0);
    },
  );
  test(
    'Returns the read time of the String',
    () {
      String? string = 'Hello dear friend how you doing ?';
      expect(string.readTime(), 3);

      expect(null.readTime(), 0);
      expect(''.readTime(), 0);
      expect(' '.readTime(), 0);
    },
  );
  test(
    'Capitalizes the first letter of the String',
    () {
      String? string = 'hAckErrR';
      String? string2 = 'για 5 Ημέρες';
      String? string3 = 'για 5 Ημέρες Ολα θα πάνε καλά ';
      expect(string.capitalize, 'Hackerrr');
      expect(string2.capitalize, 'Για 5 ημέρες');
      expect(string3.capitalize, 'Για 5 ημέρες ολα θα πάνε καλά ');
      expect('despoina '.capitalize, 'Despoina ');
      expect('despoina    '.capitalize, 'Despoina    ');
      expect(null.capitalize, null);
      expect(''.capitalize, '');
      expect(' '.capitalize, ' ');
      expect('  '.capitalize, '  ');
    },
  );
  test(
    "Capitalizes each word's first letter",
    () {
      String? string = 'Hello dear friend how you doing ?';
      expect(string.toTitleCase, 'Hello Dear Friend How You Doing ?');
      expect('G'.toTitleCase, 'G');
      expect('despoina '.toTitleCase, 'Despoina');
      expect('despoina    '.toTitleCase, 'Despoina');
      expect('g'.toTitleCase, 'G');
      expect('gg'.toTitleCase, 'Gg');
      expect(''.toTitleCase, '');
      expect(' '.toTitleCase, ' ');
      expect('  '.toTitleCase, '  ');
      expect(null.toTitleCase, null);
    },
  );
  test(
    'Removes all numbers from the string',
    () {
      String? string = '234112731235es4234123e5523nt1is';
      expect(string.removeNumbers, 'esentis');

      expect(null.removeNumbers, null);
      expect(''.removeNumbers, '');
      expect(' '.removeNumbers, ' ');
    },
  );
  test(
    'Removes everything but latin characters',
    () {
      String? string = '4*%^55/es4e55?:"///23nt1is';
      expect(string.onlyLatin, 'esentis');

      String? string2 = '4*%^55/es4e55?:"///23nt1isαβδα';
      expect(string2.onlyLatin, 'esentis');

      String? string3 = '4*%^55/es4e55?:"///23nt1isαβδα ma455 ma2231n';
      expect(string3.onlyLatin, 'esentis ma man');

      expect(null.onlyLatin, null);
      expect(''.onlyLatin, '');
      expect(' '.onlyLatin, ' ');
    },
  );
  test(
    'Removes everything but characters',
    () {
      String? string = '*%^/ese?:"///nt12323is';
      String? string2 = '%^7777ελα 23232323ρε φιλε τι λε^ει';

      expect(string.onlyLetters, 'esentis');
      expect(string2.onlyLetters, 'ελα ρε φιλε τι λεει');
      expect('ελα ρε φιλε τι λεει%^^@@@@@@'.onlyLetters, 'ελα ρε φιλε τι λεει');
      expect('ελα ρε bro τι λεει%^^@@@@@@'.onlyLetters, 'ελα ρε bro τι λεει');
      expect('είσαι ο number 1%^^@@@@@@'.onlyLetters, 'είσαι ο number ');
    },
  );
  test(
    'Removes special characters',
    () {
      String? string =
          '/!@#\$%^\-&*()+",.?":{}|<>~_-`*%^/ese?:"///ntis/!@#\$%^&*(),.?":{}|<>~_-`';

      expect(string.removeSpecial, 'esentis');
      expect("Μαρία@ t!he 3\$rd!!!!".removeSpecial, 'Μαρία the 3rd');
    },
  );
  test(
    'Removes everything but greek characters',
    () {
      String? string = '4*%^σοφ55ία/es4e55?:"///23nt1is';
      expect(string.onlyGreek, 'σοφία');

      String? string2 = '4*%^σοφ55ία/es4e55?:"///23nt1is αγάπη';
      expect(string2.onlyGreek, 'σοφία αγάπη');

      expect(null.onlyGreek, null);
      expect(''.onlyGreek, '');
      expect(' '.onlyGreek, ' ');
    },
  );
  test('Checks whether a string contains any Greek character', () {
    String stringWithoutGreekCharacters = "ABcdE#h*j klM";
    expect(stringWithoutGreekCharacters.containsAnyGreekCharacter, false);

    String stringWithGreekCharacters = " ABcdE#hα*jklM ";
    expect(stringWithGreekCharacters.containsAnyGreekCharacter, true);

    String emptyString = " ";
    expect(emptyString.containsAnyGreekCharacter, false);

    String none = "";
    expect(none.containsAnyGreekCharacter, false);
  });
  test(
    'Converts the string to camel case',
    () {
      String? string = 'Find max of array';
      expect(string.toCamelCase, 'findMaxOfArray');

      expect(null.toCamelCase, null);
      expect(''.toCamelCase, '');
      expect(' '.toCamelCase, ' ');
    },
  );
  test(
    'Removes everything but numbers',
    () {
      String? string = '4*%^55/es4e5523nt1is';
      expect(string.onlyNumbers, '455455231');

      expect(null.onlyNumbers, null);
      expect(''.onlyNumbers, '');
      expect(' '.onlyNumbers, ' ');
    },
  );
  test(
    'Removes all letters',
    () {
      String? string = '1244e*s*4e*5523n*t*1i*s';
      expect(string.removeLetters, '1244**4*5523**1*');

      expect(null.removeLetters, null);
      expect(''.removeLetters, '');
      expect(' '.removeLetters, ' ');
    },
  );
  test(
    'Finds character occurences',
    () {
      String? string = 'esssssentis';
      expect(string.charOccurences, [
        {'e': 2},
        {'i': 1},
        {'n': 1},
        {'s': 6},
      ]);

      expect(null.charOccurences, []);
      expect(''.charOccurences, []);
      expect(' '.charOccurences, []);
    },
  );
  test(
    'Finds the most frequent character',
    () {
      String? string = 'esssssentis';
      expect(string.mostFrequent(), 's');

      expect(null.mostFrequent(), null);
      expect(''.mostFrequent(), '');
      expect(' '.mostFrequent(), ' ');
      expect('aaaaa'.mostFrequent(), 'a');
      expect('aabcd  a fff a a a'.mostFrequent(ignoreSpaces: true), 'a');
      expect('aabcd  a fff a a a'.mostFrequent(), ' ');
    },
  );
  test(
    'Reverses a string',
    () {
      String? string = 'Hello World';
      expect(string.reverse, 'dlroW olleH');

      expect(null.reverse, null);
      expect(''.reverse, '');
      expect(' '.reverse, ' ');
    },
  );
  test(
    'Checks if a string is a valid mail',
    () {
      String? string1 = 'esentis@esentis.com';
      expect(string1.isMail, true);

      String? string2 = 'esentisesentis.com';
      expect(string2.isMail, false);

      String? string3 = 'esentis@esentis.com esentis@esentis.com';
      expect(string3.isMail, false);

      expect(null.isMail, false);
      expect(''.isMail, false);
      expect(' '.isMail, false);
    },
  );
  test(
    'Checks if a string is a valid Ipv4',
    () {
      String? string1 = '192.168.1.14';
      expect(string1.isIpv4, true);

      String? string2 = '192.168.1.14.5223';
      expect(string2.isIpv4, false);

      expect(null.isIpv4, false);
      expect(''.isIpv4, false);
      expect(' '.isIpv4, false);
    },
  );
  test(
    'Checks if a string is a valid Ipv6',
    () {
      String? string1 = '2001:0db8:85a3:0000:0000:8a2e:0370:7334';
      expect(string1.isIpv6, true);

      String? string2 = '192.168.1.14';
      expect(string2.isIpv6, false);

      expect(null.isIpv6, false);
      expect(''.isIpv6, false);
      expect(' '.isIpv6, false);
    },
  );
  test(
    'Checks if a string is a number',
    () {
      String? string1 = '45';
      expect(string1.isNumber, true);

      String? string2 = '45s';
      expect(string2.isNumber, false);

      String? string3 = '45.5';
      expect(string3.isNumber, true);

      expect(null.isNumber, false);
      expect(''.isNumber, false);
      expect(' '.isNumber, false);
      expect('166373'.isNumber, true);
    },
  );
  test(
    'Checks if a string is contained in a give Iterable of Strings',
    () {
      String? string1 = '45';
      List<String?> array1 = ['45', '66'];
      expect(string1.isIn(array1), true);

      String? string2 = 'test';
      List<String?> array2 = ['45', '66', 'ffff', '2123'];
      expect(string2.isIn(array2), false);

      String? string3 = 'test';
      List<String?> array3 = ['45', '66', 'ffff', '2123', 'test'];
      expect(string3.isIn(array3), true);

      expect(null.isIn(array3), false);
      expect(''.isIn(array3), false);
      expect(' '.isIn(array3), false);
    },
  );
  test(
    'Checks if the string has only latin characters',
    () {
      String? string1 = 'hello friend Γιωργο';
      expect(string1.isLatin, false);

      String? string2 = 'test world';
      expect(string2.isLatin, true);

      String? string3 = 'testworld';
      expect(string3.isLatin, true);

      expect(null.isLatin, false);
      expect(''.isLatin, false);
      expect(' '.isLatin, false);
    },
  );
  test(
    'Checks if the string has only greek characters',
    () {
      String? string1 = 'hello friend Γιωργο';
      expect(string1.isGreek, false);

      String? string2 = 'Τα αγαθα κοποις κτωνται';
      expect(string2.isGreek, true);

      String? string3 = 'Τα αγαθά κόποις κτώνται';
      expect(string3.isGreek, true);

      expect(null.isGreek, false);
      expect(''.isGreek, false);
      expect(' '.isGreek, false);
    },
  );
  test(
    'Do something if string is empty',
    () {
      String? string1 = '45';
      expect(string1.ifEmpty(() => 'empty'), '45');

      String? string2 = '';
      expect(string2.ifEmpty(() => 'empty'), 'empty');

      expect(
        null.ifEmpty(() => 'empty'),
        null,
      );
    },
  );
  test(
    'Do something if string is null',
    () {
      String? string1;
      expect(string1.ifNull(() => 'is null'), 'is null');

      String? string2 = 'esentis';
      expect(string2.ifNull(() => 'is null'), 'esentis');
    },
  );
  test(
    'Provide default value if the string is null',
    () {
      String? string1;
      expect(string1.defaultValue('no null please'), 'no null please');

      String? string2 = 'esentis';
      expect(string2.defaultValue('no null please'), 'esentis');

      expect(null.defaultValue('no null please'), 'no null please');
      expect(''.defaultValue('no null please'), '');
      expect(' '.defaultValue('no null please'), ' ');
    },
  );
  test(
    'Checks if a string is null',
    () {
      String? string1;
      expect(string1.isNull, true);

      String? string2 = 'esentis';
      expect(string2.defaultValue('no null please'), 'esentis');

      expect(''.isNull, false);
      expect(' '.isNull, false);
    },
  );
  test(
    'Checks if a string is NOT null',
    () {
      String? string1;
      expect(string1.isNotNull, false);

      String? string2 = 'esentis';
      expect(string2.isNotNull, true);

      expect(''.isNotNull, true);
      expect(' '.isNotNull, true);
    },
  );
  test(
    'Repeats the string X times',
    () {
      String? string1 = 'foo';
      expect(string1.repeat(0), 'foo');

      String? string2 = 'foo';
      expect(string2.repeat(3), 'foofoofoo');

      expect('esen'.repeat(2), 'esenesen');
      expect('esen'.repeat(-1), 'esen');
      expect(' '.repeat(2), ' ');
      expect(''.repeat(2), '');
      expect(null.repeat(2), null);
    },
  );
  test(
    'Returns first N characters of the string',
    () {
      String? string = '192.168.1.14';
      expect(string.first(), '1');
      expect(string.first(n: 0), '');
      expect(string.first(n: 1), '1');
      expect(string.first(n: 5), '192.1');
      expect(string.first(n: 15), '192.168.1.14');
      expect(string.first(n: -15), '192.168.1.14');

      expect(null.first(), null);
      expect(''.first(), '');
      expect(' '.first(), ' ');
    },
  );
  test(
    'Returns last character of the string',
    () {
      String? string = '192.168.1.14';
      expect(string.last(), '4');
      expect(string.last(n: 0), '');
      expect(string.last(n: 1), '4');
      expect(string.last(n: 5), '.1.14');
      expect(string.last(n: 15), '192.168.1.14');
      expect(string.last(n: -15), '192.168.1.14');

      expect(null.last(), null);
      expect(''.last(), '');
      expect(' '.last(), ' ');
    },
  );
  test(
    'String should be slug cased',
    () {
      String? string = 'hello world this is esentis';
      expect(string.toSlug, 'hello_world_this_is_esentis');

      expect('heLLo BrothEr'.toSlug, 'heLLo_BrothEr');

      expect(null.toSlug, null);
      expect(''.toSlug, '');
      expect(' '.toSlug, ' ');
    },
  );
  test(
    'String should be snake cased',
    () {
      String? string = 'hello world this is esentis';
      expect(string.toSnakeCase, 'hello_world_this_is_esentis');

      expect('heLLo BrothEr'.toSnakeCase, 'hello_brother');

      expect(null.toSnakeCase, null);
      expect(''.toSnakeCase, '');
      expect(' '.toSnakeCase, ' ');
    },
  );
  test(
    'Converts the string to num',
    () {
      String? string = '5';
      expect(string.toNum(), 5);

      String? string2 = '5.0';
      expect(string2.toNum(), 5.0);

      String? string3 = '5.0f';
      expect(string3.toNum(), null);

      String? string5 = 'esentis';
      expect(string5.toNum(), null);

      expect(null.toNum(), null);
      expect(''.toNum(), null);
      expect(' '.toNum(), null);
    },
  );
  test(
    'Converts the string to int',
    () {
      String? string = '5';
      expect(string.toInt(), 5);

      String? string2 = '5.4';
      expect(string2.toInt(), 5);

      String? string3 = '5.0f';
      expect(string3.toInt(), null);

      String? string5 = 'esentis';
      expect(string5.toInt(), null);

      String? string6 = '5.6';
      expect(string6.toInt(), 5);

      expect(null.toInt(), null);
      expect(''.toInt(), null);
      expect(' '.toInt(), null);
    },
  );
  test(
    'Converts the string to double',
    () {
      String? string = '5';
      expect(string.toDouble(), 5.0);

      String? string2 = '5.0';
      expect(string2.toDouble(), 5.0);

      String? string3 = '5.0f';
      expect(string3.toDouble(), null);

      String? string5 = 'esentis';
      expect(string5.toDouble(), null);

      expect(null.toDouble(), null);
      expect(''.toDouble(), null);
      expect(' '.toDouble(), null);
    },
  );
  test(
    'Normalizes greek word, replacing all Greek characters to their latin equivelent',
    () {
      String? string = 'Αριστοτέλης';
      expect(string.replaceGreek, 'aristotelis');
      expect(null.replaceGreek, null);
      expect(''.replaceGreek, '');
      expect(' '.replaceGreek, ' ');
      expect('λοπάς'.replaceGreek, 'lopas');
      expect('υπότριμμα'.replaceGreek, 'ypotrimma');
      expect('σίλφιον'.replaceGreek, 'silfion');
      expect('κατακεχυμένος'.replaceGreek, 'katakexymenos');
      expect('κίγκλος'.replaceGreek, 'kigklos');
      expect('λαγώος'.replaceGreek, 'lagoos');
      expect('πτέρυξ'.replaceGreek, 'pteryks');
      expect('τραγανός'.replaceGreek, 'traganos');
      expect('πέλεια'.replaceGreek, 'peleia');
      expect('κεφάλιον'.replaceGreek, 'kefalion');
      expect('αλεκτρυών'.replaceGreek, 'alektryon');
      expect('ηλεκτροεγκεφαλογράφημα'.replaceGreek, 'ilektroegkefalografima');
      expect('αβυσσαλέος'.replaceGreek, 'avyssaleos');
      expect('άτεγκτος'.replaceGreek, 'ategktos');
      expect('απερίγραπτος'.replaceGreek, 'aperigraptos');
      expect('αχλός'.replaceGreek, 'axlos');
      expect('αμετροέπεια'.replaceGreek, 'ametroepeia');
      expect('αλώβητος'.replaceGreek, 'alovitos');
    },
  );
  test(
    'Finds given pattern occurences',
    () {
      String? string = 'abracadabra';
      String? pattern = 'abr';
      expect(string.findPattern(pattern: pattern), [0, 7]);

      expect(null.findPattern(pattern: pattern), []);
      expect(''.findPattern(pattern: pattern), []);
      expect(' '.findPattern(pattern: pattern), []);
    },
  );
  test(
    'Transforms string to string array',
    () {
      String? string = 'abracadabra';
      expect(string.toArray,
          ['a', 'b', 'r', 'a', 'c', 'a', 'd', 'a', 'b', 'r', 'a']);

      expect(null.toArray, []);
      expect(''.toArray, []);
      expect(' '.toArray, []);
    },
  );
  test(
    "Counts a specific character's occurences in a string",
    () {
      String? string = 'abracadabra';
      expect(string.charCount('a'), 5);

      expect(null.charCount('a'), 0);
      expect(''.charCount('a'), 0);
      expect(' '.charCount('a'), 0);
    },
  );
  test(
    'Strips all html code',
    () {
      String? string =
          '<script>Hacky hacky.</script> <p>Here is some text. <span class="bold">This is bold.</span></p>';
      expect(string.stripHtml, 'Hacky hacky. Here is some text. This is bold.');

      expect(null.stripHtml, null);
      expect(''.stripHtml, '');
      expect(' '.stripHtml, ' ');
    },
  );
  test(
    'Checks if string is strong password',
    () {
      String? string1 = 'qwerty';
      expect(string1.isStrongPassword, false);

      String? string2 = 'Is1!thisStrong';
      expect(string2.isStrongPassword, true);

      expect(null.isStrongPassword, false);
      expect(''.isStrongPassword, false);
      expect(' '.isStrongPassword, false);
    },
  );
  test(
    'Checks if string is a valid Guid',
    () {
      String? string1 = '6d64-4396-8547-1ec1b86e081e';
      expect(string1.isGuid, false);

      String? string2 = '887b7923-6d64-4396-8547-1ec1b86e081e';
      expect(string2.isGuid, true);

      expect(null.isGuid, false);
      expect(''.isGuid, false);
      expect(' '.isGuid, false);
    },
  );
  test(
    'Squeezes a string to a specific character',
    () {
      String? string1 = 'employee';
      expect(string1.squeeze('e'), 'employe');

      String? string2 = '8recommmmmmendation';
      expect(string2.squeeze('m'), '8recomendation');

      String? string3 = '8recommmmmmendation';
      expect(string3.squeeze('8'), '8recommmmmmendation');

      String? string4 =
          '8recommmmmmendation                                     ';
      expect(string4.squeeze(' '), '8recommmmmmendation ');

      expect(null.squeeze('8'), null);
      expect(''.squeeze('8'), '');
      expect(' '.squeeze('8'), ' ');
    },
  );

  test(
    'Checks if string consisted of same characters',
    () {
      String? string1 = 'employee';
      expect(string1.hasSameCharacters, false);

      String? string2 = '1111111';
      expect(string2.hasSameCharacters, true);

      String? string3 = '8recommmmmmendation';
      expect(string3.hasSameCharacters, false);

      String? string4 = 'kkkKKKKkkkKKkKkkkkKKK';
      expect(string4.hasSameCharacters, true);

      expect(null.hasSameCharacters, false);
      expect(''.hasSameCharacters, false);
      expect(' '.hasSameCharacters, false);
    },
  );
  test(
    'Gets the Levenshtein distance of two strings',
    () {
      String? string1 = 'employee';
      expect(string1.getLevenshtein('employee'), 0);

      String? string2 = '1111111';
      expect(string2.getLevenshtein('11111112'), 1);

      String? string3 = '8recommmmmmendation';
      expect(string3.getLevenshtein('8recoammgnmendation'), 3);

      String? string4 = 'dffasdasd';
      expect(string4.getLevenshtein('employee'), 9);

      expect(null.getLevenshtein('employee'), null);
      expect(''.getLevenshtein('employee'), null);
      expect(' '.getLevenshtein('employee'), null);
    },
  );
  test(
    'Checks if a string is valid URL',
    () {
      String? string1 = 'employee';
      expect(string1.isUrl, false);

      String? string2 = '1111111.com';
      expect(string2.isUrl, true);

      String? string3 = 'http://8recommmmmmendation';
      expect(string3.isUrl, false);

      String? string4 = 'www.google.com';
      expect(string4.isUrl, true);

      String? string5 = 'ftp://www.google.com';
      expect(string5.isUrl, true);

      expect(null.isUrl, false);
      expect(''.isUrl, false);
      expect(' '.isUrl, false);
    },
  );

  test(
    'Checks if a string is valid Date format',
    () {
      String? string1 = 'employee';
      expect(string1.isDate, false);

      String? string2 = '02-02-2020';
      expect(string2.isDate, true);

      String? string3 = '2020-04-06';
      expect(string3.isDate, true);

      String? string4 = '02-13-2020';
      expect(string4.isDate, false);

      String? string5 = '20120227T132700';
      expect(string5.isDate, true);

      expect(null.isDate, false);
      expect(''.isDate, false);
      expect(' '.isDate, false);
    },
  );
  test(
    'Formats the text with a given mask.',
    () {
      String? string1 = 'aaaaaaaabbbbccccddddeeeeeeeeeeee';
      String? mask1 = 'Hello ########-#A###-####-####-############ Oww';
      expect(string1.formatWithMask(mask1),
          'Hello aaaaaaaa-bAbbb-cccc-dddd-eeeeeeeeeeee Oww');

      String? string2 = 'esenti';
      String? mask2 = 'Hello #######';
      expect(string2.formatWithMask(mask2), 'Hello esenti');

      String? string3 = 'esentisgreece';
      String? mask3 = 'Hello ####### you are from ######';
      expect(
          string3.formatWithMask(mask3), 'Hello esentis you are from greece');

      String? string4 = '1234567812345678';
      String? mask4 = '**** **** **** ****';
      expect(string4.formatWithMask(mask4, specialChar: '*'),
          '1234 5678 1234 5678');

      expect(null.formatWithMask(mask4, specialChar: '*'), null);
      expect(''.formatWithMask(mask4, specialChar: '*'), '');
      expect(' '.formatWithMask(mask4, specialChar: '*'), ' ');
    },
  );
  test(
    'String operator tests',
    () {
      String? string1 = 'three';
      String? string2 = 'two';
      String? string3 = 'esentis is the best';

      expect(string1 > string2, true);
      expect(string1 < string2, false);
      expect(string1 >= string2, true);
      expect(string1 <= string2, false);
      expect(string3 - 'esentis', ' is the best');
      expect('esentis' - 'esen', 'tis');
      expect('esen' - 'esentis', 'esen');

      expect(
          ' ' -
              '5'
                  '5',
          '');
      expect(
          null -
              '5'
                  '5',
          '');
      expect(
          '  ' -
              '5'
                  '5',
          '');

      expect(
        '5' - null,
        '5',
      );
      expect(
        '5' - '',
        '5',
      );
      expect(
        '5' - ' ',
        '5',
      );
    },
  );
  test(
    'Removes the first n characters of the string',
    () {
      String? string1 = 'three';
      expect(string1.removeFirst(3), 'ee');
      expect(string1.removeFirst(0), 'three');
      expect(string1.removeFirst(-5), 'three');
      expect(string1.removeFirst(6), '');

      expect(null.removeFirst(6), null);
      expect(''.removeFirst(6), '');
      expect(' '.removeFirst(6), ' ');
    },
  );
  test(
    'Removes the last n characters of the string',
    () {
      String? string1 = 'three';
      expect(string1.removeLast(3), 'th');
      expect(string1.removeLast(0), 'three');
      expect(string1.removeLast(-5), 'three');
      expect(string1.removeLast(6), '');

      expect(null.removeLast(6), null);
      expect(''.removeLast(6), '');
      expect(' '.removeLast(6), ' ');
    },
  );
  test(
    'Keeps max X characters',
    () {
      String? string1 = 'three';
      expect(string1.maxChars(3), 'thr');
      expect(string1.maxChars(0), '');
      expect(string1.maxChars(-5), '');
      expect(string1.maxChars(6), 'three');

      expect(null.maxChars(6), null);
      expect(''.maxChars(6), '');
      expect(' '.maxChars(6), ' ');
    },
  );
  test(
    'Reverses slash by providing direction',
    () {
      String? string1 = 'C:/Documents/user/test';
      String? string2 = 'C:\\Documents\\user\\test';
      expect(string1.reverseSlash(0), 'C:\\Documents\\user\\test');
      expect(string1.reverseSlash(1), 'C:/Documents/user/test');
      expect(string1.reverseSlash(-5), 'C:/Documents/user/test');
      expect(string1.reverseSlash(6), 'C:/Documents/user/test');

      expect(string2.reverseSlash(0), 'C:\\Documents\\user\\test');
      expect(string2.reverseSlash(1), 'C:/Documents/user/test');
      expect(string2.reverseSlash(-5), 'C:\\Documents\\user\\test');
      expect(string2.reverseSlash(6), 'C:\\Documents\\user\\test');

      expect(null.reverseSlash(0), null);
      expect(''.reverseSlash(0), '');
      expect(' '.reverseSlash(0), ' ');
    },
  );
  test(
    'Returns the character at index',
    () {
      String? string1 = 'esentis';
      expect(string1.charAt(0), 'e');
      expect(string1.charAt(1), 's');
      expect(string1.charAt(-5), null);
      expect(string1.charAt(6), 's');
      expect(string1.charAt(12), null);

      expect(null.charAt(12), null);
      expect(''.charAt(12), '');
      expect(' '.charAt(12), ' ');
    },
  );
  test(
    'Appends a specific text to string',
    () {
      String? string1 = 'esentis';
      expect(string1.append(' is trying to be a developer'),
          'esentis is trying to be a developer');

      expect(null.append(' is trying to be a developer'),
          ' is trying to be a developer');
      expect(''.append(' is trying to be a developer'),
          ' is trying to be a developer');
      expect(' '.append(' is trying to be a developer'),
          ' is trying to be a developer');
    },
  );
  test(
    'Prepends a specific text to string',
    () {
      String? string1 = ' is trying to be a developer';
      expect(string1.prepend('esentis'), 'esentis is trying to be a developer');

      expect(null.prepend('esentis'), 'esentis');
      expect(''.prepend('esentis'), 'esentis');
      expect(' '.prepend('esentis'), 'esentis');
    },
  );
  test(
    'Formats the string to price amount',
    () {
      String? s1 = '123';
      expect(s1.toPriceAmount(currencySymbol: '€'), '123,00 €');
      String? s2 = '123333333';
      expect(s2.toPriceAmount(), '123.333.333,00');
      String? s3 = '';
      expect(s3.toPriceAmount(currencySymbol: '€'), '');
      String? s4;
      expect(s4.toPriceAmount(currencySymbol: '€'), null);
      String? s5 = '044ff1231234566123';
      expect(s5.toPriceAmount(currencySymbol: '€'), null);
      String? s6 = '45.225422';
      expect(s6.toPriceAmount(currencySymbol: '€'), '45,23 €');
      String? s7 = '45,225422';
      expect(s7.toPriceAmount(), '45,23');
      String? s8 = '45,2254,22';
      expect(s8.toPriceAmount(currencySymbol: '€'), null);
      String? s9 = '-1245';
      expect(s9.toPriceAmount(currencySymbol: '€'), '-1.245,00 €');
      String? s10 = '-01245';
      expect(s10.toPriceAmount(currencySymbol: '€'), '-1.245,00 €');

      expect(null.toPriceAmount(currencySymbol: '€'), null);
      expect(''.toPriceAmount(currencySymbol: '€'), '');
      expect(' '.toPriceAmount(currencySymbol: '€'), ' ');
    },
  );
  test(
    'Gets the day name of the date',
    () {
      String date1 = DateTime(1988, 8, 27).toString();
      expect(date1.getDayFromDate(), 'Saturday');
      expect(date1.getDayFromDate(locale: 'el'), 'Σάββατο');
      expect(date1.getDayFromDate(locale: 'es'), 'sábado');
      expect(date1.getDayFromDate(locale: 'az'), 'şənbə');
      expect(date1.getDayFromDate(locale: 'ka'), 'შაბათი');
    },
  );
  test(
    'Gets the month name of the date',
    () {
      String date1 = DateTime(1988, 8, 27).toString();
      expect(date1.getMonthFromDate(), 'August');
      expect(date1.getMonthFromDate(locale: 'el'), 'Αυγούστου');
      expect(date1.getMonthFromDate(locale: 'es'), 'agosto');
      expect(date1.getMonthFromDate(locale: 'az'), 'avqust');
      expect(date1.getMonthFromDate(locale: 'ka'), 'აგვისტო');
    },
  );
  test(
    'Gets the first day of the date',
    () {
      String date1 = DateTime(2021, 11, 27).toString();
      expect(date1.firstDayOfMonth(), 'Monday');
      expect(date1.firstDayOfMonth(locale: 'el'), 'Δευτέρα');
      expect(date1.firstDayOfMonth(locale: 'es'), 'lunes');
      expect(date1.firstDayOfMonth(locale: 'az'), 'bazar ertəsi');
      expect(date1.firstDayOfMonth(locale: 'ka'), 'ორშაბათი');
    },
  );
  test(
    'Gets the last day of the date',
    () {
      String date1 = DateTime(2021, 11, 27).toString();
      expect(date1.lastDayOfMonth(), 'Tuesday');
      expect(date1.lastDayOfMonth(locale: 'el'), 'Τρίτη');
      expect(date1.lastDayOfMonth(locale: 'es'), 'martes');
      expect(date1.lastDayOfMonth(locale: 'az'), 'çərşənbə axşamı');
      expect(date1.lastDayOfMonth(locale: 'ka'), 'სამშაბათი');
    },
  );
  test(
    'Transforms the Greek μ.μ. time literal to the equivalent English PM',
    () {
      String greekAfterNoonTimeLiteral = "09:30:00 μ.μ.";
      expect(
          greekAfterNoonTimeLiteral.greekTimeLiteralToEnglish, "09:30:00 PM");
    },
  );
  test(
    'Transforms the Greek π.μ. time literal to the equivalent English AM',
    () {
      String greekBeforeNoonTimeLiteral = "09:30:00 π.μ.";
      expect(
          greekBeforeNoonTimeLiteral.greekTimeLiteralToEnglish, "09:30:00 AM");
    },
  );
  test(
    'Will return the same string if there is not any Greek time literal',
    () {
      String greekAfterNoonTimeLiteral = "09:30:00 mm";
      expect(
          greekAfterNoonTimeLiteral.greekTimeLiteralToEnglish, "09:30:00 mm");
    },
  );
  test(
    'Get the left side of the string from a specific character',
    () {
      String t1 = 'peanut-10-butter';
      String t2 = 'peanutbutter';
      expect(t1.leftOf('-10-'), 'peanut');
      expect(t2.leftOf('peanut'), '');
    },
  );
  test(
    'Get the right side of the string from a specific character',
    () {
      String t1 = 'peanut-10-butter';
      String t2 = 'peanut is the best of the best';
      expect(t1.rightOf('-10-'), 'butter');
      expect(t1.rightOf('-'), '10-butter');
      expect(t1.rightOf(' -'), null);
      expect(t2.rightOf('the'), ' best of the best');
    },
  );
  test(
    'Truncates the string ton n characters adding "..." ',
    () {
      String t1 = 'peanutbutter';
      expect(t1.truncate(3), 'pea...');
      expect(t1.truncate(0), 'peanutbutter');
      expect(t1.truncate(10), 'peanutbutt...');
      expect(t1.truncate(13), 'peanutbutter');
      expect(t1.truncate(12), 'peanutbutter');
      expect(t1.truncate(-13), 'peanutbutter');
      expect('George'.truncate(8), 'George');
      expect(''.truncate(8), '');
      expect(' '.truncate(8), ' ');
    },
  );
  test(
    'Truncates the string in the middle with "..." keeping start and ending the same',
    () {
      String t1 = 'peanutbutter';
      expect(t1.truncateMiddle(3), 'pe...r');
      expect(t1.truncateMiddle(0), 'peanutbutter');
      expect(t1.truncateMiddle(4), 'pe...er');
      expect(t1.truncateMiddle(2), 'p...r');
      expect(t1.truncateMiddle(1), 'p...');
      expect(t1.truncateMiddle(13), 'peanutbutter');
      expect(t1.truncateMiddle(-13), 'peanutbutter');
    },
  );
  test(
    'Quotes a string with " "',
    () {
      String t1 = 'Is this reality';
      String t2 = '""Is this reality';
      expect(t1.quote, '"Is this reality"');
      expect(t2.quote, '"Is this reality"');
      // expect(t3.quote, '"Is this reality"');
    },
  );
  test(
    'Trims leading and trailing spaces, so as extra spaces in between words.',
    () {
      String t1 = '      Is        this        reality     ';
      expect(t1.trimAll, 'Is this reality');
    },
  );

  test(
    'Converts the string to a boolean value if possible',
    () {
      String t1 = 'true';
      String t2 = 'false';
      String t3 = 'yes';
      String t4 = 'no';
      expect(t1.toBool, true);
      expect(t2.toBool, false);
      expect(t3.toBool, true);
      expect(t4.toBool, false);
    },
  );

  test('Returns the string after a specific character / word', () {
    String t1 = 'Hello brother what a wonderful day';

    expect(t1.after('brother'), ' what a wonderful day');
    expect(t1.after('what'), ' a wonderful day');
    expect(t1.after('  '), '');
    expect(t1.after(''), '');
    expect(t1.after(' b'), 'rother what a wonderful day');
    expect(t1.after('wonderful'), ' day');
    expect(t1.after('12345'), '');
  });

  test('Returns the string before a specific character / word', () {
    String t1 = 'Hello brother what a wonderful day';

    expect(t1.before('brother'), 'Hello ');
    expect(t1.before('what'), 'Hello brother ');
    expect(t1.before('  '), '');
    expect(t1.before(''), '');
    expect(t1.before('b'), 'Hello ');
    expect(t1.before('wonderful'), 'Hello brother what a ');
    expect(t1.before('12345'), '');
  });

  test('Returns the Jaro distance', () {
    String t1 = 'esentis';
    String t2 = 'esen';

    expect(t1.getJaro(t2), 0.8571428571428571);
  });

  test('isBlank - check if string is null, empty or contains only whitespaces ',
      () {
    String? string1 = "   ";
    String? string2;
    String? string3 = "not blank";
    String? string4 = "";
    String? string5 = "\r\n";
    expect(string1.isBlank, true);
    expect(string2.isBlank, true);
    expect(string3.isBlank, false);
    expect(string4.isBlank, true);
    expect(string5.isBlank, true);
  });

  test(
      'isNotBlank - check if string is not null, empty or contains only whitespaces ',
      () {
    String? string1 = "   ";
    String? string2;
    String? string3 = "not blank";
    String? string4 = "";
    String? string5 = "\r\n";
    expect(string1.isNotBlank, false);
    expect(string2.isNotBlank, false);
    expect(string3.isNotBlank, true);
    expect(string4.isNotBlank, false);
    expect(string5.isNotBlank, false);
  });

  test(
      'asIf - compares a string using a function and returns first string if true, otherwise return second string',
      () {
    expect('OK'.asIf((s) => s == "OK", "is OK", "is not OK"), equals("is OK"));
    expect('ERROR'.asIf((s) => s == "OK", "is OK", "is not OK"),
        equals("is not OK"));
  });

  test('ifBlank - check if string is blank give it a default value.', () {
    String? s1 = "hello".ifBlank("new string");
    String? s2 = "".ifBlank("new string");
    expect(s1, equals("hello"));
    expect(s2, equals("new string"));
  });

  test('getOppositeChar - return the opposite char', () {
    expect("(".getOppositeChar(), ")");
    expect("{".getOppositeChar(), "}");
    expect("[".getOppositeChar(), "]");
    expect("AA".getOppositeChar(), "AA");
    expect("".getOppositeChar(), "");
    String? s;
    expect(s.getOppositeChar(), null);
  });

  test('isOpenWrapChar - check is string is open wrap char', () {
    expect("(".isOpenWrapChar(), true);
    expect("{".isOpenWrapChar(), true);
    expect("[".isOpenWrapChar(), true);
    expect('"'.isOpenWrapChar(), true);
    expect("'".isOpenWrapChar(), true);
    expect("`".isOpenWrapChar(), true);
    expect("other".isOpenWrapChar(), false);
  });

  test('isCloseWrapChar - check is string is close wrap char', () {
    expect(")".isCloseWrapChar(), true);
    expect("}".isCloseWrapChar(), true);
    expect("]".isCloseWrapChar(), true);
    expect('"'.isCloseWrapChar(), true);
    expect("'".isCloseWrapChar(), true);
    expect("`".isCloseWrapChar(), true);
    expect("other".isOpenWrapChar(), false);
  });
  test(
      'wrap - wrap a string between two strings. If [before] is a wrap char and [after] is ommited, the method resolve after using [getOppositeChar]',
      () {
    expect("string".wrap("{"), "{string}");
    expect("string".wrap("("), "(string)");
    expect("string".wrap(null), "string");
    expect("string".wrap(""), "string");
    expect("string".wrap("AA", after: "BB"), "AAstringBB");
  });

  test(
      'removeLastEqual - Remove a string from the end of other string if equal [pattern]',
      () {
    expect("coolboy".removeLastEqual("y"), "coolbo");
  });
  test(
      'removeFirstEqual - Remove a string from the beginning of other string if equal [pattern]',
      () {
    expect("djing".removeFirstEqual("dj"), "ing");
  });

  test(
      'removeLastAny - Continuously removes from the end of the String any [patterns]',
      () {
    expect(
        "esentisfs12".removeLastAny([
          "12",
          "s",
          "ng",
          "f",
        ]),
        "esentis");
  });

  test(
      'removeFirstAny - Continuously removes from the beginning of a `string` any string contained in [patterns]',
      () {
    expect("esentis".removeFirstAny(["s", "ng"]), "esentis");
  });
  test(
      'removeFirstAndLastEqual - Continuously removes from the beginning and end of a `string` if equal [pattern]',
      () {
    expect("abracadabra".removeFirstAndLastEqual("a"), "bracadabr");
    expect("esentis".removeFirstAndLastEqual("s"), "esenti");
  });

  test('containsAny - Check if the String contains all Strings of a [list]',
      () {
    expect("abracadabra".containsAny(["a", "p"]), true);
    expect("string".containsAny(["str", "int"]), true);
    expect("string".containsAny(["abra", "cadabra"]), false);
  });

  test('containsAll - Check if the String contains all String of a [list]', () {
    expect("abracadabra".containsAll(["abra", "cadabra"]), true);
    expect("abracadabra".containsAll(["a", "c"]), true);
    expect("abracadabra".containsAll(["abra", "kazan"]), false);
  });

  test(
      'removeAfter - Removes everything after first occurence of a specific pattern',
      () {
    expect("0:00:00.11".removeAfter('.'), '0:00:00');
    expect("0.:00:00.11".removeAfter('.'), '0');
  });

  test(
      'removeBefore - Removes everything before first occurence of a specific pattern',
      () {
    expect("0:00:00.11".removeBefore('.'), '11');
    expect("0.:00:00.11".removeBefore('.'), ':00:00.11');
  });
  test('addAfter - Adds a String after first occurence of a specific pattern',
      () {
    expect("0:00:00.11".addAfter('.', '5'), '0:00:00.511');
    expect("hello".addAfter('o', ' there'), 'hello there');
    expect('esentis'.addAfter('x', 'pro'), 'esentis');
  }); // expect('hello brother what a day today', matcher)

  test('addBefore - Adds a String before first occurence of a specific pattern',
      () {
    expect('hello brother what a day today'.addBefore('brother', 'big '),
        'hello big brother what a day today');
    expect('world'.addBefore('w', 'hello '), 'hello world');
  });
  test('md5 - returns a MD5 hash of current string', () {
    expect('123456'.md5, "e10adc3949ba59abbe56e057f20f883e");
  });

  test('Formats file size to "bytes", "KB", "MB", "GB"', () {
    expect('1024'.formatFileSize, "1 KB");
    expect('1025'.formatFileSize, "1 KB");
    expect('1048576'.formatFileSize, "1 MB");
    expect('3145728'.formatFileSize, "3 MB");
    expect('24117248'.formatFileSize, "23 MB");
  });

  test('Replaces the character at index of the String', () {
    expect('esentis'.replaceAtIndex(index: 0, replacement: '1'), '1sentis');
    expect('es'.replaceAtIndex(index: 3, replacement: '1'), 'es');
    expect('es'.replaceAtIndex(index: 1, replacement: ''), 'e');
  });

  test('Checks if given String is a valid credit card number', () {
    expect('5104 4912 8031 9406'.isCreditCard, true);
    expect('5104 4912 5001 0654'.isCreditCard, true);
    expect('4101898959978716'.isCreditCard, true);
  });

  test('Remove all whitespace from the String', () {
    expect('     H    e ll o    Wo    rl d'.removeWhiteSpace, 'HelloWorld');
    expect(' . . . . . . . .'.removeWhiteSpace, '........');
  });

  test('Properly uppercases greek letters', () {
    expect('Έλα ρε φίλε τι γίνεται πώς είσαι'.toGreekUpperCase(),
        'ΕΛΑ ΡΕ ΦΙΛΕ ΤΙ ΓΙΝΕΤΑΙ ΠΩΣ ΕΙΣΑΙ');
    expect('Έλα ρε φίλε Τι ΓίΝΕΤαι πώς είσαι'.toGreekUpperCase(),
        'ΕΛΑ ΡΕ ΦΙΛΕ ΤΙ ΓΙΝΕΤΑΙ ΠΩΣ ΕΙΣΑΙ');
    expect('hey brother τι κάνεις πως είσαι αγαπητέ'.toGreekUpperCase(),
        'HEY BROTHER ΤΙ ΚΑΝΕΙΣ ΠΩΣ ΕΙΣΑΙ ΑΓΑΠΗΤΕ');
    expect('Τι κάνεις πώς τα περνάς φίλτατέ μου'.toGreekUpperCase(),
        'ΤΙ ΚΑΝΕΙΣ ΠΩΣ ΤΑ ΠΕΡΝΑΣ ΦΙΛΤΑΤΕ ΜΟΥ');

    expect('ορισμός'.toGreekUpperCase(), 'ΟΡΙΣΜΟΣ');
  });

  test('Checks if the String is a valid IBAN', () {
    expect('GR7601087934297122812795672'.isIban, true);
    expect('GR6001011981275693319989994'.isIban, true);
    expect('KW92RPNS2681922467176944898824'.isIban, true);
    expect('MA10745769541838288465855969'.isIban, true);
    expect('SE1971441872123675319313'.isIban, true);
    expect('GB15BARC20039571136321'.isIban, true);
    expect('SK7431252943564435863722'.isIban, true);
    expect('AL17134113213912334137941422'.isIban, true);
    expect('DZ580002100001113000000570'.isIban, true);
  });

  test('Checks if the String is a valid Greek Identity number', () {
    expect('ΑΒ166373'.isGreekId, true);
  });

  test('Checks if the String is in uppercase', () {
    expect('ΑΒ166373'.isUpperCase, true);
    expect('abcDeFgg'.isUpperCase, false);
    expect('AVV FFF AA 551 ! 22 a A'.isUpperCase, false);
    expect('aaa Aaaa'.isUpperCase, false);
  });
  test('Checks if the String is in lowercase', () {
    expect('ΑΒ166373'.isLowerCase, false);
    expect('abcDeFgg'.isLowerCase, false);
    expect('abcded f ga a'.isLowerCase, true);
    expect('aaa Aaaa'.isLowerCase, false);
  });

  test('Swaps the case of the String', () {
    expect('abCDefGH'.swapCase(), 'ABcdEFgh');
    expect('abCDefGH123'.swapCase(), 'ABcdEFgh123');
    expect('ab CD ef GH'.swapCase(), 'AB cd EF gh');
    expect('! ab CD ef GH1 F'.swapCase(), '! AB cd EF gh1 f');
  });
  test('Checkes whether the String is a Swift code', () {
    expect('CRBAGRAAI01'.isSwiftCode, true);
    expect('CSRBAGRAAI01'.isSwiftCode, false);
    expect('CRBAGRAA'.isSwiftCode, true);
    expect('AEBAGRAA'.isSwiftCode, true);
    expect('	PMFAUS66'.isSwiftCode, false);
    expect('PMFAUS66'.isSwiftCode, true);
  });
  test('Returns the digits count in the String', () {
    expect('CRBAGRAAI01'.digitCount, 2);
    expect('CRBAGRAAI'.digitCount, 0);
    expect(null.digitCount, 0);
    expect(''.digitCount, 0);
  });

  test('Checks if the String is consisted of valid ASCII characters', () {
    expect("hello world".isAscii, true);
    expect("Hello, 世界".isAscii, false);
    expect("".isAscii, true);
    expect("123".isAscii, true);
    expect("!@#\$%".isAscii, true);
    expect("œ∑´®†¥¨ˆøπ".isAscii, false);
    expect("Hello World 123".isAscii, true);
  });

  test("Checks if a String is an anagram of another one", () {
    expect("listen".isAnagramOf("silent"), true);
    expect("elbow".isAnagramOf("below"), true);
    expect("triangle".isAnagramOf("integral"), true);
    expect("funeral".isAnagramOf("real fun"), true);
    expect("deified".isAnagramOf("died if"), false);
    expect("roast".isAnagramOf("sorta"), true);
    expect("dormitory".isAnagramOf("dirty room"), true);
    expect("poultry outwits an ant".isAnagramOf("antitoxin word pluck"), false);
  });
  test("Checks if a String is palindrome", () {
    expect("racecar".isPalindrome, true);
    expect("level".isPalindrome, true);
    expect("deified".isPalindrome, true);
    expect("died if".isPalindrome, false);
    expect("sorta".isPalindrome, false);
    expect("dirty room".isPalindrome, false);
    expect("antitoxin word pluck".isPalindrome, false);
  });

  test("Checks if a String is mixed case", () {
    expect("Hello World!".isMixedCase(), equals(true));
    expect("HELLO WORLD!".isMixedCase(), equals(false));
    expect("hello world!".isMixedCase(), equals(false));
    expect("HELLOworld!".isMixedCase(), equals(true));
    expect("HelloWORLD!".isMixedCase(), equals(true));
  });

  test("Replaces the symbols of a string to their equivalent letters", () {
    expect(
        "Th!s !s just @ t#st".symbolsToLetters, equals("This is just a test"));
    expect(
        "Αυτό #ίναι #ν@ τ#στ".symbolsToLetters, equals("Αυτό είναι ενα τεστ"));
  });
}
