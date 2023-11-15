import 'package:clean_reso_coder_implementation/widgets/custom_widget/some_test_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rounded Grey Corner Rectangle'),
        ),
        body: Center(
          child: SomeTestWidget(
            widget: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white),
                onPressed: () {
                  print("clicked");
                  // ScaffoldMessenger.of(context).showSnackBar(
                      // const SnackBar(content: Text('button clicked')));
                },
                child: const Text('click me '),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
