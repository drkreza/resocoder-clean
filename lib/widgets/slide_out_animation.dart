import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: SlideOutAnimation(),
  ));
}

class SlideOutAnimation extends StatefulWidget {
  const SlideOutAnimation({super.key});

  @override
  SlideOutAnimationState createState() => SlideOutAnimationState();
}

class SlideOutAnimationState extends State<SlideOutAnimation> {
  double _position = 0.0;
  final Duration _duration = const Duration(seconds: 2);

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  void startAnimation() {
    Future.delayed(_duration, () {
      setState(() {
        _position = -MediaQuery.of(context).size.width;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slide Out Animation'),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: _duration,
            right: _position,
            child: Container(
              height: 100,
              color: Colors.red,
              child: const Center(
                child: Text(
                  'Slide Out',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            left: _position,
            child: Container(
              width: 200,
              height: 100,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Slide Out',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
