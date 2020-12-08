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
    // WAS IST CLOUD COMPUTING? DEFINITION
    [
      "Cloud Computing bedeutet, dass Daten nicht lokal, sondern auf entfernten Servern gespeichert werden."
          " IT-Dienstleistungen und IT-Ressourcen werden über das Internet bereitgestellt und sind in Echtzeit verfügbar. "
          "Hardware und Software muss dabei nicht mehr selbst gekauft und betrieben werden, sondern wird vermietet."
          " Vorteile hierbei sind mehr Flexibilität, Skalierbarkeit und niedrige Kosten, da eine eigene Serverstruktur entfällt.",
      "Eine Cloud heißt Cloud weil die dahinterliegenden Strukturen und die Server auf welchen die Daten liegen für den Nutzer unsichtbar und kaum von Bedeutung sind. "
          "Sozusagen ist dem Nutzer all das verhüllt wie bei einer Wolke oder in Englisch Cloud."
    ],
    //Vorteile von Cloud Computing
    [
      //Kosten
      "Beim Cloud Computing fallen keinerlei Investitionskosten für den Erwerb von Hardware und Software oder die"
        " Einrichtung und den Betrieb lokaler Rechenzentren an, die Serverracks, Stromversorgung und Kühlung rund "
        "um die Uhr sowie IT-Experten zur Verwaltung der Infrastruktur erforderlich machen. Da kommt schnell einiges zusammen.",
      //Geschwindigkeit
      "Da die meisten Cloud Computing-Dienste bedarfsgesteuert und als Self-Service-Angebote bereitgestellt werden,"
          " lassen sich selbst äußerst große Mengen an Computingressourcen innerhalb weniger Minuten bereitstellen."
          " Diese Bereitstellung erfolgt üblicherweise mit nur wenigen Mausklicks, sodass Unternehmen von großer Flexibilität "
          "profitieren und der mit der Kapazitätsplanung einhergehende Druck der Vergangenheit angehört.",
      //Globale Skalierung
      "Zu den Vorteilen von Cloud Computing-Diensten zählt u. a. die Möglichkeit einer elastischen Skalierung. "
          "Im Cloudkontext bedeutet das, die richtige Menge an IT-Ressourcen (beispielsweise eine höhere oder "
          "niedrigere Rechenleistung, Speicherkapazität oder Bandbreite) genau dann bereitzustellen, wenn sie "
          "benötigt wird – und zwar vom richtigen geografischen Standort aus.",
      //Produktivität
      "Lokale Rechenzentren gehen typischerweise mit einem erheblichen Einrichtungs- und Verwaltungsaufwand einher. "
          "Dazu zählen z.B. die Einrichtung von Hardware, das Aufspielen von Softwarepatches und andere zeitaufwändige "
          "IT-Verwaltungsaufgaben. Beim Cloud Computing müssen viele dieser Aufgaben nicht länger ausgeführt werden, "
          "sodass sich IT-Teams auf wichtigere Unternehmensziele konzentrieren können.",
      //Leistung
      "Die größten Cloud Computing-Dienste werden in einem globalen Netzwerk aus sicheren Datencentern ausgeführt,"
          " die regelmäßig auf die neueste Generation schneller und effizienter Computinghardware aktualisiert werden. "
          "Dieser Aufbau bietet gegenüber einem einzelnen Unternehmensdatencenter eine Reihe von Vorteilen, wie z. B. "
          "geringere Netzwerklatenzen für Anwendungen und größere Kostenersparnisse.",
      //Zuverlässigkeit
      "Mithilfe von Cloud Computing werden Datensicherung, Notfallwiederherstellung und Geschäftskontinuität vereinfacht und die zugehörigen "
          "Kosten gesenkt, da Daten an mehreren redundanten Standorten im Netzwerk des Cloudanbieters gespiegelt werden können.",
      //Sicherheit
      "Viele Cloudanbieter stellen zahlreiche Richtlinien, Technologien und Steuerelemente bereit, die die Sicherheit "
          "Ihrer Umgebungen insgesamt stärken und dazu beitragen, Ihre Daten, Apps und Infrastruktur vor potenziellen Bedrohungen zu schützen."
    ],
  ];




// Listen und dicts
  List<bool> trailings = [false, false];
  final headlines = [
    ["Definition", "Warum heißt es Cloud?"],
    ["Kosten", "Geschwindigkeit", "Globale Skalierung", "Produktivität", "Leistung", "Zuverlässigkeit", "Sicherheit"],
  ];
  final List<String> entries = <String>[
    'Was ist Cloud Computing',
    'Vorteile von Cloud Computing',
  ];
  Map values = {'Was ist Cloud Computing': 0, 'Vorteile von Cloud Computing': 1};
  List<String> assets = ["assets/cloud.jpg", "assets/vorteileCC.jpg"]; //ListTile
  List<List<String>> img = [["", ""], ["", "", "", "", "", "", ""]];

// Booleans
  bool isOverview = true;
  bool switcher = false;
  bool done = false;
  bool allDone = false;
  bool notAlreadyDone = true;

//Strings
  String quizAtOverview;
  String key;

// Integer
  int qindex = 0;
  int qtotalScore = 0;
  var index = 0;
  var entryIndex = 0;

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
    List tmp = [];
    setState(() {
      isOverview = !isOverview;
      reset();
      trailings[entryIndex] = true;
      for(bool item in trailings){
        if (item == false){
          done = false;
        }
        if(item == true){
          tmp.add(item);
          if(tmp.length==trailings.length){
            allDone = true;
          }
        }
      }
      tmp = [];
    });
  }

  void toDoneOverview(){
    setState(() {
      notAlreadyDone = false;
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
    if(allDone & notAlreadyDone){
      return MaterialApp(
          home: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text("Cloud-Computing"),
                backgroundColor: Colors.lightBlueAccent,
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(child: Text("Du hast es geschafft", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),),),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 90.0, 0.0, 0.0),
                    child: Image.network("https://media.giphy.com/media/Wvh1de6cFXcWc/giphy.gif"),
                  )
                ],
              ),
            floatingActionButton: FloatingActionButton(
                onPressed: toDoneOverview,
              child: Icon(Icons.keyboard_arrow_down_outlined)),
          ),
      );
    }

    else if (isOverview) {
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

    else if (!isOverview) {
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