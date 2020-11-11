import 'package:flutter/material.dart';
import './underquiz.dart';
import './result.dart';

  var _fragen = [
  {
  "frage": "Welcher Service wird nicht von Cloud Computing abgedeckt",
  "antworten": [
  {"text": "IaaS", "score": 0},
  {"text": "SaaS", "score": 0},
  {"text": "RaaS", "score": 1},
  {"text": "PaaS", "score": 0}
  ]
  },
  {
  "frage": "Wer ist der größte Anbieter für Cloudservices",
  "antworten": [
  {"text": "Amazon(AWS)", "score": 1},
  {"text": "Google(GCP)", "score": 0},
  {"text": "Microsoft(Azure)", "score": 0}
  ]
  },
  {
  "frage": "Was ist nicht Service einer Cloud",
  "antworten": [
  {"text": "Bereitstellung von Speicherplatz und Rechenkraft", "score": 0},
  {"text": "Bereitstellung von Nutzerservice(Hilfe)", "score": 0},
  {"text": "Bereitstellung von Hilfsgeldern für Projekte", "score": 1},
  {"text": "Die Möglichkeit von überall und zu jeder Zeit mit jedem Gerät darauf zuzugreifen", "score": 0}
  ]
  }
  ];


class Quiz extends StatelessWidget{

  final int index;
  final int totalScore;
  final Function reset;
  final Function antwort;

  Quiz(this.index, this.totalScore, this.reset, this.antwort);

  @override
  Widget build(BuildContext context) {
    return Container(
          child: index < _fragen.length
              ? Underquiz(fragen: _fragen, antwort: antwort, index: index)
              : Result(totalScore, reset)
    );
  }
}

