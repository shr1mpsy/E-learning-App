import 'package:flutter/material.dart';
//import './Quiz.dart';

class Frage extends StatelessWidget {
  final String fragentext;
  Frage(this.fragentext);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        fragentext,
        style: TextStyle(fontSize: 15),
        textAlign: TextAlign.center,
      ),
    );
  }
}
