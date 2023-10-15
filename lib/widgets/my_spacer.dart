import 'package:flutter/material.dart';

class MySpacer extends StatelessWidget {
  const MySpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          CircleAvatar(
            child: Text('A'),
          ),
          CircleAvatar(
            child: Text('B'),
          ),
          CircleAvatar(
            child: Text('C'),
          ),
          CircleAvatar(
            child: Text('D'),
          ),
          
          Spacer(),
          Text('Hello'),
        ],
      ),
    );
  }
}
