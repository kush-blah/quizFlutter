import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {
  final String _question;
  final int _questionNumber;

  QuestionText(this._question, this._questionNumber);

  @override
  State createState() => new QuestionTextSate();
}

class QuestionTextSate extends State<QuestionText>
    with SingleTickerProviderStateMixin {
  Animation<double> _fontSizeAnimation; //0,0.1,0.2,0.3
  AnimationController _fontSizeAnimationController;

  @override
  void initState() {
    super.initState();
    _fontSizeAnimationController = new AnimationController(
        duration: new Duration(milliseconds: 500), vsync: this);
    _fontSizeAnimation = new CurvedAnimation(
        parent: _fontSizeAnimationController, curve: Curves.linear);
    _fontSizeAnimation.addListener(() => this.setState(() {}));
    _fontSizeAnimationController.forward();
  }

  @override
  void didUpdateWidget(QuestionText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget._question != widget._question){
      _fontSizeAnimationController.reset();
      _fontSizeAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueAccent,
      child: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 20.0),
        child: new Center(
          child: new Text(
              widget._questionNumber.toString() + ". " + widget._question,
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: _fontSizeAnimationController.value * 15,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
