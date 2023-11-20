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

import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Stack(
            children: [
              TopLeftQuarterCircle(
                diameter: 220.0, // Adjust the diameter as needed
                color: Colors.yellow,
              ),
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: LeftHalfCircle(
                  diameter: MediaQuery.of(context).size.height /
                      2, // Adjust the diameter as needed
                  color: Colors.blue,
                ),
              ),
              CenterRightHalfCircle(
                width: 200.0,
                height: 470.0,
                color: Colors.red,
                topPadding: 70.0,
              ),
            ],
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
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(diameter),
          ),
        ),
      ),
    );
  }
}
