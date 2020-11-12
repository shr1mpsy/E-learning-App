import 'package:flutter/material.dart';
import 'outsources.dart';
import './Quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var index = 0;

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

  void nm(){
    setState(() {
      index = 0;
      reset();
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Cloud-Computing"),
          ),
          body: index < 4
              ? Column(
                  children: <Widget>[
                    Texte(index),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(child: Text("<<Zurück"), onPressed: antwortbw),
                        RaisedButton(child: Text("Weiter>>"), onPressed: antwortfw),
                      ],
                    ),
                  ],
                )

              : Column(
                  children: <Widget>[
                  Quiz(qindex, qtotalScore, reset, antwort),
                  FlatButton(onPressed: nm, child: Text("Lektion neu starten"))
                  ],
                )
      ),
    );
  }
}
