import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                _simpleDialog(context);
              },
              color: Colors.blue,
              child: const Text('show simple dialog'),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                _alertDialog(context);
              },
              color: Colors.blue,
              child: const Text('show alert dialog'),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                _cupertinoDialog(context);
              },
              color: Colors.blue,
              child: const Text('show cupertino dialog'),
            ),
          ]),
    );
  }
}

// Simple Dialog
Future<void> _simpleDialog(BuildContext context) async {
  switch (await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Colors.amber,
          title: const Text('Simple Dialog, Is it nice?'),
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleDialogOption(
                      onPressed: () {
                        Navigator.pop(context, 'Yes');
                      },
                      child: const Text('Yes'),
                    ),
                    SimpleDialogOption(
                      onPressed: () {
                        Navigator.pop(context, 'No');
                      },
                      child: const Text('No'),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      })) {
    case 'Yes':
      _showSnackBar('Thanks!', 'Yes', context);
      break;
    case 'No':
      _showSnackBar('Oh! No... Try to provide you best', 'No', context);
      break;
  }
}

//alert dialog
Future<void> _alertDialog(BuildContext context) async {
  switch (await showDialog(
      barrierDismissible: false, // set cancelable to false
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('Is it nice?'),
          title: const Text('Alert Dialog'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Yes');
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'No');
              },
              child: const Text('No'),
            ),
          ],
        );
      })) {
    case 'Yes':
      _showSnackBar('Thanks!', 'Yes', context);
      break;
    case 'No':
      _showSnackBar('Oh! No... Try to provide you best', 'No', context);
      break;
  }
}

//cupertino dialog
Future<void> _cupertinoDialog(BuildContext context) async {
  switch (await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Welcome'),
          content: const Text('Cupertino Dialog, Is it nice?'),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context, 'Yes');
              },
              child: const Text('Yes'),
            ),
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context, 'No');
              },
              child: const Text('No'),
            ),
          ],
        );
      })) {
    case 'Yes':
      _showSnackBar('Thanks!', 'Yes', context);
      break;
    case 'No':
      _showSnackBar('Oh! No... Try to provide you best', 'No', context);
      break;
  }
}

void _showSnackBar(String text, String ans, BuildContext context) {
  final SnackBar snackBar = SnackBar(
      duration: const Duration(milliseconds: 500),
      backgroundColor: ans.compareTo('Yes') == 0 ? Colors.green : Colors.red,
      content: Row(
        children: <Widget>[
          Icon(
            ans.compareTo('Yes') == 0 ? Icons.favorite : Icons.watch_later,
            color: ans.compareTo('Yes') == 0 ? Colors.pink : Colors.yellow,
            size: 24.0,
            semanticLabel: text,
          ),
          Text(text)
        ],
      ));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
