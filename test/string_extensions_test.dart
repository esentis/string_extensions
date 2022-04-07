// Import the test package and Counter class
import 'package:string_extensions/string_extensions.dart';
import 'package:test/test.dart';

void main() {
  test(
    'Counts the words of the String',
    () {
      String? string = 'Hello world ! dear 4asd';
      expect(string.countWords, 4);
    },
  );
  test(
    'Returns the read time of the String',
    () {
      String? string = 'Hello dear friend how you doing ?';
      expect(string.readTime(), 3);
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
    },
  );
  test(
    "Capitalizes each word's first letter",
    () {
      String? string = 'Hello dear friend how you doing ?';
      expect(string.toTitleCase, 'Hello Dear Friend How You Doing ?');
    },
  );
  test(
    'Removes all numbers from the string',
    () {
      String? string = '234112731235es4234123e5523nt1is';
      expect(string.removeNumbers, 'esentis');
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
    },
  );
  test(
    'Removes everything but greek characters',
    () {
      String? string = '4*%^σοφ55ία/es4e55?:"///23nt1is';
      expect(string.onlyGreek, 'σοφία');

      String? string2 = '4*%^σοφ55ία/es4e55?:"///23nt1is αγάπη';
      expect(string2.onlyGreek, 'σοφία αγάπη');
    },
  );
  test(
    'Converts the string to camel case',
    () {
      String? string = 'Find max of array';
      expect(string.toCamelCase, 'findMaxOfArray');
    },
  );
  test(
    'Removes everything but numbers',
    () {
      String? string = '4*%^55/es4e5523nt1is';
      expect(string.onlyNumbers, '455455231');
    },
  );
  test(
    'Removes all letters',
    () {
      String? string = '1244e*s*4e*5523n*t*1i*s';
      expect(string.removeLetters, '1244**4*5523**1*');
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
    },
  );
  test(
    'Finds the most frequent character',
    () {
      String? string = 'esssssentis';
      expect(string.mostFrequent, 's');
    },
  );
  test(
    'Reverses a string',
    () {
      String? string = 'Hello World';
      expect(string.reverse, 'dlroW olleH');
    },
  );
  test(
    'Checks if a string is a valid mail',
    () {
      String? string1 = 'esentis@esentis.com';
      expect(string1.isMail, true);

      String? string2 = 'esentisesentis.com';
      expect(string2.isMail, false);
    },
  );
  test(
    'Checks if a string is a valid Ipv4',
    () {
      String? string1 = '192.168.1.14';
      expect(string1.isIpv4, true);

      String? string2 = '192.168.1.14.5223';
      expect(string2.isIpv4, false);
    },
  );
  test(
    'Checks if a string is a valid Ipv6',
    () {
      String? string1 = '2001:0db8:85a3:0000:0000:8a2e:0370:7334';
      expect(string1.isIpv6, true);

      String? string2 = '192.168.1.14';
      expect(string2.isIpv6, false);
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
    },
  );
  test(
    'Do something if string is empty',
    () {
      String? string1 = '45';
      expect(string1.ifEmpty(() => 'empty'), '45');

      String? string2 = '';
      expect(string2.ifEmpty(() => 'empty'), 'empty');
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
    },
  );
  test(
    'Checks if a string is null',
    () {
      String? string1;
      expect(string1.isNull, true);

      String? string2 = 'esentis';
      expect(string2.defaultValue('no null please'), 'esentis');
    },
  );
  test(
    'Repeats the string X times',
    () {
      String? string1 = 'foo';
      expect(string1.repeat(0), 'foo');

      String? string2 = 'foo';
      expect(string2.repeat(3), 'foofoofoo');
    },
  );
  test(
    'Returns first character of the string',
    () {
      String? string = '192.168.1.14';
      expect(string.first(), '1');
    },
  );
  test(
    'Returns last character of the string',
    () {
      String? string = '192.168.1.14';
      expect(string.last(), '4');
    },
  );
  test(
    'String should be slug cased',
    () {
      String? string = 'hello world this is esentis';
      expect(string.toSlug, 'hello_world_this_is_esentis');
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
    },
  );
  test(
    'Normalizes greek word',
    () {
      String? string = 'Αριστοτέλης';
      expect(string.replaceGreek, 'aristotelis');
    },
  );
  test(
    'Finds given pattern occurences',
    () {
      String? string = 'abracadabra';
      String? pattern = 'abr';
      expect(string.findPattern(pattern: pattern), [0, 7]);
    },
  );
  test(
    'Transforms string to string array',
    () {
      String? string = 'abracadabra';
      expect(string.toArray,
          ['a', 'b', 'r', 'a', 'c', 'a', 'd', 'a', 'b', 'r', 'a']);
    },
  );
  test(
    "Counts a specific character's occurences in a string",
    () {
      String? string = 'abracadabra';
      expect(string.charCount('a'), 5);
    },
  );
  test(
    'Strips all html code',
    () {
      String? string =
          '<script>Hacky hacky.</script> <p>Here is some text. <span class="bold">This is bold.</span></p>';
      expect(string.stripHtml, 'Hacky hacky. Here is some text. This is bold.');
    },
  );
  test(
    'Checks if string is strong password',
    () {
      String? string1 = 'qwerty';
      expect(string1.isStrongPassword, false);

      String? string2 = 'Is1!thisStrong';
      expect(string2.isStrongPassword, true);
    },
  );
  test(
    'Checks if string is a valid Guid',
    () {
      String? string1 = '6d64-4396-8547-1ec1b86e081e';
      expect(string1.isGuid, false);

      String? string2 = '887b7923-6d64-4396-8547-1ec1b86e081e';
      expect(string2.isGuid, true);
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
    },
  );
  test(
    'Removes the last n characters of the string',
    () {
      String? string1 = 'three';
      expect(string1.maxChars(3), 'thr');
      expect(string1.maxChars(0), '');
      expect(string1.maxChars(-5), '');
      expect(string1.maxChars(6), 'three');
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
    },
  );
  test(
    'Appends a specific text to string',
    () {
      String? string1 = 'esentis';
      expect(string1.append(' is trying to be a developer'),
          'esentis is trying to be a developer');
    },
  );
  test(
    'Prepends a specific text to string',
    () {
      String? string1 = ' is trying to be a developer';
      expect(string1.prepend('esentis'), 'esentis is trying to be a developer');
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
      expect(date1.getMonthFromDate(locale: 'az'), 'Avqust');
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
      expect(t1.truncate(-13), 'peanutbutter');
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
}
