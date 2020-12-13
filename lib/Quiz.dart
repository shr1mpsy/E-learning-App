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
      "frage": "Warum heißt es Cloud?",
      "antworten": [
        {"text": "Weil dem Nutzer alle Abläufe und Strulturen verborgen bleiben", "score": 1},
        {"text": "Weil die große Menge an Servern zusammengenommen wie eine Wolke wirken", "score": 0}
      ]
    }
  ],
  //Vorteile
  [
    {
      "frage": "Welches ist kein Vorteil von Cloud Computing?",
      "antworten": [
        {"text": "Billiger", "score": 0},
        {"text": "Skalierbarer", "score": 0},
        {"text": "Sicherer", "score": 0},
        {"text": "Unabhängigkeit vom Anbieter", "score": 1},
        {"text": "Produktivitätssteigernd", "score": 0}
      ]
    }
  ],
  //Nachteile
  [
    {
      "frage": "Warum macht man sich abhängig vom Anbieter?",
      "antworten": [
        {"text": "Weil man seine Hilfe braucht", "score": 0},
        {"text": "Weil man seine Resourcen nutzt", "score": 1},
        {"text": "Weil man ihm Geld zahlen muss", "score": 0},
      ]
    }
  ],
  //Arten von CC
  [
    {
      "frage": "Welches ist keine der Arten des Cloud Computing?",
      "antworten": [
        {"text": "Private Cloud", "score": 0},
        {"text": "Native Cloud", "score": 1},
        {"text": "Public Cloud", "score": 0},
        {"text": "Multi Cloud", "score": 0},
      ]
    }
  ],
  //Arten von CS
  [
    {
      "frage": "Welches ist die meistgenutzte und grundlegenste Art der Cloud Services?",
      "antworten": [
        {"text": "IaaS", "score": 1},
        {"text": "SaaS", "score": 0},
        {"text": "PaaS", "score": 0},
      ]
    },
    {
      "frage": "Was wird einem zur Verfügung gestellt, wenn man IaaS nutzt?",
      "antworten": [
        {"text": "Digitale Infrastruktur", "score": 1},
        {"text": "Analoge Infrastruktur", "score": 0},
        {"text": "Software", "score": 0},
        {"text": "Platform", "score": 0},
      ]
    }
  ],
  //Historie
  [
    {
      "frage": "Wann wurde der Grundstein des heutigen Cloud Computings gelegt?",
      "antworten": [
        {"text": "70er Jahre", "score": 0},
        {"text": "60er Jahre", "score": 1},
        {"text": "50er Jahre", "score": 0},
        {"text": "80er Jahre", "score": 0},
      ]
    },
    {
      "frage": "Welches Unternehmen war der Hauptpionier von Cloud Computing?",
      "antworten": [
        {"text": "Google", "score": 0},
        {"text": "Salesforce", "score": 1},
        {"text": "IBM", "score": 0},
        {"text": "Amazon", "score": 0},
      ]
    },
  ],
  //Einsatzmöglichkeiten von CC
  [
    {
      "frage": "Welches der nachfolgenden Sachen denken Sie hat nichts direkt mit Cloud Computing zu tun?",
      "antworten": [
        {"text": "Google docs", "score": 0},
        {"text": "Dropbox", "score": 0},
        {"text": "Microchips", "score": 1},
        {"text": "One Drive", "score": 0},
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
