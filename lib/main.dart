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
    //Nachteile
    [
      "Sie brauchen dringen eine schnelle InternetverbindungEine entsprechende Bandbreite erhalten Sie allerdings nicht an jedem Standort."
          " Das hat zur Folge, dass sich unter Umständen Arbeitsprozesse verlangsamen.",
      "Sie müssen up to date bleiben und sich häufig wieder neu einarbeiten, da es immer neue Funktionen, Technologien und Updates gibt.",
      "Nutzen Sie Cloud-Dienste, geben Sie meist sehr persönliche Daten preis. Da die Server vieler Cloud-Anbieter im EU-Ausland liegen, "
          "greifen die Datenschutzgesetze des Heimatlandes.So riskieren Sie einen schlechteren Schutz Ihrer persönlichen Daten.",
      "Manchmal können Daten in der Cloud verloren gehen. Dies kann zum Beispiel durch eine Cyberattacke oder durch einen Stromausfall passieren."
      "Dies passiert aber ziemlich selten, da oft backups gemacht werden, um solchen Datenverlusten vorzubeugen.",
      "Dadurch, dass man auf Resourcen einer anderen Firma zugreift, macht man sich natürlich von dieser abhängig. "
          "Man muss dadurch also teilweise Preissteigerungen und andere Maßnahmen protestlos hinnehmen und es bleibt der Firma trotzdem ein potentielles Druckmittel gegen dich."
    ],
    //Arten von CC
    [
      "Nicht alle Clouds sind gleich, und nicht eine Art von Cloud Computing ist für jeden geeignet. Mehrere verschiedene Modelle, "
          "Typen und Services haben sich entwickelt, um die richtige Lösung für Ihre Bedürfnisse anzubieten. Zunächst müssen Sie "
          "die Art der Cloud Bereitstellung oder Cloud Computing Architektur festlegen, auf der Ihre Cloud Services implementiert "
          "werden sollen. Es gibt vier verschiedene Möglichkeiten, Cloud Services bereitzustellen: in einer Public Cloud, einer Private Cloud, einer Multi Cloud oder einer Hybrid Cloud.",
      "Public Clouds befinden sich im Besitz von Drittanbietern, die Computing Ressourcen wie Server und Speicher über das Internet "
          "bereitstellen. Linode ist ein Beispiel für eine Public Cloud. Bei einer Public Cloud wird die gesamte Hardware, Software und "
          "andere unterstützende Infrastruktur vom Cloud Provider verwaltet. Sie greifen auf diese Dienste zu und verwalten Ihr Konto über einen Webbrowser.",
      "Eine Private Cloud bezieht sich auf Cloud Computing Ressourcen, die ausschließlich von einem einzigen Unternehmen oder einer einzigen Organisation "
          "genutzt werden. Eine Private Cloud kann sich physisch im Rechenzentrum des Unternehmens vor Ort befinden. Einige Unternehmen bezahlen auch Drittanbieter "
          "für das Hosting ihrer privaten Cloud. Eine Private Cloud verwaltet die Services und die Infrastruktur in einem privaten Netzwerk.",
      "Die Hybrid Cloud bietet eine Kombination aus öffentlichen und privaten Clouds, die so miteinander vernetzt sind, "
          "dass Daten und Anwendungen zwischen ihnen ausgetauscht werden können. Hybride Clouds bieten Unternehmen eine größere Flexibilität bei der Skalierung und Bereitstellung.",
      "Multi Cloud bezeichnet eine Strategie, die zwei oder mehr Cloud Computing Services einsetzt. Multi Cloud Strategien bieten Redundanz und die Möglichkeit, "
          "verschiedene Cloud Services oder Funktionen von verschiedenen Anbietern auszuwählen. Multi Cloud Deployments können nützlich sein, um die Kosten für Testumgebungen "
          "zu kompensieren und internen Entwicklern mehr Leistung bei geringeren Kosten zu bieten."
    ],
    [
      "Die meisten Cloud Computing Services lassen sich in vier große Kategorien einteilen: Infrastructure as a Service (IaaS), Platform as a Service (PaaS), "
          "Serverless und Software as a Service (SaaS). Diese werden manchmal als 'Cloud Computing Stack' bezeichnet, weil sie aufeinander aufbauen. Ihre Eigenschaften "
          "und Unterschiede zu kennen macht es Ihnen einfacher, Ihre Geschäftsziele zu erreichen.",
      "Dies ist die grundlegendste Art von Cloud Computing Services. Mit Infastructure as a Service (IaaS) mieten Sie die komplette IT Infrastruktur - Server "
          "und virtuelle Maschinen (VMs), Speicher, Netzwerk und Betriebssysteme - von einem Cloud Provider auf Pay as you go-Basis. ",
      "Platform as a Service (PaaS) bezeichnet Cloud Computing-Dienste, die eine On-Demand-Umgebung für die Entwicklung, das Testen, "
          "die Bereitstellung und die Verwaltung von Softwareanwendungen bereitstellen. PaaS erleichtert Entwicklern die schnelle Erstellung von "
          "Web- oder mobilen Anwendungen, ohne sich um die Einrichtung oder Verwaltung der zugrunde liegenden Infrastruktur von Servern, Speicher, Netzwerken und Datenbanken kümmern zu müssen. ",
      "Ähnlich wie PaaS konzentriert sich Serverless Computing auf den Aufbau von App-Funktionen, ohne ständig Zeit mit der Verwaltung der dafür erforderlichen Server und "
          "Infrastruktur zu verbringen. Der Cloud-Anbieter übernimmt für Sie das Setup, die Kapazitätsplanung und das Servermanagement. Serverless-Architekturen sind "
          "hochgradig skalierbar und ereignisgesteuert und nutzen Ressourcen nur dann, wenn eine bestimmte Funktion benötigt wird oder ein bestimmter Trigger auftritt.",
      "Software as a Service(SaaS) ist eine Methode zur Bereitstellung von Softwareanwendungen über das Internet, bei Bedarf und in der Regel auf"
          " Abonnementbasis. Mit SaaS hosten und verwalten Cloud Anbieter die Softwareanwendung und die zugrunde liegende Infrastruktur und "
          "übernehmen alle Wartungsarbeiten, wie Software-Upgrades und Security Patching. Benutzer verbinden sich über das Internet mit der Anwendung, "
          "in der Regel mit einem Webbrowser auf ihrem Smartphone, Tablett oder PC. "
    ],
    //Historie
    [
      "•	Geschichte des Cloud Computing geht bis in die 1960er Jahre zurück. Damals entstanden die ersten Ideen, wie man bestimmte IT-Ressourcen wie zum Beispiel Rechenleistung und Anwendungen als gesammelte Utility einer breiten Masse zur Verfügung stellen kann.\n\n"
        "•	Erkenntnissen der Industriellen Revolution: Energie soll nicht überall erzeugt werden, wo man sie braucht, sondern Großanbieter verteilen die Energie nach Bedarf.",
      "•	technischen Voraussetzungen wie stabiles Internet und die multimandanten Fähigkeit von IT-Systemen waren noch nicht gegeben"
        "•	gab es die ersten Host-Systeme mit zentralen Terminals und Rechnern.\n\n"
        "•	Firma DATEV entstand in den 1960er Jahren.\n\n"
        "•	fungierten alle Dienstleistungen rechenzentrumsbasiert.\n\n",
      "•	umfassten Eingabe der Daten in Datenerfassungsgeräten vor Ort, Versand der Lochstreifen per Post zum Rechenzentrum (zunächst von IBM, dann seit 1969 eigenes Rechenzentrum) und Rücksendung der Auswertungen per Post an die Kanzlei.\n\n"
        "•	ersten Meilenstein in der Entwicklung: Firma Intel in den frühen 70er Jahren\n\n"
        "•	erste Serie von gefertigten Mikroprozessoren auf den Markt gebracht. : Grundstein für Computer für den Massenmarkt war gelegt.\n\n",
      "•	5 bis 6 Jahre später Gründung Apple und Microsoft : Initiatoren für den Heimcomputermarkt gelten.\n\n"
        "•	1981 ist die Firma IBM in den Markt eingestiegen: neuer Industriestandard entsteht\n\n"
        "•	wird der Prozessor von Intel und das Betriebssystem von Microsoft geliefert.\n\n"
        "•	Innerhalb dieser Unternehmen wurden die Computer dabei über das Ethernet, sprich Kabel, mit dem Server vernetzt\n\n"
        "•	PCs immer leistungsfähiger  ihnen auch gerechnet wurde und Daten verarbeitet warden\n\n",
      "•	Diese Arbeit teilten sich dann der PC und der Server = Prinzip nennt man auch Client-Server-Prinzip\n\n"
        "•	PCs Software installiert / Updates immer neu aufgespielt warden\n\n"
        "•	Bedeutet hohe Leistungsfähigkeit jedoch aber auch hohen Wartungsaufwand\n\n"
        "•	System funktionierte nur im Unternehmen jedoch nicht stanndortübergreifend\n\n"
        "•	Großer Durchbruch erst in den 90er Jahren\n\n",
      "•	1991: Freigabe des World Wide Web vom Schweizer Forschunginstitut CERN für die Öffentlichkeit  (Entwicklung durch Britischenj Physiker und Informatiker Tim Berners-Lee => entwickelte http auch HTML bildet Basis für Internet Boom\n \n"
        "•	Konzept befasste ebenfalls erster Web Browser, erste Website auch ersten Web Server dadurch ist das was noch 1960 fehltze um die Cloud umzusetzen jetzt real geworden\n\n"
        "•	Mit der beginnenden Virtualisierung folgte der erste Schritt in Richtung Cloud (auf einem anderen Gerät dargestellt)\n\n",
      "•	Im selben Zeitraum tauchte der Begriff Application Service Providing (ASP) auf. Bei ASP wurde auf einem zentralen Server für jeden User der PC simuliert\n\n"
        "•	Dadurch wird Client-Server-Prinzip standortsunabhängig braucht allerdingsenorme technische Ressourcen (bei 100 usern zum arbeiten brauchte man 100 mal installiertes windows) \n\n"
        "•	Asp scheiterte weil war nicht wirtschaftlich gut ( Begriff ist in Vergessenheit geraten)\n\n"
        "•	Ende der 90er Jahre entstand Multi-Tenant-Software-Architektur (ermöglicht es, dass eine Software von mehreren Unternehmen gleichzeitig über den Browser bedient werden kann, ohne das das Ausspähen von Daten der anderen möglich ist)\n\n",
      "•	CRM-Software Salesforce in den USA zunutze jedoch Deutschland war dagegen myfactory der große Pionier\n\n"
        "•	Unternehmen schnell von anderen abheben, da es zum einem eine höhere Flexibilität und zum anderen eine Abrechnung nach Nutzung gibt. Zudem konnten zum ersten Mal viele Unternehmen eine zentrale Software gleichzeitig nutzen\n\n"
        "•	Dadurch entstand der Cloud Boom (rasante Entwicklung)\n\n",
      "•	In den 2010er Jahren wird jeder IT-Service dank Cloud-Computing global und 24/7 nutzbar. So entstanden auf Basis dieser Technologie eine Vielzahl an Cloudlösungen, die unser aller Leben verändert haben.\n\n"
        "•	Trotzdem müssen noch einige Systeme weitergehend entwickelt werden, denn multimandantenfähigkeit, dass jede Lösung vollständig neu entwickelt werden muss.\n\n"
        "•	Natürlich ist das nicht alles. Denn die Geschichte des Cloud Computing schreibt sich von selbst weiter. Einen wichtigen Begriff, der damit im Zusammenhang steht, "
           "ist das Internet of Things. Hier kommunizieren Alltagsgeräte via Cloud miteinander und werden damit zu smarten Geräten.\n\n"
  ],
  //Einsatzmöglichkeiten
  [
    "Sie verwenden wahrscheinlich gerade Cloud Computing, auch wenn Ihnen das nicht bewusst ist. Sobald Sie einen Online Service nutzen, "
        "um E-Mails zu versenden, Dokumente zu bearbeiten, Filme oder Fernsehen zu schauen, Musik zu hören, zu spielen oder Bilder und "
        "andere Dateien zu speichern, ist wahrscheinlich Cloud Computing hinter den Kulissen aktiv. Die ältesten Cloud Computing Services "
        "sind kaum ein Jahrzehnt alt, aber eine Vielzahl von Unternehmen - von kleinen Start-ups über globale Konzerne bis hin zu Regierungsbehörden "
        "und gemeinnützigen Organisationen - nutzen die Technologie bereits aus einer Vielzahl von Gründen. Hier ein paar Beispiele was mit Cloud Computing möglich ist:",
    "Schnelle Erstellung, Bereitstellung und Skalierung von Web-, Mobile- und API-Anwendungen auf jeder Plattform. Greifen Sie auf die Ressourcen zu, die Sie benötigen,"
        " um alle Anforderungen an Leistung, Sicherheit und Compliance zu erfüllen.",
    "Schützen Sie Ihre Daten kostengünstig und effektiv, indem Sie Ihre Daten über das Internet an ein externes Cloud-Speichersystem übertragen, auf das von jedem Ort und jedem Gerät aus zugegriffen werden kann.",
    "Verbinden Sie sich mit Ihrem Publikum global, jederzeit und auf jedem Gerät mit hochauflösendem Video und Audio.",
    "Mit On-Demand-Software, auch bekannt als Software as a Service (SaaS), können Sie Ihren Kunden die neuesten Softwareversionen und Updates anbieten - jederzeit und überall."
  ]
  ];//s




// Listen und dicts
  List<bool> trailings = [false, false, false, false, false, false, false];//s
  final headlines = [
    ["Definition", "Warum heißt es Cloud?"],
    ["Kosten", "Geschwindigkeit", "Globale Skalierung", "Produktivität", "Leistung", "Zuverlässigkeit", "Sicherheit"],
    ["Netzverbindung", "Wachsender Funktionsumfang", "Sicherheit", "Datenverlust durch die Cloud", "Abhängigkeit"],
    ["", "Public Cloud", "Private Cloud", "Hybrid Cloud", "Multi Cloud"],
    ["","IaaS", "PaaS", "Serverless Computing", "SaaS"],
    ["Historie","Historie","Historie","Historie","Historie","Historie","Historie","Historie","Historie"],
    ["Einsatzmöglichkeiten von Cloud Computing","Neue Apps und Services erstellen", "Speichern, Sichern und Wiederherstellen von Daten", "Audio- und Videostreams", "Bereitstellung von Software On Demand"]
  ];//s
  final List<String> entries = <String>[
    'Was ist Cloud Computing',
    'Vorteile von Cloud Computing',
    "Nachteile von Cloud Computing",
    "Verschiedene Arten von Cloud Computing",
    "Arten von Cloud Services",
    "Geschichte von Cloud Computing",
    "Einsatzmöglichkeiten von Cloud Computing"
  ];//s
  Map values = {'Was ist Cloud Computing': 0, 'Vorteile von Cloud Computing': 1, "Nachteile von Cloud Computing": 2, "Verschiedene Arten von Cloud Computing": 3,
    "Arten von Cloud Services": 4, "Geschichte von Cloud Computing":5, "Einsatzmöglichkeiten von Cloud Computing":6};//s
  List<String> assets = ["assets/cloud.jpg", "assets/vorteileCC.jpg", "assets/nachteileCC.jpg", "assets/verschArtenCC.jpg", "assets/verschServiceCC.jpg", "assets/geschichteCC.jpg","assets/moeglichkeitenCC.jpg"]; //ListTile   //s
  List<List<String>> img = [["", ""], ["", "", "", "", "", "", ""], ["","","","",""], ["", "", "","", ""], ["","","","", ""], ["","","","","","","","",""], ["","","","",""]];//s

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