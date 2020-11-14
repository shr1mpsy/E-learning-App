import 'package:flutter/material.dart';
import 'underquiz.dart';
import 'result.dart';

  var _fragen = [[
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
  ],
    //2
  [
    {
      "frage": "Welcher ist keiner der Hauptvorteile des Cloud-Computing?",
      "antworten": [
        {"text": "Billiger", "score": 0},
        {"text": "Skalierbarer", "score": 0},
        {"text": "Sicherer", "score": 0},
        {"text": "Unabhängigkeit vom Anbieter", "score": 1}
      ]
    },
    {
      "frage": "Gibt es bei Cloud-Computing 24/7 Kundensupport?",
      "antworten": [
        {"text": "Ja", "score": 1},
        {"text": "Nein", "score": 0},
      ]
    },
    {
      "frage": "Was beudeutet Cloud auf Deutsch? xD",
      "antworten": [
        {"text": "Gewitter", "score": 0},
        {"text": "Wolke", "score": 1},
        {"text": "Nebel", "score": 0},
        {"text": "Sturm", "score": 0}
      ]
    },
    {
      "frage": "Welche Art des Cloud gibt es NICHT?",
      "antworten": [
        {"text": "public Cloud", "score": 0},
        {"text": "native Cloud", "score": 1},
        {"text": "private Cloud", "score": 0},
        {"text": "hybrid Cloud", "score": 0}
      ]
    }
  ]
  ];


class Quiz extends StatelessWidget{

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
              ? Underquiz(fragen: _fragen, antwort: antwort, index: index, entryIndex: entryIndex)
              : Result(totalScore, reset, _fragen[entryIndex].length)
    );
  }
}

