// Import the test package and Counter class
import 'package:test/test.dart';
import 'package:string_extensions/string_extensions.dart';

void main() {
  test('String words are correctly counted', () {
    var string = 'Hello world';
    expect(string.countWords(), 2);
  });
  test('Returns the read time of the string', () {
    var string = 'Hello dear friend how you doing ?';
    expect(string.readTime(), 3);
  });
  test('String should be capitalized', () {
    var string = 'hAckErrR';
    expect(string.capitalize(), 'Hackerrr');
  });
  test('String should be title cased', () {
    var string = 'Hello dear friend how you doing ?';
    expect(string.toTitleCase(), 'Hello Dear Friend How You Doing ?');
  });
  test('Removes all numbers from the string', () {
    var string = '234112731235es4234123e5523nt1is';
    expect(string.removeNumbers(), 'esentis');
  });
  test('Removes everything but letters', () {
    var string = '4*%^55/es4e55?:"///23nt1is';
    expect(string.onlyLetters(), 'esentis');
  });
  test('Checks if a string is a valid mail', () {
    var string1 = 'esentis@esentis.com';
    expect(string1.isMail(), true);

    var string2 = 'esentisesentis.com';
    expect(string2.isMail(), false);
  });
  test('String should be camel cased', () {
    var string = 'Find max of array';
    expect(string.toCamelCase(), 'findMaxOfArray');
  });
  test('Removes everything but numbers', () {
    var string = '4*%^55/es4e5523nt1is';
    expect(string.onlyNumbers(), '455455231');
  });
  test('Removes all letters', () {
    var string = '1244e*s*4e*5523n*t*1i*s';
    expect(string.removeLetters(), '1244**4*5523**1*');
  });
  test('Correctly finds character occurances', () {
    var string = 'esssssentis';
    expect(string.charOccurences(), [
      {'e': 2},
      {'i': 1},
      {'n': 1},
      {'s': 6},
    ]);
  });
  test('Correctly finds most frequent character', () {
    var string = 'esssssentis';
    expect(string.mostFrequent(), 's');
  });
  test('Reverses a string', () {
    var string = 'Hello World';
    expect(string.reverse(), 'dlroW olleH');
  });
  test('Checks if a string is a valid Ipv4', () {
    var string1 = '192.168.1.14';
    expect(string1.isIpv4(), true);

    var string2 = '192.168.1.14.5223';
    expect(string2.isIpv4(), false);
  });
  test('Checks if a string is a valid Ipv6', () {
    var string1 = '2001:0db8:85a3:0000:0000:8a2e:0370:7334';
    expect(string1.isIpv6(), true);

    var string2 = '192.168.1.14';
    expect(string2.isIpv6(), false);
  });
  test('Checks if a string is a number', () {
    var string1 = '45';
    expect(string1.isNumber(), true);

    var string2 = '45s';
    expect(string2.isNumber(), false);
  });
  test('Do something if string is empty', () {
    var string1 = '45';
    expect(string1.ifEmpty(() => 'empty'), '45');

    var string2 = '';
    expect(string2.ifEmpty(() => 'empty'), 'empty');
  });
  test('Repeats the string X times', () {
    var string1 = 'foo';
    expect(string1.repeat(0), 'foo');

    var string2 = 'foo';
    expect(string2.repeat(3), 'foofoofoo');
  });
  test('Returns first character of the string', () {
    var string = '192.168.1.14';
    expect(string.first(), '1');
  });
  test('Returns last character of the string', () {
    var string = '192.168.1.14';
    expect(string.last(), '4');
  });
  test('String should be slug cased', () {
    var string = 'hello world this is esentis';
    expect(string.toSlug(), 'hello_world_this_is_esentis');
  });
  test('Normalizes greek word', () {
    var string = 'Αριστοτέλης';
    expect(string.replaceGreek(), 'aristotelis');
  });
  test('Correctly finds given pattern occurences', () {
    var string = 'abracadabra';
    var pattern = 'abr';
    expect(string.findPattern(pattern: pattern), [0, 7]);
  });
  test('Transforms string to string array', () {
    var string = 'abracadabra';
    expect(string.toStringArray(),
        ['a', 'b', 'r', 'a', 'c', 'a', 'd', 'a', 'b', 'r', 'a']);
  });
  test('Strips all html code', () {
    var string =
        '<script>Hacky hacky.</script> <p>Here is some text. <span class="bold">This is bold.</span></p>';
    expect(string.stripHtml(), 'Hacky hacky. Here is some text. This is bold.');
  });
  test('Checks if string is strong password', () {
    var string1 = 'qwerty';
    expect(string1.isStrongPassword(), false);

    var string2 = 'Is1!thisStrong';
    expect(string2.isStrongPassword(), true);
  });
  test('Checks if string is a valid Guid', () {
    var string1 = '6d64-4396-8547-1ec1b86e081e';
    expect(string1.isGuid(), false);

    var string2 = '887b7923-6d64-4396-8547-1ec1b86e081e';
    expect(string2.isGuid(), true);
  });
}
