import 'package:flutter/material.dart';
//import './Quiz.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final int len;
  final Function resultHandler;
  final List quiztext;

  Result(this.resultScore, this.resultHandler, this.len, this.quiztext);

  String get resultPhrase {
    String resultText;
    resultText = "Du hast ${resultScore} von ${len} Fragen richtig";
    return resultText;
  }

  Widget text(path){
    String text = "";
    for(var item in path){
      for(var item2 in item["antworten"]){
        if(item2["score"] == 1){
          text = text + "- ${item2["text"]}\n\n";
        }
      }
    }
    return Text(text);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              resultPhrase,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          Card(
            color: Colors.green,
            margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      "Richtig ist:\n",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 6.0),
                    text(quiztext),
                  ],
                ),
              )
          ),
          FlatButton(
              child: Text("Quiz neustarten", style: TextStyle(fontSize: 15)),
              onPressed: resultHandler),
        ],
      ),
    );
  }
}
