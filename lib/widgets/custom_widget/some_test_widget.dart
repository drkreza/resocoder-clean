import 'package:flutter/material.dart';

class SomeTestWidget extends StatelessWidget {
  // SomeTestWidget(Widget? widget, {super.key});
  SomeTestWidget({super.key, required this.widget});

  Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Set the width of the rectangle
      height: 200, // Set the height of the rectangle
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, // Set the border color to grey
          width: 2.0, // Set the border width
        ),
        borderRadius: BorderRadius.circular(
            15.0), // Set the border radius for rounded corners
      ), // Set the border radius for rounded corners

      // child: Text('hi',style: TextStyle(backgroundColor: Colors.red,color: Colors.white ),),
      child: widget,
    );
  }
}
