import 'package:flutter/material.dart';
import "./Frage.dart";
import './answer.dart';
//import './Quiz.dart';

class Underquiz extends StatelessWidget {
  final List<Map<String, Object>> fragen;
  final Function antwort;
  final int index;

  Underquiz({
    @required this.fragen,
    @required this.antwort,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Frage(fragen[index]["frage"]),
        ...(fragen[index]["antworten"] as List<Map<String,Object>>).map((answer) {
          return Answer(()=>antwort(answer["score"]), answer["text"]);
        }).toList()
      ],
    );
  }
}