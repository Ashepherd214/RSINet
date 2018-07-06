import 'package:flutter/material.dart';

void main() => runApp(new RsiApp());

class RsiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'RSI.Net',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this would produce 2 rows.
          crossAxisCount: 2,
          // Generate 100 Widgets that display their index in the List
          children: new List.generate(100, (index) {
            new Center(
              child: new Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline,
              ),
            );
          }),
        ),
      ),
    );
  }
}
class FindDate extends StatefulWidget {
  @override
  createState() => new FindDateState();
}

class FindDateState extends State<FindDate> {
  @override
  Widget build(BuildContext context) {
    final dayFound = new DateTime.now().weekday.toString();
    final dateFound = new DateTime.now().day.toString();
    return new Text( (dayFound + dateFound));
  }
}