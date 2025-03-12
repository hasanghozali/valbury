import 'package:app/generated/l10n.dart';
import 'package:app/model/account_model.dart';
import 'package:app/util/biometric_util.dart';
import 'package:app/view/atom/snackbar_atom.dart';
import 'package:app/view/page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  Rx<AccountModel?> account = Rx<AccountModel?>(null);
  var isNext = false.obs;
  var isBiometric = false.obs;
  var errorEmail = ''.obs;
  var errorPassword = ''.obs;
  var listAccount = <AccountModel>[
    AccountModel(
      name: 'John Doe',
      email: 'johndoe@test.com',
      password: 'wednesday',
      avatar: 'https://bit.ly/dan-abramov',
    ),
    AccountModel(
      name: 'Jane Doe',
      email: 'janedoe@test.com',
      password: 'friday',
      avatar: 'https://bit.ly/kent-c-dodds',
    ),
  ].obs;

  Future<void> changeLocale() async {
    var locale = Get.locale?.languageCode;
    locale = (locale ?? 'en') == 'en' ? 'id' : 'en';
    await Get.updateLocale(Locale(locale));
    changeLocaleError();
  }

  void changeLocaleError() {
    errorEmail.value = errorEmail.value.isEmpty ? '' : S().email_error;
    errorPassword.value = errorPassword.value.isEmpty ? '' : S().password_error;
  }

  bool get isLogin => (account.value?.email ?? '').isNotEmpty;

  Future<void> loginEmail(String email, String password) async {
    final foundEmail = listAccount.any((e) => e.email == email);
    final foundPassword = listAccount.any((e) => e.password == password);
    errorEmail.value = foundEmail ? '' : S().email_error;
    errorPassword.value = foundPassword ? '' : S().password_error;
    account.value = listAccount.firstWhereOrNull((e) => e.email == email && e.password == password);
    if (isLogin) {
      Get.offAll(() => const MainPage());
      clearError();
    }
  }

  Future<void> loginBiometric() async {
    final accountFound = listAccount.firstWhereOrNull((e) => e.isBiometric == true);

    if (accountFound != null) {
      final validate = await BiometricUtil.validate();
      if (validate) {
        account.value = accountFound;
      }
    } else {
      SnackBarAtom.red(S().biometric_not_active);
    }

    if (isLogin) {
      Get.offAll(() => const MainPage());
      clearError();
    }
  }

  Future<void> logOut() async {
    account.value = null;
  }

  void validate(String email, String password) {
    isNext.value = email.isNotEmpty && password.isNotEmpty;
    clearError();
  }

  void clearError() {
    errorEmail.value = '';
    errorPassword.value = '';
  }

  void activeBiometric(bool active) {
    for (var user in listAccount) {
      if (user.email == account.value?.email) {
        user.isBiometric = active;
        account.update((e) => e?.isBiometric = active);
      } else {
        user.isBiometric = false;
      }
    }

    isBiometric.value = listAccount.any((e) => e.isBiometric == true);
  }
}
