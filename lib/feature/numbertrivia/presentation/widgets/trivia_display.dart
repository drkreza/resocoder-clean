import 'package:flutter/material.dart';

import '../../domain/entities/number_trivia.dart';

class TriviaDisplay extends StatelessWidget {
  final NumberTriviaEntity numberTriviaEntity;

  const TriviaDisplay({super.key, 
    required this.numberTriviaEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: <Widget>[
          Text(
            numberTriviaEntity.number.toString(),
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Text(
                  numberTriviaEntity.text,
                  style: const TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
