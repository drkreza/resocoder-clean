/* ******************************************
                 *** START***
****************************************** */

import 'package:flutter/material.dart';

class MyColumns extends StatefulWidget {
  const MyColumns({super.key});

  @override
  _MyColumnsState createState() => _MyColumnsState();
}

enum ALIGN { spaceEvenly, start, center }

class _MyColumnsState extends State<MyColumns> {
  ALIGN? _character = ALIGN.spaceEvenly;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.spaceEvenly;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: _mainAxisAlignment,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "This is the Column Widget - Item1",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const Text(
                    "This is the Column Widget - Item2",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  Image.asset(
                    "image/logo.png",
                    fit: BoxFit.fitHeight,
                  ),
                  const Text(
                    "This is the Column Widget - Item4",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),

                  //new Container()
                ],
              ),
            ),
          ),
        ),
        Container(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Row(
              children: <Widget>[
                Radio(
                  value: ALIGN.spaceEvenly,
                  groupValue: _character,
                  onChanged: (ALIGN? value) {
                    setState(() {
                      _character = value;
                      _mainAxisAlignment = MainAxisAlignment.spaceEvenly;
                    });
                  },
                ),
                const Text("Evently"),
                Radio(
                  value: ALIGN.start,
                  groupValue: _character,
                  onChanged: (ALIGN? value) {
                    setState(() {
                      _character = value;
                      _mainAxisAlignment = MainAxisAlignment.start;
                    });
                  },
                ),
                const Text("Start"),
                Radio(
                  value: ALIGN.center,
                  groupValue: _character,
                  onChanged: (ALIGN? value) {
                    setState(() {
                      _character = value;
                      _mainAxisAlignment = MainAxisAlignment.center;
                    });
                  },
                ),
                const Text("Center"),
              ],
            ),
          ),
        )
      ],
    );
  }
}
