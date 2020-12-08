import 'package:flutter/material.dart';
import 'underquiz.dart';
import 'result.dart';

var _fragen = [
  // Definition
  [
    {
      "frage": "Wo werden Daten gespeichert?",
      "antworten": [
        {"text": "lokal", "score": 0},
        {"text": "auf entfernten Servern", "score": 1}
      ]
    },
    {
      "frage": "Warum heißt es Cloud",
      "antworten": [
        {"text": "Weil dem Nutzer alle Abläufe und Strulturen verborgen bleiben", "score": 1},
        {"text": "Weil die große Menge an Servern zusammengenommen wie eine Wolke wirken", "score": 0}
      ]
    }
  ],
  //Vorteile
  [
    {
      "frage": "Welches ist kein Vorteil von Cloud Computing",
      "antworten": [
        {"text": "Billiger", "score": 0},
        {"text": "Skalierbarer", "score": 0},
        {"text": "Sicherer", "score": 0},
        {"text": "Unabhängigkeit vom Anbieter", "score": 1},
        {"text": "Produktivitätssteigernd", "score": 0}
      ]
    }
  ],
];

class Quiz extends StatelessWidget {
  final int index;
  final int totalScore;
  final Function reset;
  final Function antwort;
  final int entryIndex;

  Quiz(this.index, this.totalScore, this.reset, this.antwort, this.entryIndex);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: index < _fragen[entryIndex].length
            ? Underquiz(
                fragen: _fragen,
                antwort: antwort,
                index: index,
                entryIndex: entryIndex)
            : Result(totalScore, reset, _fragen[entryIndex].length));
  }
}
