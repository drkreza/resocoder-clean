import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     print("C");
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Custom Dialog',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('This is a custom dialog content.'),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}

void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomDialog();
    },
  );
}
