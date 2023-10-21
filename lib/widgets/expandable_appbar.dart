import 'package:flutter/material.dart';

class ExpandableAppBarScreen extends StatefulWidget {
  const ExpandableAppBarScreen({super.key});

  @override
  ExpandableAppBarScreenState createState() => ExpandableAppBarScreenState();
}

class ExpandableAppBarScreenState extends State<ExpandableAppBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0, // Adjust as needed
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text('Expandable App Bar'),
              background: Image.asset(
                'assets/code-wallpaper-4.png', // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // Your content goes here
                return ListTile(
                  title: Text('Item $index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ExpandableAppBarScreen(), // Replace with your home screen
    );
  }
}
