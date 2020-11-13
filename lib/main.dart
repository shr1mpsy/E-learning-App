import 'package:flutter/material.dart';
//import 'outsources.dart';
import './Quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  // Texte
  final text = [
      [
      //1
      "Entry: A: Die Cloud-Technologie ist weiter auf dem Vormarsch: "
          "Laut einer Umfrage des IDC (Institute for Data Communication) sehen 60 Prozent der Befragten das Cloud Computing in Unternehmen als die wichtigste Technologie im Bereich der "
          "Digitalisierung an. Damit liegt sie noch vor Big Data und Mobility. Doch was ist überhaupt eine Cloud?",
      //2
      "Wie funktioniert die Ablage von Dateien und die Zugriffsverwaltung in der großen Wolke des Internets? "
          "Welche Probleme können auftreten und wie werden diese gelöst? Wir gehen diesen Fragen auf den Grund und "
          "stellen Ihnen die wichtigsten Begriffe rund um Cloud Computing anschaulich dar.",
      //3
      "Unter einer Cloud oder Cloud Computing versteht man die internetbasierte Bereitstellung von Speicherplatz, Rechenleistung oder Anwendungssoftware als Dienstleistung."
          " Die Nutzung dieser Infrastrukturen erfolgt vorwiegend über Programme auf den zugreifenden Geräten (Clients) sowie über den Webbrowser."
          " Die Wartung und Pflege der zugrundeliegenden Architektur übernimmt der Anbieter.",
      //4
      "Ursprünglich und seit den 1990er Jahren steht der Begriff “Wolke” (englisch: “Cloud”) in IT-Diagrammen für Teile einer Informationsarchitektur. "
          "Hiermit werden meist Bereiche beschrieben, in denen Computersysteme wie Desktop-Rechner, "
          "Server und beispielsweise Smartphones auf nicht näher definierte Weise Daten untereinander austauschen. Die Analogie zu der Wolke leitet sich dadurch ab, "
          "dass es für den Anwender gleichgültig und gewissermaßen “verschleiert” ist, auf welchem konkreten Rechner und mit welcher zugrundeliegenden Hardware die Daten abgelegt sind"
    ],

    [
      //1
      "Entry: B: Die ist Entry B",
      //2
      "Wie funktioniert die Ablage von Dateien und die Zugriffsverwaltung in der großen Wolke des Internets? "
          "Welche Probleme können auftreten und wie werden diese gelöst? Wir gehen diesen Fragen auf den Grund und "
          "stellen Ihnen die wichtigsten Begriffe rund um Cloud Computing anschaulich dar.",
      //3
      "Unter einer Cloud oder Cloud Computing versteht man die internetbasierte Bereitstellung von Speicherplatz, Rechenleistung oder Anwendungssoftware als Dienstleistung."
          " Die Nutzung dieser Infrastrukturen erfolgt vorwiegend über Programme auf den zugreifenden Geräten (Clients) sowie über den Webbrowser."
          " Die Wartung und Pflege der zugrundeliegenden Architektur übernimmt der Anbieter.",
      //4
      "Ursprünglich und seit den 1990er Jahren steht der Begriff “Wolke” (englisch: “Cloud”) in IT-Diagrammen für Teile einer Informationsarchitektur. "
          "Hiermit werden meist Bereiche beschrieben, in denen Computersysteme wie Desktop-Rechner, "
          "Server und beispielsweise Smartphones auf nicht näher definierte Weise Daten untereinander austauschen. Die Analogie zu der Wolke leitet sich dadurch ab, "
          "dass es für den Anwender gleichgültig und gewissermaßen “verschleiert” ist, auf welchem konkreten Rechner und mit welcher zugrundeliegenden Hardware die Daten abgelegt sind"
    ],

  ];

  final List<String> entries = <String>['A', 'B'];
  Map values= {'A':0, 'B':1};
  //for(var item in entries; counter++){}

  var index = 0;
  bool isOverview = false;
  var entryIndex = 0;
  String key;

  int qindex = 0;
  int qtotalScore = 0;

  void reset() {
    setState(() {
      qindex = 0;
      qtotalScore = 0;
    });
  }

  void antwort(int score) {
    setState(() {
      qtotalScore += score;
      qindex = qindex + 1;
    });
  }

  //Eine Seite weiter
  void antwortfw() {
    setState(() {
      index = index + 1;
    });
    print(index);
  }

  //Eine Seite zurück
  void antwortbw() {
    setState(() {
      if (index >= 1) {
        index = index - 1;
      }
    });
    print(index);
  }

  void nm() {
    setState(() {
      index = 0;
      reset();
    });
  }

  void toOverview() {
    setState(() {
      isOverview = !isOverview;
      reset();
    });
  }

  void toContent(){
    setState(() {
      isOverview = !isOverview;
      index = 0;
      entryIndex = values[key];
    });
  }

  @override
  Widget build(BuildContext context) {

    if (!isOverview) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Cloud-Computing"),
          ),
          body: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child : ListTile(
                      onTap: (){
                        key = entries[index];
                        toContent();
                      },
                      title: Text('Thema ${entries[index]}'),
                      leading: Icon(Icons.adjust_rounded),
                    )
                );
              }),
        ),
      );
    }

    if (isOverview) {
      return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Cloud-Computing"),
            ),
            body: index < 4
                ? Column(
                    children: <Widget>[
                      Text(text[entryIndex][index]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                              child: Text("<<Zurück"), onPressed: antwortbw),
                          RaisedButton(
                              child: Text("Weiter>>"), onPressed: antwortfw),
                        ],
                      ),
                      FlatButton(onPressed: toOverview, child: Text("Zur Übersicht"))
                    ],
                  )
                : Column(
                    children: <Widget>[
                      Quiz(qindex, qtotalScore, reset, antwort),
                      FlatButton(
                          onPressed: nm, child: Text("Lektion neu starten")),
                      FlatButton(
                          onPressed: toOverview, child: Text("Zur Übersicht"))
                    ],
                  )),
      );
    }
  }
}
