import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'QuizPage.dart';

class MyHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blue,
      child: new InkWell(
        onTap: () => {
          Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuizPage())):context,
          Navigator.of(context).pop():context
},
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Lets Quizz",
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold),
            ),
            new Text(
              "Tap to Start!",
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
