import 'package:flutter/material.dart';
import '../UI/QuestionText.dart';
import '../utils/Quiz.dart';
import '../utils/Question.dart';
import '../UI/AnswerButton.dart';
import '../UI/ResultOverlay.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Is Elon Musk is Human?", false),
    new Question("Is Pizza Healthy", false),
    new Question("Is Donald Trump fit to Be President?", false),
    new Question("Is the World round?", true),
    new Question("is Flutter Awesome?", true)
  ]);
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool displayResultOverlay;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      displayResultOverlay = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          // This is Our Main Page
          children: <Widget>[
            new AnswerButton(true, () {
              handleAnswer(true);
            }),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () {
              handleAnswer(false);
            })
          ],
        ),
        displayResultOverlay == true
            ? new ResultOverlay(isCorrect, () {
                currentQuestion = quiz.nextQuestion;
                this.setState(() {
                  displayResultOverlay = false;
                  questionText = currentQuestion.question;
                  questionNumber = quiz.questionNumber;
                });
              })
            : new Container(),
      ],
    );
  }
}
