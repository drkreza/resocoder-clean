import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  const MyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.network(
                'https://miro.medium.com/max/3200/1*mMJ3IvaAuMAmqjtyistCog.png'),
            const SizedBox(
              height: 20,
            ),
            Image.asset('image/logo.png'),
             const SizedBox(
              height: 20,
            ),
            CircleAvatar(child: Text('R'),)
          ],
        ),
      ),
    );
  }
}
