import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
              elevation: 8,
              child: ListTile(
                leading: Icon(Icons.add_a_photo),
                title: Text('Sample Card 2'),
                subtitle: Text('Elevation - 8'),
                trailing: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              )),
        ],
      ),
    );
  }
}
