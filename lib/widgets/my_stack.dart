/* ******************************************
                 *** START***
****************************************** */

import 'package:flutter/material.dart';

class MyStack extends StatelessWidget {
  const MyStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 400,
            height: 400,
            color: Colors.yellow,
          ),
          Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.green,
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.blue,
          ),
          Container(
            width: 25,
            height: 25,
            color: Colors.greenAccent,
          ),
          Positioned(
            top: 0,
            left: 10,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}
