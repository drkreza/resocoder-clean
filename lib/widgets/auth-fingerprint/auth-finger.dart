import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final LocalAuthentication localAuth = LocalAuthentication();

  String pin = '';

  Future<void> authenticateWithCustomUI() async {
    try {
      bool authenticated = await localAuth.authenticate(
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: 'سلام',
            cancelButton: 'کنسل',
            biometricHint: 'میو',
            biometricRequiredTitle: 'بعععع',
            deviceCredentialsRequiredTitle: 'دست خر',
            deviceCredentialsSetupDescription: 'دست بز',
            goToSettingsButton: 'ندسیبذردثقذا'
          ),
        ],
        options: AuthenticationOptions(
          biometricOnly: true,
        ),
        localizedReason: 'امضا با اثر انگشت',
      );

      if (authenticated) {
        print('Authentication successful');
        // Proceed with the secured functionality
      } else {
        print('Authentication failed');
        // Show error message or handle accordingly
      }
    } catch (e) {
      print('Error during biometric authentication: $e');
      // Handle error accordingly
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Biometric Authentication Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Your custom fingerprint UI goes here
              Text('Place your custom fingerprint UI here'),

              // PIN entry
              TextField(
                obscureText: true,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    pin = value;
                  });
                },
                decoration: InputDecoration(labelText: 'Enter PIN'),
              ),

              // Authenticate button
              ElevatedButton(
                onPressed: () {
                  // Authenticate using custom UI
                  authenticateWithCustomUI();
                },
                child: Text('Authenticate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
