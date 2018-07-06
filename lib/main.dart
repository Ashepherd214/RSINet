import 'package:flutter/material.dart';

import 'package:rsi_net/widgets/Weather.dart';
import 'package:rsi_net/widgets/WeatherItem.dart';


void main() => runApp(new RsiApp());

class RsiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'RSI.Net',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('RSI Timesheet'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Weather(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: new Icon(Icons.refresh),
                          tooltip: 'Refresh',
                          onPressed: () => null,
                          color: Colors.red,
                        ),
                    ),
                        ],
                      ),
                    ),
              SafeArea(
                child: Padding(
                  padding:const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200.0,
                    child: ListView.builder(
                      itemCount: 14,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => WeatherItem()
                    ),
                  ),
                ),
              )
            ]
          )
        )
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