import 'package:flutter/material.dart';
import 'Frage.dart';
import 'answer.dart';
//import './Quiz.dart';

class Underquiz extends StatelessWidget {
  final List<List<Map<String, Object>>> fragen;
  final Function antwort;
  final int index;
  final int entryIndex;

  Underquiz({
    @required this.fragen,
    @required this.antwort,
    @required this.index,
    @required this.entryIndex
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Frage(fragen[entryIndex][index]["frage"]),
        ...(fragen[entryIndex][index]["antworten"] as List<Map<String,Object>>).map((answer) {
          return Answer(()=>antwort(answer["score"]), answer["text"]);
        }).toList()
      ],
    );
  }
}