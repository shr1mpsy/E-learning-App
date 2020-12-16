import 'package:flutter/material.dart';
import 'Frage.dart';
import 'answer.dart';

class Underquiz extends StatelessWidget {
  final List<List<List<Map<String, Object>>>> fragen;
  final Function antwort;
  final int index;
  final int entryIndex;
  final int contentIndex;

  Underquiz({
    @required this.fragen,
    @required this.antwort,
    @required this.index,
    @required this.entryIndex,
    @required this.contentIndex
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Frage(fragen[contentIndex][entryIndex][index]["frage"]),
        ...(fragen[contentIndex][entryIndex][index]["antworten"] as List<Map<String,Object>>).map((answer) {
          return Answer(()=>antwort(answer["score"]), answer["text"]);
        }).toList()
      ],
    );
  }
}