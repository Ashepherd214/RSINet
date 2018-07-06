import 'package:flutter/material.dart';

class WeatherItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Test Info for Date Cards', style: new TextStyle(color: Colors.red, fontSize: 24.0)),
            ],
        ),
      ),
    );
  }
}