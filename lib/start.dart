import 'package:flutter/material.dart';
import 'package:predsednik/question.dart';
import 'package:predsednik/quiz.dart';
import 'package:play_games/play_games.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
            flex: 2,
            child: new Container(),
          ),
          CenterText(
            "Koliko poznaješ predednika?",
            textSize: 35,
          ),
          Expanded(
            flex: 5,
            child: CircleAvatar(
              backgroundImage: AssetImage(
                "images/vucicstart.jpg",
              ),
              minRadius: 90,
              maxRadius: 150,
            ),
          ),
          Expanded(
            flex: 1,
            child: new Container(),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.blue,
                textColor: Colors.white,
                child: Text(
                  "Počni kviz",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Quiz()),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.blue,
                textColor: Colors.white,
                child: Text(
                  "Pogledaj tabelu",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () => PlayGames.showLeaderboard("CgkIjPvc95MdEAIQAw"),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: new Container(),
          ),
        ],
      ),
    );
  }
}
