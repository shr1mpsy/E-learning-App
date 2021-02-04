import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Quiz.dart';
import './Texte.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

Future<List<String>> getIsFav() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  List<String> getIsFav = await preferences.getStringList("isFav") ?? ["false","false","false"];
  return getIsFav;
}

setIsFav(index, change) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  List<String> newIsFav = await getIsFav();
  newIsFav[index] = change;
  await preferences.setStringList("isFav", newIsFav);
}

Future<List<String>> getFav() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  List<String> getFav = await preferences.getStringList("Fav") ?? [];
  return getFav;
}

setFav(action, sortedList, ind) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  List<String> newFav = await getFav();
  if(action){
    newFav = sortedList;
  }
  else{
    newFav.remove(newFav[ind]);
  }

  await preferences.setStringList("Fav", newFav);
}


class MyAppState extends State<MyApp> {
  MyAppState(){
    getFav().then((var values){
      favourites = values;
    }).whenComplete(() => print(favourites));
    getIsFav().then((var value){
      isFav = value;
    });
    for(int cindex = 0; cindex < contentEntries.length; cindex++){
      List tmp = [];
      for(int eindex = 0; eindex < entries[cindex].length; eindex++){
        tmp.add(entries[cindex][eindex]);
      }

      List tmp2 = [];
      for(int imgItem = 0; imgItem < assets[cindex].length; imgItem++){
        tmp2.add(assets[cindex][imgItem]);
      }

      itemList.add(
          Items(contentEntries[cindex], tmp, tmp2)
      );
    }
  }

  //Content
  List contentEntries = ["Cloud Computing", "Hacking", "AD"];
  List coursePictures = [
    "assets/cloud.jpg",
    "assets/cloud2.jpg",
    "assets/geschichteCC.jpg"
  ];
  Map contentValues = {"Cloud Computing": 0, "Hacking": 1, "AD": 2};
  int contentIndex = 0;


  Map fromCoursesToContentOverview() {
    setState(() {
      contentIndex = contentValues[key];
      isIntro = true;
      isContent = false;
      for (int i = 0; i < entries[contentIndex].length; i++) {
        values[entries[contentIndex][i]] = i;
      }
      _currentIndex = 1;
    });
    return values;
  }

  // Texte

// Listen und dicts

  //lokal
  List trailings = [
    [false, false, false, false, false, false, false],
    [],
    []
  ];

  //lokal
  final headlines = [
    [
      ["Definition", "Namensherkunft"],
      [
        "",
        "Kosten",
        "Geschwindigkeit",
        "Globale Skalierung",
        "Produktivität",
        "Leistung",
        "Zuverlässigkeit",
        "Sicherheit"
      ],
      [
        "Netzverbindung",
        "Wachsender Funktionsumfang",
        "Sicherheit",
        "Datenverlust durch die Cloud",
        "Abhängigkeit"
      ],
      ["", "Public Cloud", "Private Cloud", "Hybrid Cloud", "Multi Cloud"],
      ["", "IaaS", "PaaS", "Serverless Computing", "SaaS"],
      [
        "Historie",
        "Historie",
        "Historie",
        "Historie",
        "Historie",
        "Historie",
        "Historie",
        "Historie",
        "Historie"
      ],
      [
        "Einsatzmöglichkeiten von Cloud Computing",
        "Neue Apps und Services erstellen",
        "Speichern, Sichern und Wiederherstellen von Daten",
        "Audio- und Videostreams",
        "Bereitstellung von Software On Demand"
      ]
    ],
    [],
    []];

  //global
  final List entries = [
    [
      'Was ist Cloud Computing',
      'Vorteile von Cloud Computing',
      "Nachteile von Cloud Computing",
      "Verschiedene Arten von Cloud Computing",
      "Arten von Cloud Services",
      "Geschichte von Cloud Computing",
      "Einsatzmöglichkeiten von Cloud Computing"
    ],
    [],
    []];

  // Map um entryIndex zu bekommen //global
  Map values = Map();

  //Bilder für ListTile //global
  List assets = [
    [
      "assets/cloud.jpg",
      "assets/vorteileCC.jpg",
      "assets/nachteileCC.jpg",
      "assets/verschArtenCC.jpg",
      "assets/verschServiceCC.jpg",
      "assets/geschichteCC.jpg",
      "assets/moeglichkeitenCC.jpg"
    ],
    [],
    []];

  //Bilder für Content //lokal
  List img = [
    [
      ["", ""],
      ["assets/vorteileCC/fragezeichen.jpg", "assets/vorteileCC/coins.jpg", "assets/vorteileCC/speed.jpg", "assets/vorteileCC/scalierbar.jpg", "assets/vorteileCC/produktiv.jpg", "assets/vorteileCC/leistungen.jpg", "assets/vorteileCC/zuverl.jpg", "assets/vorteileCC/sicherheit.jpg"],
      ["", "", "", "", ""],
      ["", "", "", "", ""],
      ["", "", "", "", ""],
      ["", "", "", "", "", "", "", "", ""],
      ["", "", "", "", ""]
    ],
    [],
    []];

  //Liste für Inhaltsverzeichniss
  final List itemList = [];
  var isFav;
  List favourites = [];


// Booleans
  bool isOverview = true;
  bool switcher = false;
  bool done = false;
  bool allDone = false;
  bool notAlreadyDone = true;
  bool isIntro = false;
  bool isContent = true;
  bool description = false;
  bool startBuilding = false;
  bool alreadyStarted = true;

//Strings
  String quizAtOverview;
  String key;

// Integer
  int qindex = 0;
  int qtotalScore = 0;
  int index = 0;
  int entryIndex = 0;
  int _currentIndex = 1;

  void reset() {
    setState(() {
      qindex = 0;
      qtotalScore = 0;
    });
  }


  void resetCourse(){
    setState(() {
      for(int item = 0; item<trailings[contentIndex].length; item++){
        trailings[contentIndex][item] = false;
      }
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

  void start() {
    setState(() {
      isIntro = false;
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
      trailings[contentIndex][entryIndex] = true;
      for (bool item in trailings[contentIndex]) {
        if (item == false) {
          done = false;
        }
        if (item == true) {
          tmp.add(item);
          if (tmp.length == trailings[contentIndex].length) {
            allDone = true;

          }
        }
      }
      tmp = [];
    });
  }

  void toDoneOverview() {
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

  void toCourses() {
    setState(() {
      isContent = true;
      isIntro = false;
      // _currentIndex = 0;
    });
  }

  void fromContentTableToContent(ci, ei){
    setState(() {
      isContent = false;
      isOverview = false;
      isIntro = false;
      _currentIndex = 1;
      contentIndex = ci;//ci;
      entryIndex = ei;//ei;
      index = 0;
    });
  }

  void tip(){
    setState(() {
      _currentIndex=0;
      isContent = true;
      isIntro = false;
    });
  }

  void deleteCourse(ind){
    setState(() {
      int tmp = int.parse(favourites[ind]);
      favourites.remove(favourites[ind]);
      setFav(false, null, ind);
      isFav[tmp] = "false";
      setIsFav(tmp, "false");
    });
  }

  void getStarted(){
    setState(() {
      alreadyStarted = false;
    });
  }

  _buildExpandableContent(Items item, expIndex){
    List<Widget> columnContent = [];
    int asdf = 0;
    int i = 0;
    for (String content in item.contents){
      columnContent.add(
        ListTile(
          title: Text(content, style: new TextStyle(fontSize: 15.0),),
          leading: CircleAvatar(child: Image.asset(item.leading[i])),
          onTap: () {
            asdf = values[content];
            fromContentTableToContent(expIndex, asdf);
          },
        ),
      );
      i++;
    }
    return columnContent;
  }

  Widget favIcon(b){
    if(!b){
      return Icon(Icons.favorite_border);
    }
    else{
      return Icon(Icons.favorite, color: Colors.red,);
    }
  }

  //WIDGETS

  Widget picture(path) {
    if (path != "") {
      return Center(
          child: Image.asset(
            path,
            width: double.infinity,
            height: 100,
          ));
    } else {
      return Center();
    }
  }

  Widget myText(path) {
    return Text(
      path,
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black38),
    );
  }

  Widget headline(path) {
    if (path != ""){
      return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 20.0),
        child: Center(
            child: Text(
              path,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black54,
                  fontWeight: FontWeight.w900),
            )),
      );
    }
    else{
      return Text("\n");
    }
  }

  Widget switchTrailing(a) {
    if (a) {
      a = false;
      return Icon(Icons.check_circle_outline);
    }
    if (!a) {
      return Icon(Icons.radio_button_unchecked);
    }
  }

  Widget switchTrailingsCourses(a, b) {
    return IconButton(icon: favIcon(a == "true"), onPressed: (){
      setState(() {
        print(favourites);
        String replaceVal = "false";
        if(isFav[b]=="true"){
          replaceVal = "false";
          isFav[b] = replaceVal;
        }
        else{
          replaceVal = "true";
          isFav[b] = replaceVal;
        }
        setIsFav(b, replaceVal);
        if(isFav[b] == "true"){
          favourites.add("$b");
          print(favourites);
          favourites.sort();
          print(favourites);
         // for(int i; i<favourites.length; i++){
          //  favourites[i] = ""+ favourites[i];
          //}
          setFav(true, favourites, null);
        }
        else{
          favourites.remove("$b");
          setFav(false, null, b);
        }
      });
    });
  }

  Widget interfaceFAB(_currentIndex){
    if(_currentIndex == 0){
      if(!description){
        return null;
      }
      else{
        return null;
      }
    }
    if(_currentIndex==1){
      if(isContent){
        return null;
      }
      else if(isIntro){
        return FloatingActionButton(
          onPressed: start,
          child: Icon(Icons.keyboard_arrow_down),
          tooltip: "Los gehts!",
        );
      }
      else if(allDone & notAlreadyDone){
        return FloatingActionButton(
            onPressed: toDoneOverview,
            child: Icon(Icons.keyboard_arrow_down_outlined));
      }
      else if(isOverview){
        return null;
      }
      else if(!isOverview){
        if (index < text[contentIndex][entryIndex].length){
          return FloatingActionButton(
              onPressed: antwortfw,
              child: Icon(Icons.arrow_forward_ios_outlined));
        }
        else{
          return null;
        }
      }
    }
    else if(_currentIndex==2){
      return null;
    }
  }

  Widget interfaceAppBar(_currentIndex){
    if(_currentIndex==0){
      if(!description){
        return AppBar(
          title: Text("Kurse"),
          backgroundColor: Colors.lightBlueAccent,
        );
      }
      else{
        return AppBar(
          title: Text("Kursbeschreibung"),
          backgroundColor: Colors.lightBlueAccent,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.keyboard_arrow_down_sharp), onPressed: (){setState(() {description = false;});})
          ],
        );
      }
    }
    else if(_currentIndex==1){
      if(isContent){
        return AppBar(
          title: Text("Meine Kurse"),
          backgroundColor: Colors.lightBlueAccent,
        );
      }
      else if(isIntro){
        isOverview = true;
        entryIndex = 0;
        index = 0;
        return AppBar(
          title: Text(contentEntries[contentIndex]),
          backgroundColor: Colors.lightBlueAccent,
        );
      }
      else if (allDone & notAlreadyDone){
        return AppBar(
          title: Text(contentEntries[contentIndex]),
          backgroundColor: Colors.lightBlueAccent,
        );
      }
      else if(isOverview){
        return AppBar(
          title: Text(contentEntries[contentIndex]),
          backgroundColor: Colors.lightBlueAccent,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.keyboard_arrow_down),
              onPressed: toCourses,
              tooltip: "Zu den Kursen",),
            IconButton(icon: Icon(Icons.autorenew),
              onPressed: resetCourse,
              tooltip: "Kurs zurücksetzen",),
          ],
        );
      }
      else if(!isOverview){
        if (index < text[contentIndex][entryIndex].length){
          return AppBar(
            title: Text(contentEntries[contentIndex]),
            backgroundColor: Colors.lightBlueAccent,
          );
        }
        else{
          return AppBar(
            title: Text(contentEntries[contentIndex]),
            backgroundColor: Colors.lightBlueAccent,
          );
        }
      }
    }
    else if(_currentIndex==2){
      return AppBar(
        title: Text("Inhaltsverzeichnis"),
        backgroundColor: Colors.lightBlueAccent,
      );
    }
  }

  Widget interfaceBody(_currentIndex){
    if(_currentIndex == 0) {
      if(!description){
        return ListView.builder(
          padding: const EdgeInsets.all(18),
          itemCount: contentEntries.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: ListTile(
                    onTap: () {
                      key = contentEntries[index];
                      contentIndex = contentValues[key];
                      setState(() {
                        description = true;
                      });
                    },
                    tileColor: Colors.white,
                    title: Text('${contentEntries[index]}'),
                    leading: Image.asset(coursePictures[index]),
                    trailing: switchTrailingsCourses(isFav[index], index)//isfav[index]toStringList()
                ));
          },
        );
      }
      else{
        return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${contentEntries[contentIndex]}"),
                Text("Hier kommt die Kursbeschreibung hin.")
              ],
            )
        );
      }
    }
    else if(_currentIndex==1) {
      if(isContent){
        if(alreadyStarted){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  "Willkommen!",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
              ),
              Text("\n"),
              RaisedButton(
                elevation: 10.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                color: Colors.lightBlueAccent,
                child: Text("Starten"),
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                onPressed: getStarted,
              )
            ],
          );
        }
        else if(favourites.length == 0){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Füge erst deine Favoriten hinzu"),
                Text(""),
                RaisedButton(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.lightBlueAccent,
                  child: Text("Auswählen"),
                  textColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  onPressed: tip,
                )
              ],
            ),
          );
        }
        else{
          return ListView.builder(
              padding: const EdgeInsets.all(18),
              itemCount: favourites.length,
              itemBuilder: (BuildContext context, int favindex) {
                return Card(
                    child: ListTile(
                        onTap: () {
                          key = contentEntries[int.parse(favourites[favindex])];
                          fromCoursesToContentOverview();
                        },
                        tileColor: Colors.white,
                        title: Text("${contentEntries[int.parse(favourites[favindex])]}"),
                        leading: Image.asset("${coursePictures[int.parse(favourites[favindex])]}"),
                        trailing: IconButton(icon: Icon(Icons.delete), onPressed: () {deleteCourse(favindex);},)//IconButton
                    ));
              });
        }

      }
      else if (isIntro) {
        isOverview = true;
        entryIndex =0;
        index = 0;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                coursePictures[contentIndex],
                height: 310,
                width: 300,
              ),
            ),
            Text(
              contentEntries[contentIndex],
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            )
          ],
        );
        //floatingActionButtonLocation:
        //FloatingActionButtonLocation.centerDocked,
      }
      else if (allDone & notAlreadyDone) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "Du hast es geschafft",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 90.0, 0.0, 0.0),
              child: Image.network(
                  "https://media.giphy.com/media/Wvh1de6cFXcWc/giphy.gif"),
            )
          ],
        );
        //bottomNavigationBar: boNaBa("Lernen"),
      }
      else if (isOverview && favourites != null) {
        return ListView.builder(
            padding: const EdgeInsets.all(18),
            itemCount: entries[contentIndex].length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: ListTile(
                    onTap: () {
                      key = entries[contentIndex][index];
                      toContent();
                    },
                    tileColor: Colors.white,
                    title: Text('${entries[contentIndex][index]}'),
                    leading: Image.asset(assets[contentIndex][index]),
                    trailing: switchTrailing(trailings[contentIndex][index]),
                  ));
            });
        //bottomNavigationBar: boNaBa("Lernen"),
      }
      else if (!isOverview) {
        if (index < text[contentIndex][entryIndex].length) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    color: Colors.amber[20],
                    margin: EdgeInsets.all(19.0),
                    child: Column(
                      children: <Widget>[
                        picture(img[contentIndex][entryIndex][index]),
                        headline(headlines[contentIndex][entryIndex][index]),
                        myText(text[contentIndex][entryIndex][index]),
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
          );
          //bottomNavigationBar: boNaBa("Lernen"),
        }
        else {
          return Column(
            children: <Widget>[
              picture("assets/vorteileCC/fragezeichen.jpg"),
              Quiz(qindex, qtotalScore, reset, antwort, entryIndex,
                  contentIndex),
              FlatButton(onPressed: nm, child: Text("Lektion neu starten")),
              RaisedButton(
                  onPressed: toOverviewSwitcher, child: Text("Zur Übersicht"))
            ],
          );
          // bottomNavigationBar: boNaBa("Lernen"),
        }
      }
    }
    else if(_currentIndex==2){
      return ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, expandableIndex){
          return Container(
            //color: Colors.blue,
              child:ExpansionTile(
                title: Text(itemList[expandableIndex].title, style: TextStyle(fontSize: 18),),
                leading: Image.asset(coursePictures[expandableIndex]),
                children: <Widget>[
                  new Column(
                    children: _buildExpandableContent(itemList[expandableIndex], expandableIndex),
                  ),
                ],
              )
          );
        },
      );
    }
  }

  Widget boNaBa(){
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.school_sharp),
          label: "Alle Kurse",
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book_outlined),
          label: "Inhaltsverzeichnis",
          backgroundColor: Colors.blue,
        ),
      ],
      onTap: (indexBoNaBa){
        setState(() {
          _currentIndex = indexBoNaBa;
          if(isOverview){
            isContent = true;
          }

        });
      },
    );
  }

  @override

  Widget build(BuildContext context) {

      return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: interfaceAppBar(_currentIndex),
          body: interfaceBody(_currentIndex),
          floatingActionButton: interfaceFAB(_currentIndex),
          bottomNavigationBar: boNaBa(),
        ),
      );
    }
}

class Items{
  final String title;
  List contents = [];
  final List leading;

  Items(this.title, this.contents, this.leading);
}