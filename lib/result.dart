import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Result extends StatefulWidget {
  int result;
  String message1;
  String message2;

  Result(int result) {
    print(result);
    this.result = result ~/ 10;
    if (result == 100) {
      this.message1 = "Čestitamo!";
      this.message2 = "Nema boljeg poznavaoca Vučića od Vas!";
    } else if (result > 75) {
      this.message1 = "Odlično!";
      this.message2 = "Vi odlično poznajete Vučića, svaka čast!";
    } else if (result > 50) {
      this.message1 = "Nije loše.";
      this.message2 = "Dobro poznajete Vučića ali morate to bolje!";
    } else {
      this.message1 = "Loše!";
      this.message2 = "Vaš predsednik ne bi mogao da bude ponosan na Vas";
    }
  }

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            // Box decoration takes a gradient
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Colors.lightBlue[800],
                Colors.lightBlue[700],
                Colors.lightBlue[600],
                Colors.lightBlue[400],
              ],
            ),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: new Container(),
              ),
              Center(
                child: Text(
                  "Vaš skor je: ",
                  style: TextStyle(fontSize: 60),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Text(
                  widget.result.toString(),
                  style: TextStyle(fontSize: 60),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 60,
                child: Container(),
              ),
              Center(
                child: Text(
                  widget.message1,
                  style: TextStyle(fontSize: 60),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Text(
                  widget.message2,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: new Container(),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Početna strana"),
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
