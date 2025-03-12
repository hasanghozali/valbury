import 'package:app/generated/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:local_auth/local_auth.dart';

class BiometricUtil {

  static Future<bool> available() async {
    if (kIsWeb) return false;
    bool canCheck = await LocalAuthentication().canCheckBiometrics;
    bool isSupported = await LocalAuthentication().isDeviceSupported();

    return canCheck || isSupported;
  }

  static Future<bool> authenticate({String? message}) async {
    return await LocalAuthentication().authenticate(
      localizedReason: message ?? S().biometric_message,
      options: const AuthenticationOptions(
        biometricOnly: true,
        useErrorDialogs: true,
      ),
    );
  }

  static Future<bool> validate() async {
    final available = await BiometricUtil.available();
    if (available) {
      final authenticate = await BiometricUtil.authenticate();
      if (authenticate) {
        return true;
      }
    }
    return false;
  }
}
