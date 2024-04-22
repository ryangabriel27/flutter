import 'package:exemplo_persistencia_json/View/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Persistencia Json",
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
