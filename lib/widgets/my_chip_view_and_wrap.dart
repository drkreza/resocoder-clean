import 'package:flutter/material.dart';

class MyChipViewAndWrap extends StatelessWidget {
  const MyChipViewAndWrap({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        // direction: Axis.vertical,
        direction: Axis.horizontal,
        children: [
          const Chip(
            label: Text('Flutter Tutorial'),
          ),
          Chip(
            avatar: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: const Icon(Icons.share)),
            label: const Text('Share'),
          ),
          Chip(
            avatar: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: const Icon(Icons.camera)),
            label: const Text('Camera'),
          ),
          Chip(
            avatar: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: const Text('F')),
            label: const Text('Feedback'),
          ),
        ],
      ),
    );
  }
}
