import 'package:flutter/material.dart';
//import './Quiz.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resultHandler;
  Result(this.resultScore, this.resultHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore == 3) {
      resultText = "Sehr Gut! Du hast 3 von 3 Fragen richtig beantwortet";
    } else if (resultScore == 2) {
      resultText = "Geht so! Du hast 2 von 3 Fragen richtig beantwortet";
    } else if (resultScore == 1) {
      resultText = "Nicht so gut! Du hast 1 von 3 Fragen richtig beantwortet";
    } else {
      resultText = "Schlecht! Du hast 0 von 3 Fragen richtig beantwortet";
    }
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
            onPressed: resultHandler,
            textColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
