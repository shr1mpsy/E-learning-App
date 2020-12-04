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
    // WAS IST CLOUD COMPUTING? DEFINITION
    [
      "Cloud Computing bedeutet, dass Daten nicht lokal, sondern auf entfernten Servern gespeichert werden."
      " IT-Dienstleistungen und IT-Ressourcen werden über das Internet bereitgestellt und sind in Echtzeit verfügbar. "
      "Hardware und Software muss dabei nicht mehr selbst gekauft und betrieben werden, sondern wird vermietet."
      " Vorteile hierbei sind mehr Flexibilität, Skalierbarkeit und niedrige Kosten, da eine eigene Serverstruktur entfällt."
    ]
  ];


  List<bool> trailings = [false, false, false];


  final headlines = [
    ["Allgemeines 1", "Allgemeines 2", "Allgemeines 3", "Allgemeines 4"],
    ["Kosten", "Geschwindigkeit", "Globale Skalierung", "Produktivität"],
    ["Definition"]
  ];

  final List<String> entries = <String>[
    'Allgemeines',
    'Vorteile von Cloud Computing',
    'Was ist Cloud Computing?'
  ];
  Map values = {'Allgemeines': 0, 'Vorteile von Cloud Computing': 1, 'Was ist Cloud Computing?': 2};

  var index = 0;
  bool isOverview = true;
  var entryIndex = 0;
  String quizAtOverview;
  String key;
  List<String> assets = ["assets/cloud.jpg", "assets/cloud2.jpg", "assets/cloud.jpg"];
  List<List<String>> img = [["assets/cloud.jpg", "assets/cloud2.jpg", "", ""], ["assets/cloud.jpg", "assets/cloud2.jpg", "", ""], ["assets/cloud.jpg"]];

  int qindex = 0;
  int qtotalScore = 0;
  bool switcher = false;
  bool done = false;

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
  }

  //Eine Seite zurück
  void antwortbw() {
    setState(() {
      if (index >= 1) {
        index = index - 1;
      }
    });
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
  void toOverviewSwitcher() {
    setState(() {
      isOverview = !isOverview;
      reset();
      trailings[entryIndex] = true;
      for(bool item in trailings){
        if (item == false){
          done = false;
        }
        else{

        }
      }
    });
  }

  void toContent() {
    setState(() {
      isOverview = !isOverview;
      index = 0;
      entryIndex = values[key];
    });
  }

  //WIDGETS

  Widget picture(path){
    if (path != ""){
      return Center(
          child :Image.asset(
            path,
            width: double.infinity,
            height: 100,
          )
      );
    }
    else{
      return Center();
    }
  }

  Widget myText(path){
    return Text(
      path,
      style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.black38),
    );
  }

  Widget headline(path){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 20.0),
      child: Center(
          child: Text(
            path,
            style: TextStyle(
                fontSize: 30,
                color: Colors.black54,
                fontWeight: FontWeight.w900
            ),
          )),
    );
  }

  Widget switchTrailing(a){
    if (a){
      a = false;
      return Icon(Icons.check_circle_outline);
    }
    if(!a){
      return Icon(Icons.radio_button_unchecked);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isOverview) {
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
                      trailing: switchTrailing(trailings[index]),
                    ));
              }),
        ),
      );
    }

    if (!isOverview) {
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
                    child: Column(
                      children: <Widget>[
                        picture(img[entryIndex][index]),
                        headline(headlines[entryIndex][index]),
                        myText(text[entryIndex][index]),
                      ],
                    )),
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
      } else {
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
                    onPressed: toOverviewSwitcher, child: Text("Zur Übersicht"))
              ],
            ),
          ),
        );
      }
    }
  }
}