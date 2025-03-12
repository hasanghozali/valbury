import 'package:flutter_test/flutter_test.dart';
import 'package:app/view/atom/color_atom.dart';
import 'package:app/view/atom/text_style_atom.dart';

void main() {
  group('TextStyleAtom', () {
    // Regular

    test('regular12Primary should have primary color', () {
      expect(TextStyleAtom.regular12Primary.color, ColorAtom.primary);
    });

    test('regular12BodyText should have bodyText color', () {
      expect(TextStyleAtom.regular12BodyText.color, ColorAtom.bodyText);
    });

    test('regular14Primary should have primary color', () {
      expect(TextStyleAtom.regular14Primary.color, ColorAtom.primary);
    });

    test('regular14BodyText should have bodyText color', () {
      expect(TextStyleAtom.regular14BodyText.color, ColorAtom.bodyText);
    });

    test('regular16BodyText should have body text color', () {
      expect(TextStyleAtom.regular16BodyText.color, ColorAtom.bodyText);
    });

    test('regular16Red should have red color', () {
      expect(TextStyleAtom.regular16Red.color, ColorAtom.red);
    });

    test('regular18 should have Font size 18', () {
      expect(TextStyleAtom.regular18.fontSize, 18);
    });

    // Semi Bold
    test('semiBold12Red should have red color', () {
      expect(TextStyleAtom.semiBold12Red.color, ColorAtom.red);
    });

    test('semiBold14Primary should have primary color', () {
      expect(TextStyleAtom.semiBold14Primary.color, ColorAtom.primary);
    });

    test('semiBold14White should have white color', () {
      expect(TextStyleAtom.semiBold14White.color, ColorAtom.white);
    });

    test('semiBold16 should have font size 16', () {
      expect(TextStyleAtom.semiBold16.fontSize, 16);
    });

    // Bold
    test('bold12 should have font size 12', () {
      expect(TextStyleAtom.bold12.fontSize, 12);
    });

    test('bold14 should have font size 14', () {
      expect(TextStyleAtom.bold14.fontSize, 14);
    });

    test('bold16 should have font size 16', () {
      expect(TextStyleAtom.bold16.fontSize, 16);
    });

    test('bold18 should have font size 18', () {
      expect(TextStyleAtom.bold18.fontSize, 18);
    });

    test('bold20Primary should have primary color', () {
      expect(TextStyleAtom.bold20Primary.color, ColorAtom.primary);
    });

    test('bold24 should have font size 24', () {
      expect(TextStyleAtom.bold24.fontSize, 24);
    });

    test('bold28 should have font size 28', () {
      expect(TextStyleAtom.bold28.fontSize, 28);
    });
  });
}
