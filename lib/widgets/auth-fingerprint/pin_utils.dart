import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class PinUtils {
  late BuildContext context;

  PinUtils(this.context);

  void showPinDialogWithConfirmation() {
    screenLockCreate(
      title: const Text('لطفا یک رمز عددی برای کیف توکن خود انتخاب کنید'),
      canCancel: true,
      context: context,
      confirmTitle: const Text('لطفا مجددا رمز را وار کنید'),
      config: defaultScreenLockConfig,
      onCancelled: () {
        Navigator.of(context).pop();
      },
      onConfirmed: (value) => {Navigator.of(context).pop()},
      customizedButtonChild: const Icon(
        Icons.fingerprint,
      ),
      customizedButtonTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('ابتدا یک رمز عددی تنظیم کنید')));
      },
      // customizedButtonTap: () async => await localAuth(context),
      // onOpened: () async => await localAuth(context),
    );
  }

  void showPinDialog() {
    screenLockCreate(
      title: const Text('لطفا یک رمز عددی برای کیف توکن خود انتخاب کنید'),
      canCancel: true,
      context: context,
      confirmTitle: const Text('لطفا مجددا رمز را وار کنید'),
      config: defaultScreenLockConfig,
      onCancelled: () {
        Navigator.of(context).pop();
      },
      onConfirmed: (value) => {Navigator.of(context).pop()},
      customizedButtonChild: const Icon(
        Icons.fingerprint,
      ),
      customizedButtonTap: () async => await localAuth(context),
      onOpened: () async => await localAuth(context),
    );
  }
}

final ScreenLockConfig defaultScreenLockConfig = ScreenLockConfig(
  backgroundColor: Colors.blue.shade200,
  buttonStyle: OutlinedButton.styleFrom(
    foregroundColor: const Color(0xFFFFFFFF),
    backgroundColor: const Color(0xFF808080),
    shape: const CircleBorder(),
    padding: const EdgeInsets.all(0),
    side: BorderSide.none,
  ),
  titleTextStyle: const TextStyle(
    color: Colors.white,
    fontSize: 20,
  ),
  textStyle: const TextStyle(
    color: Colors.white,
    fontSize: 18,
  ),
);

Future<void> localAuth(BuildContext context) async {
  final localAuth = LocalAuthentication();
  final didAuthenticate = await localAuth.authenticate(
    localizedReason: ' ',
    // biometricOnly: true,
    authMessages: const <AuthMessages>[
      AndroidAuthMessages(
        signInTitle: 'ورود با امضا',
        cancelButton: 'انصراف',
        biometricHint: '',
        biometricRequiredTitle: 'بعععع',
        deviceCredentialsRequiredTitle: ' خر',
        deviceCredentialsSetupDescription: ' بز',
        goToSettingsButton: 'ندسیبذردثقذا',
        biometricNotRecognized: 'نشد داداش',
        biometricSuccess: 'موفق',
        goToSettingsDescription: 'برو به تنطیمات',
      ),
      IOSAuthMessages(
        
      ),
    ],
    options: const AuthenticationOptions(biometricOnly: true),
  );
  if (didAuthenticate) {
    Navigator.of(context).pop();
  }
}
