import 'package:flutter/material.dart';
import 'package:predsednik/start.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        /*appBar: AppBar(
          title: new Text("My first app"),
        ),*/
        body: StartScreen()
      ),
    );
  }
}
