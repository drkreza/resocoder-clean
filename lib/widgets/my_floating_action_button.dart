import 'package:flutter/material.dart';

enum POSITIONS { endDocked, centerFloat, endFloat, centerDocked }

class MyFloadtingActionButton extends StatefulWidget {
  const MyFloadtingActionButton({super.key});

  @override
  _MyFloadtingActionButtonState createState() =>
      _MyFloadtingActionButtonState();
}

class _MyFloadtingActionButtonState extends State<MyFloadtingActionButton> {
  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.centerDocked;
  POSITIONS? _character = POSITIONS.centerDocked;
  bool? _isNotched = false;
  bool? _isMini = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            ListTile(
              title: const Text("Mini"),
              leading: Checkbox(
                value: _isMini,
                onChanged: (bool) => {
                  setState(() {
                    _isMini = bool;
                  })
                },
              ),
            ),
            ListTile(
              title: const Text("Bottom Notch"),
              leading: Checkbox(
                value: _isNotched,
                onChanged: (bool) => {
                  setState(() {
                    _isNotched = bool;
                  })
                },
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text("Center Docked"),
              leading: Radio(
                value: POSITIONS.centerDocked,
                groupValue: _character,
                onChanged: (POSITIONS? value) {
                  setState(() {
                    _character = value;
                    _fabLocation = FloatingActionButtonLocation.centerDocked;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text("End Docked"),
              leading: Radio(
                value: POSITIONS.endDocked,
                groupValue: _character,
                onChanged: (POSITIONS? value) {
                  setState(() {
                    _character = value;
                    _fabLocation = FloatingActionButtonLocation.endDocked;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text("End Float"),
              leading: Radio(
                value: POSITIONS.endFloat,
                groupValue: _character,
                onChanged: (POSITIONS? value) {
                  setState(() {
                    _character = value;
                    _fabLocation = FloatingActionButtonLocation.endFloat;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text("Center Float"),
              leading: Radio(
                value: POSITIONS.centerFloat,
                groupValue: _character,
                onChanged: (POSITIONS? value) {
                  setState(() {
                    _character = value;
                    _fabLocation = FloatingActionButtonLocation.centerFloat;
                  });
                },
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            mini: this._isMini!,
            onPressed: () => {},
            child: const Icon(Icons.add)),
        floatingActionButtonLocation: this._fabLocation,
        bottomNavigationBar: BottomAppBar(
          shape: _isNotched! ? const CircularNotchedRectangle() : null,
          child: Container(
            color: Colors.red,
            height: 50.0,
          ),
        ),
      ),
    );
  }
}
