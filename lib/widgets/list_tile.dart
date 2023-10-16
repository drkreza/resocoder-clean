import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            ListTile(
              leading: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star),
                ],
              ),
              title: const Text('Title Text'),
              // subtitle: const Text('Subtitle Text'),
              trailing: const Icon(Icons.camera),
              onTap: () {
                // Add your onTap functionality here.
              },
            )
          ],
        ),
      ),
    );
  }
}
