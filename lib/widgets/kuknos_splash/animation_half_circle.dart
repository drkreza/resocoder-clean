/* import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CenterLeftHalfCircle(),
      ),
    );
  }
}

class CenterLeftHalfCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.0), // Adjust the top padding as needed
      child: Container(
        alignment: Alignment.topLeft,
        child: ClipPath(
          clipper: HalfCircleClipper(),
          child: Container(
            width: 150.0, // Adjust the width as needed
            height: 300.0, // Adjust the height as needed
            color: Colors.blue, // Set the color of the half circle
          ),
        ),
      ),
    );
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, size.height / 2);
    path.arcTo(Rect.fromCircle(center: Offset(0.0, size.height / 2), radius: size.width), 3 * pi / 2, pi, false);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
 */

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _condition = false;
  double _position = 0.0;
  double _top_position = 0.0;
  final Duration _duration = const Duration(milliseconds: 3000);
  final Duration _lef_duration = const Duration(milliseconds: 1200);
  final Duration _logo_duration = const Duration(milliseconds: 5000);

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  void startAnimation() {
    Future.delayed(_duration, () {
      setState(() {
        _position = -MediaQuery.of(context).size.width;
        _top_position = -MediaQuery.of(context).size.height;
      });
    });

    // Change the condition after 5 seconds
    Timer(const Duration(seconds: 5), () {
      setState(() {
        _condition = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(113,197,238,1),Color.fromRGBO(53,134,188,1),Color.fromRGBO(2,80,145,1)],
              ),
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  top: _top_position,
                  left: _top_position,
                  duration: _duration,
                  child: TopLeftQuarterCircle(
                    diameter: 220.0, // Adjust the diameter as needed
                    // color: const Color.fromRGBO(217, 217, 217, 0.08),
                    color: const Color.fromRGBO(217, 217, 217, 0.08),
                  ),
                ),
                AnimatedPositioned(
                  left: _position,
                  top: 0,
                  bottom: 0,
                  duration: _lef_duration,
                  child: LeftHalfCircle(
                    diameter: (MediaQuery.of(context).size.height /2) - 35, // Adjust the diameter as needed
                    color: const Color.fromRGBO(217, 217, 217, 0.08),
                  ),
                ),
                AnimatedPositioned(
                  right: _position,
                  duration: _duration,
                  child: CenterRightHalfCircle(
                    width: 215.0,
                    height: 490.0,
                    color: const Color.fromRGBO(217, 217, 217, 0.08),
                    topPadding: 70.0,
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  //  top: (MediaQuery.of(context).size.height - 100) / 2, // Center vertically
                  left: (MediaQuery.of(context).size.width - 100) /
                      2, // Center horizontally
                  top: _condition
                      ? 140
                      : MediaQuery.of(context).size.height / 2 - 50,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
                    width: 100,
                    height: 100,
                  
                    child: const Center(
                      child: Text(
                        'Tap me!',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LeftHalfCircle extends StatelessWidget {
  final double diameter;
  final Color color;

  LeftHalfCircle({
    required this.diameter,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30.0, bottom: 30.0,right: 100),
      width: diameter,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(diameter),
          bottomRight: Radius.circular(diameter),
        ),
      ),
    );
  }
}

class CenterLeftHalfCircle extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double topPadding;

  CenterLeftHalfCircle({
    required this.width,
    required this.height,
    required this.color,
    required this.topPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Container(
        alignment: Alignment.topLeft,
        child: ClipPath(
          clipper: HalfCircleClipperBlue(),
          child: Container(
            width: width,
            height: height,
            color: color,
          ),
        ),
      ),
    );
  }
}

class CenterRightHalfCircle extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double topPadding;

  CenterRightHalfCircle({
    required this.width,
    required this.height,
    required this.color,
    required this.topPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Container(
        alignment: Alignment.topRight,
        child: ClipPath(
          clipper: HalfCircleClipperRed(),
          child: Container(
            width: width,
            height: height,
            color: color,
          ),
        ),
      ),
    );
  }
}

class HalfCircleClipperRed extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width, size.height / 2);
    path.arcTo(
        Rect.fromCircle(
            center: Offset(size.width, size.height / 2), radius: size.width),
        pi / 2,
        pi,
        false);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class HalfCircleClipperBlue extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, size.height / 2);
    path.arcTo(
        Rect.fromCircle(
            center: Offset(0.0, size.height / 2), radius: size.width),
        3 * pi / 2,
        pi,
        false);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class TopLeftQuarterCircle extends StatelessWidget {
  final double diameter;
  final Color color;

  TopLeftQuarterCircle({
    required this.diameter,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(diameter),
        ),
      ),
    );
  }
}
