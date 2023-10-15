import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField({super.key});

  String inputText = '';

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textController,
                onChanged: (value) {
                  // setState(() {
                  inputText = value;
                  // });
                  print("value changed : " + value);
                },
                onSubmitted: (value) {
                  print("onSubmitted value : " + textController.text);
                },
                onEditingComplete: () {
                  print("onEditingComplete");
                },
                decoration: InputDecoration(
                  hintText: 'enter a number',
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 8), 
                  focusedBorder: const OutlineInputBorder( // Add padding inside the TextField
                    // Remove border when focused
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(  // Remove border when not focused
                      borderSide: const BorderSide(color: Colors.grey), 
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('inputText : $inputText'),
            ],
          ),
        ),
      ),
    );
  }
}
