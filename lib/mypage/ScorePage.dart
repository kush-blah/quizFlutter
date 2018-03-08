import 'package:flutter/material.dart';

class ScorePage extends StatefulWidget {
  final int _score;
  final int _totalQuestions;
  final VoidCallback _onPressed;
  ScorePage(this._score, this._totalQuestions, this._onPressed);
  @override
  ScorePageState createState() {
    return new ScorePageState();
  }
}

class ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueAccent,
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Your Score is :",
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.yellowAccent),
            ),
            new Text(
              widget._score.toString() +
                  "/" +
                  widget._totalQuestions.toString(),
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 80.0,
                  color: Colors.white),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new IconButton(
                  icon: new Icon(Icons.refresh),
                  color: Colors.white,
                  iconSize: 50.0,
                  onPressed: () => widget._onPressed(),
                ),
                new IconButton(
                    icon: new Icon(Icons.clear),
                    color: Colors.white,
                    iconSize: 50.0,
                    onPressed: () {
                      Navigator.of(context).pop();
                      return;
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
