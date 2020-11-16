import 'package:flutter/material.dart';
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
      "Kosten: Beim Cloud Computing fallen keinerlei Investitionskosten für den Erwerb von Hardware und Software oder die Einrichtung und den Betrieb lokaler Rechenzentren an,"
          " die Serverracks, Stromversorgung und Kühlung rund um die Uhr sowie IT-Experten zur Verwaltung der Infrastruktur erforderlich machen."
          " Da kommt schnell einiges zusammen.",
      //2
      "Geschwindigkeit: Da die meisten Cloud Computing-Dienste bedarfsgesteuert und als Self-Service-Angebote bereitgestellt werden,"
          " lassen sich selbst äußerst große Mengen an Computingressourcen innerhalb weniger Minuten bereitstellen."
          " Diese Bereitstellung erfolgt üblicherweise mit nur wenigen Mausklicks, sodass Unternehmen von großer Flexibilität profitieren"
          " und der mit der Kapazitätsplanung einhergehende Druck der Vergangenheit angehört.",
      //3
      "Globale Skalierung: Zu den Vorteilen von Cloud Computing-Diensten zählt u. a. die Möglichkeit einer elastischen Skalierung."
          " Im Cloudkontext bedeutet das, die richtige Menge an IT-Ressourcen (beispielsweise eine höhere oder niedrigere Rechenleistung, Speicherkapazität oder Bandbreite)"
          " genau dann bereitzustellen, wenn sie benötigt wird – und zwar vom richtigen geografischen Standort aus.",
      //4
      "Produktivität: Lokale Rechenzentren gehen typischerweise mit einem erheblichen Einrichtungs- und Verwaltungsaufwand einher."
          " Dazu zählen z.B. die Einrichtung von Hardware, das Aufspielen von Softwarepatches und andere zeitaufwändige IT-Verwaltungsaufgaben."
          " Beim Cloud Computing müssen viele dieser Aufgaben nicht länger ausgeführt werden, sodass sich IT-Teams auf wichtigere Unternehmensziele konzentrieren können."
    ],
  ];

  final List<String> entries = <String>[
    'Allgemeines',
    'Vorteile von Cloud Computing'
  ];
  Map values = {'Allgemeines': 0, 'Vorteile von Cloud Computing': 1};

  var index = 0;
  bool isOverview = false;
  var entryIndex = 0;
  String quizAtOverview;
  String key;
  List<String> assets = ["assets/cloud.jpg", "assets/cloud2.jpg"];

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

  void toContent() {
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
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Cloud-Computing"),
            backgroundColor: Colors.lightBlueAccent,
          ),
          body: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: ListTile(
                  onTap: () {
                    key = entries[index];
                    toContent();
                  },
                  tileColor: Colors.white,
                  title: Text('${entries[index]}'),
                  leading: Image.asset(assets[index]),
                ));
              }),
        ),
      );
    }

    if (isOverview) {
      if (index < text[entryIndex].length) {
        return MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text("Cloud-Computing"),
              backgroundColor: Colors.lightBlueAccent,
            ),
            body: Column(
              children: <Widget>[
                Container(
                  color: Colors.amber[20],
                  margin: EdgeInsets.all(19.0),
                    child: Text(
                      text[entryIndex][index],
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black38
                      ),
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                        onPressed: antwortbw,
                        child: Text(
                          "Zurück",
                          style: TextStyle(
                              fontSize: 12, color: Colors.lightBlueAccent),
                        )),
                    FlatButton(
                        onPressed: toOverview,
                        child: Text(
                          "Zur Übersicht",
                          style: TextStyle(
                              fontSize: 12, color: Colors.lightBlueAccent),
                        ))
                  ],
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: antwortfw,
                child: Icon(Icons.arrow_forward_ios_outlined)),
          ),
        );
      }
      else {
        return MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text("Cloud-Computing"),
              backgroundColor: Colors.lightBlueAccent,
            ),
            body: Column(
              children: <Widget>[
                Quiz(qindex, qtotalScore, reset, antwort, entryIndex),
                FlatButton(onPressed: nm, child: Text("Lektion neu starten")),
                RaisedButton(
                    onPressed: toOverview, child: Text("Zur Übersicht"))
              ],
            ),
          ),
        );
      }
    }
  }
}




/* FIRST VERSION!
    if (isOverview) {
      return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text("Cloud-Computing"),
              backgroundColor: Colors.lightBlueAccent,
            ),
            body: index < text[entryIndex].length
                ? Column(
                    children: <Widget>[
                      Text(text[entryIndex][index]),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                              child: Text("<<Zurück"), onPressed: antwortbw),
                          RaisedButton(
                              child: Text("Weiter>>"), onPressed: antwortfw),
                        ],
                      ),
                      RaisedButton(onPressed: toOverview, child: Text("Zur Übersicht"))
                    ],
                  )
                : Column(
                    children: <Widget>[
                      Quiz(qindex, qtotalScore, reset, antwort, entryIndex),
                      FlatButton(
                          onPressed: nm, child: Text("Lektion neu starten")),
                      RaisedButton(
                          onPressed: toOverview, child: Text("Zur Übersicht"))
                    ],
                  )),
      );
    }
  }
}
END
 */
