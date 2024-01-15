/* import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class CustomLocalAuthDialog extends StatelessWidget {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> authenticate() async {
    return await auth.authenticateWithBiometrics(
      localizedReason: 'Please authenticate to show account balance',
      useErrorDialogs: false,
      stickyAuth: true,
      androidAuthStrings: AndroidAuthMessages(
        cancelButton: 'Cancel',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Authenticate'),
      content: Text('Please authenticate to show account balance'),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: Text('Authenticate'),
          onPressed: () async {
            bool authenticated = await authenticate();
            Navigator.of(context).pop(authenticated);
          },
        ),
      ],
    );
  }
}
 */