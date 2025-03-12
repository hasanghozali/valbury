import 'package:app/model/menu_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MenuModel', () {
    test('should be initialized with provided values', () {
      final menu = MenuModel(
        code: 'home',
        icon: Icons.home,
        iconActive: Icons.home_filled,
        iconAsset: 'assets/icons/home.png',
        iconAssetActive: 'assets/icons/home_active.png',
        label: 'Home',
        child: const Text('Home Screen'),
      );

      expect(menu.code, 'home');
      expect(menu.icon, Icons.home);
      expect(menu.iconActive, Icons.home_filled);
      expect(menu.iconAsset, 'assets/icons/home.png');
      expect(menu.iconAssetActive, 'assets/icons/home_active.png');
      expect(menu.label, 'Home');
      expect(menu.child, isA<Text>());
    });

    test('should have correct default values', () {
      final menu = MenuModel(label: 'Default Label');

      expect(menu.code, isNull);
      expect(menu.icon, isNull);
      expect(menu.iconActive, isNull);
      expect(menu.iconAsset, isNull);
      expect(menu.iconAssetActive, isNull);
      expect(menu.label, 'Default Label');
      expect(menu.child, isNull);
    });

    test('should allow updating properties after initialization', () {
      final menu = MenuModel(label: 'Initial');

      menu.code = 'settings';
      menu.icon = Icons.settings;
      menu.iconActive = Icons.settings_suggest;
      menu.iconAsset = 'assets/icons/settings.png';
      menu.iconAssetActive = 'assets/icons/settings_active.png';
      menu.label = 'Settings';
      menu.child = const Text('Settings Screen');

      expect(menu.code, 'settings');
      expect(menu.icon, Icons.settings);
      expect(menu.iconActive, Icons.settings_suggest);
      expect(menu.iconAsset, 'assets/icons/settings.png');
      expect(menu.iconAssetActive, 'assets/icons/settings_active.png');
      expect(menu.label, 'Settings');
      expect(menu.child, isA<Text>());
    });
  });
}
