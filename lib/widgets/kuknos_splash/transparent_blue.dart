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
          title: const Text('Transparent Blue Containers'),
        ),
        body: const TransparentBlueStack(),
      ),
    );
  }
}

class TransparentBlueStack extends StatelessWidget {
  const TransparentBlueStack({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(
          top: 10,
          left: 10,
          child: TransparentBlueContainer(),
        ),
        Positioned(
          top: 30,
          left: 30,
          child: TransparentBlueContainer(),
        ),
        Positioned(
          top: 50,
          left: 50,
          child: TransparentBlueContainer(),
        ),
        // Add more Positioned widgets for additional containers
      ],
    );
  }
}

class TransparentBlueContainer extends StatelessWidget {
  const TransparentBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: const Color.fromRGBO(0, 0, 255, 0.3), // Blue with 30% transparency
    );
  }
}
