import 'package:flutter/material.dart';


class Texte extends StatelessWidget {
  final text = [
    //1
    "Die Cloud-Technologie ist weiter auf dem Vormarsch: "
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
  ];

  final int seite;
  Texte(this.seite);

  @override
  Widget build(BuildContext context) {
    return Container(
      width : double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        text[seite],
        style: TextStyle(fontSize: 15),
        textAlign: TextAlign.center,
      ),
    );

  }
}

