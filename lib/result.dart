import 'package:flutter/material.dart';
//import './Quiz.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final int len;
  final Function resultHandler;
  


  Result(this.resultScore, this.resultHandler, this.len);

  String get resultPhrase {
    String resultText;
    resultText = "Du hast ${resultScore} von ${len} Fragen richtig";
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          FlatButton(
            child: Text("Quiz neustarten", style: TextStyle(fontSize: 15)),
            onPressed: resultHandler
          ),
        ],
      ),
    );
  }
}

