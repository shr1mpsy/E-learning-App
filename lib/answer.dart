import 'package:flutter/material.dart';
//import './Quiz.dart';

class Answer extends StatelessWidget {

  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(answerText),
        color: Colors.lightBlueAccent,
        onPressed: selectHandler,
      ),
    );
  }
}
