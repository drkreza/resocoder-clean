/* import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';

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
  late String enteredPin;

  Future<void> setPin(BuildContext context) async {
    String pin = await createScreen(
      context: context,
      // correctString: '1234', // Set your own correct PIN
      onCompleted: (context, result) {
        enteredPin = result;
        // Show the PIN confirmation UI
        return createScreen(
          context: context,
          correctString: result,
          onCompleted: (context, confirmResult) {
            if (confirmResult == result) {
              // PINs match, set PIN
              Navigator.pop(context, result);
            } else {
              // PINs do not match, show error
              Navigator.pop(context, null);
            }
          },
        );
      },
    );

    if (pin != null) {
      // PIN set successfully
      print('Entered PIN: $pin');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biometric Authentication Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await setPin(context);
          },
          child: Text('Set PIN'),
        ),
      ),
    );
  }
}
 */