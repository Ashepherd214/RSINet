import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Test Info', style: new TextStyle(color: Colors.white)),
        Text('This is a temp view that will be changed to a list view later',
            style: new TextStyle(color: Colors.red, fontSize: 12.0)),
      ],
    );
  }
}