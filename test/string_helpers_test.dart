import 'package:string_extensions/string_extensions.dart';
import 'package:string_extensions/string_helpers.dart';
import 'package:test/test.dart';

void main() {
  test('AlphaChars', () => expect(StringHelpers.alphaChars, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".toArray.toList()));
  test('AlphaUpperChars', () => expect(StringHelpers.alphaUpperChars, "ABCDEFGHIJKLMNOPQRSTUVWXYZ".toArray.toList()));
  test('AlphaLowerChars', () => expect(StringHelpers.alphaLowerChars, "abcdefghijklmnopqrstuvwxyz".toArray.toList()));
  test('LowerVowels', () => expect(StringHelpers.lowerVowels, "aeiouy".toArray.toList()));
  test('UpperVowels', () => expect(StringHelpers.upperVowels, "AEIOUY".toArray.toList()));
  test('Vowels', () => expect(StringHelpers.vowels, "AEIOUYaeiouy".toArray.toList()));
  test('UpperConsonants', () => expect(StringHelpers.upperConsonants, "BCDFGHJKLMNPQRSTVWXZ".toArray.toList()));
  test('LowerConsonants', () => expect(StringHelpers.lowerConsonants, "bcdfghjklmnpqrstvwxz".toArray.toList()));
  test('Consonants', () => expect(StringHelpers.consonants, "BCDFGHJKLMNPQRSTVWXZbcdfghjklmnpqrstvwxz".toArray.toList()));
  test('Numbers', () => expect(StringHelpers.numberChars, "0123456789".toArray.toList()));
}
