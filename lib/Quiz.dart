import 'package:flutter/material.dart';
import 'underquiz.dart';
import 'result.dart';
import './Quizfragen.dart';


class Quiz extends StatelessWidget {
  final int index;
  final int totalScore;
  final Function reset;
  final Function antwort;
  final int entryIndex;
  final int contentIndex;

  Quiz(this.index, this.totalScore, this.reset, this.antwort, this.entryIndex, this.contentIndex);

  @override
  Widget build(BuildContext context) {
    if(qfragen[contentIndex][entryIndex].length != 0){
      return Container(
          child: index < qfragen[contentIndex][entryIndex].length
              ? Underquiz(
                  fragen: qfragen,
                  antwort: antwort,
                  index: index,
                  entryIndex: entryIndex,
                  contentIndex: contentIndex
          )
              : Result(totalScore, reset, qfragen[contentIndex][entryIndex].length, qfragen[contentIndex][entryIndex]));}
    else{
      return Center(
        child: Text("Hier ist kein Quiz nötig. Du kannst gleich weiter machen!",
          style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black38),),
      );
    }
  }
}
