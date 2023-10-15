import 'package:flutter/material.dart';

class MyRotatedBox extends StatelessWidget {
  const MyRotatedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          RotatedBox(
            quarterTurns: 1,
            child: Container(
                color: Colors.cyan,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Hello World!'),
                )),
          ),
          RotatedBox(
            quarterTurns: 2,
            child: Container(
                color: Colors.amber,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Hello World!'),
                )),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Container(
                color: Colors.deepPurple,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Hello World!'),
                )),
          ),
          RotatedBox(
            quarterTurns: 4,
            child: Container(
                color: Colors.pink,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Hello World!'),
                )),
          ),
        ],
      ),
    );
  }
}
