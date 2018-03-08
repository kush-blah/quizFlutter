import 'dart:math';

import 'package:flutter/material.dart';

class ResultOverlay extends StatefulWidget {
  final VoidCallback _onTap;
  final bool _isCorrect;
  ResultOverlay(this._isCorrect,this._onTap);
  @override
  State<StatefulWidget> createState() => new ResultOverlayState();
}

class ResultOverlayState extends State<ResultOverlay> with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(duration: new Duration(seconds: 2),vsync: this);
    _iconAnimation = new CurvedAnimation(parent: _iconAnimationController,curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState((){}));
    _iconAnimationController.forward();
  }
  
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => widget._onTap(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: new Transform.rotate(
                angle: _iconAnimation.value * 2 * PI,
                child: new Icon(widget._isCorrect ? Icons.done : Icons.clear,
                  size:_iconAnimation.value * 80),
              )
            ),
            new Padding(
              padding: new EdgeInsets.only(bottom: 20.0),
            ),
            new Text(widget._isCorrect ? "Correct" : "Incorrect",
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
