import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:app/controller/account_controller.dart';
import 'package:app/generated/l10n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Get.testMode = true;

  late AccountController accountController;

  setUp(() {
    accountController = AccountController();
  });

  group('AccountController Unit Test', () {
    test('Initial values should be correct', () {
      expect(accountController.account.value, isNull);
      expect(accountController.isNext.value, false);
      expect(accountController.isBiometric.value, false);
      expect(accountController.errorEmail.value, '');
      expect(accountController.errorPassword.value, '');
      expect(accountController.listAccount.length, 2);
    });

    test('Login with valid email and password should set account', () async {
      await accountController.loginEmail('johndoe@test.com', 'wednesday');
      expect(accountController.account.value?.email, 'johndoe@test.com');
      expect(accountController.isLogin, true);
    });

    test('Login with invalid email should set error message', () async {
      await accountController.loginEmail('wrong@test.com', 'wednesday');
      expect(accountController.errorEmail.value, S().email_error);
      expect(accountController.account.value, isNull);
    });

    test('Login with invalid password should set error message', () async {
      await accountController.loginEmail('johndoe@test.com', 'wrongpassword');
      expect(accountController.errorPassword.value, S().password_error);
      expect(accountController.account.value, isNull);
    });

    test('Logout should clear account', () async {
      await accountController.loginEmail('johndoe@test.com', 'wednesday');
      await accountController.logOut();
      expect(accountController.account.value, isNull);
    });

    // test('Biometric login should authenticate correctly', () async {
    //   accountController.listAccount[0].isBiometric = true;
    //   when(BiometricUtil.validate()).thenAnswer((_) async => true);

    //   await accountController.loginBiometric();
    //   expect(accountController.account.value?.email, 'johndoe@test.com');
    // });

    test('Validate method should update isNext correctly', () {
      accountController.validate('johndoe@test.com', 'wednesday');
      expect(accountController.isNext.value, true);
    });

    test('ClearError should reset error messages', () {
      accountController.errorEmail.value = 'Error';
      accountController.errorPassword.value = 'Error';
      accountController.clearError();
      expect(accountController.errorEmail.value, '');
      expect(accountController.errorPassword.value, '');
    });
  });
}
