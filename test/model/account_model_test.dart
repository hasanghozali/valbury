import 'package:app/model/account_model.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  group('AccountModel', () {
    test('should be initialized with provided values', () {
      final account = AccountModel(
        name: 'John Doe',
        email: 'johndoe@example.com',
        password: 'password123',
        avatar: 'avatar.png',
        isBiometric: true,
      );

      expect(account.name, 'John Doe');
      expect(account.email, 'johndoe@example.com');
      expect(account.password, 'password123');
      expect(account.avatar, 'avatar.png');
      expect(account.isBiometric, true);
    });

    test('should have correct default values', () {
      final account = AccountModel();

      expect(account.name, isNull);
      expect(account.email, isNull);
      expect(account.password, isNull);
      expect(account.avatar, isNull);
      expect(account.isBiometric, false); // Default should be false
    });

    test('should allow updating properties after initialization', () {
      final account = AccountModel();

      account.name = 'Jane Doe';
      account.email = 'janedoe@example.com';
      account.password = 'newpassword';
      account.avatar = 'new_avatar.png';
      account.isBiometric = true;

      expect(account.name, 'Jane Doe');
      expect(account.email, 'janedoe@example.com');
      expect(account.password, 'newpassword');
      expect(account.avatar, 'new_avatar.png');
      expect(account.isBiometric, true);
    });
  });
}
