/* ******************************************
                 *** START***
****************************************** */

import 'package:flutter/material.dart';

class MyMaterialButton extends StatefulWidget {
  const MyMaterialButton({Key? key}) : super(key: key);

  @override
  _MyMaterialButtonState createState() => _MyMaterialButtonState();
}

class _MyMaterialButtonState extends State<MyMaterialButton> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Scaffold'),
        ),
        body: Center(
          child: MaterialButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text(
                      'this is a test snackbar this is a test snackbar this is a test snackbar this is a test snackbar this is a test snackbar this is a test snackbar this is a test snackbar this is a test snackbar this is a test snackbar'),
                  backgroundColor: Colors.blue.shade600,
                  duration: const Duration(seconds: 3),
                ),
              );
            },
            color: Colors.blue,
            splashColor: Colors.purple,
            colorBrightness: Brightness.dark,
            child: const Text('Click Me'),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 50.0,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
            _count++;
          }),
          tooltip: 'Increment Counter',
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

/* ******************************************
*********************************************
*********************************************
              *** END***
*********************************************
*********************************************
****************************************** */
