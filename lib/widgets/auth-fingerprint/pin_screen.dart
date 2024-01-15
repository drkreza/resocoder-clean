import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  bool _screenLockCreated = false;

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
        ],
        options: const AuthenticationOptions(biometricOnly: true));
    if (didAuthenticate) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_screenLockCreated) {
      // Defer the execution of screenLockCreate to after the build is complete
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          screenLockCreate(
            title: const Text('لطفا یک رمز عددی برای کیف توکن خود انتخاب کنید'),
            canCancel: true,
            context: context,
            confirmTitle: const Text('لطفا مجددا رمز را وار کنید'),
            config: defaultScreenLockConfig,
            onCancelled: () {
              Navigator.of(context).pop();
            },
            onConfirmed: (value) => print(value),
            customizedButtonChild: const Icon(
              Icons.fingerprint,
            ),
            customizedButtonTap: () async => await localAuth(context),
            onOpened: () async => await localAuth(context),
          );
          // Set the flag to true to avoid calling screenLockCreate multiple times
          setState(() {
            _screenLockCreated = true;
          });
        },
      );
    }
    return Container(
      color: Colors.blue.shade200,
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
