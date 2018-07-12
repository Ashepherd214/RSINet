import 'dart:async';

import 'package:flutter/material.dart';
import 'package:async_loader/async_loader.dart';

import 'dart:convert';
import 'dart:io';

import 'package:rsi_net/user.dart';

import 'package:rsi_net/widgets/Weather.dart';
import 'package:rsi_net/widgets/WeatherItem.dart';


void main() => runApp(new RsiApp());

class RsiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'RSI.Net',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:new LoadPage(),
    );
  }
}

final GlobalKey<AsyncLoaderState> _asyncLoaderState =
    new GlobalKey<AsyncLoaderState>();

var _asyncLoader = new AsyncLoader(
    key: _asyncLoaderState,
    initState: () async => await _getUserApi(),
    renderLoad: () => new CircularProgressIndicator(),
    renderError: ([error]) => new Text('Sorry, there was an error loading'),
    renderSuccess: ({data}) => new TimeHome(data),
);

_getUserApi() async {
  var httpClient = new HttpClient();
  var uri = new Uri.https('rsi-prod1', '/Host%20IO/xampp/htdocs/LGOAN/TestApi.php');
  var request = await httpClient.getUrl(uri);
  var response = await request.close();
  var responseBody = await response.transform(UTF8.decoder).join();
  return responseBody;
}

class LoadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Timesheet"),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          new Expanded(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _asyncLoader,
              ]
            )
          ),
        ],
      ),
    );
  }
}

class TimeHome extends StatefulWidget {
  String _response;

  TimeHome(String response) {
    this._response = response;
  }

  @override
  _TimeHomeState createState() => new _TimeHomeState(_response);
}

class _TimeHomeState extends State<TimeHome> {
  String _response;
  User _user;

  _TimeHomeState(String response) {
    this._response = response;
  }

  @override
  Widget build(BuildContext context) {
    Map userMap = JSON.decode(_response);
    _user = new User.fromJson(userMap);

    String json = JSON.encode(_user);
    print(json);

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
                      child: new Text("User is: " + '${_user.username}'),
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

