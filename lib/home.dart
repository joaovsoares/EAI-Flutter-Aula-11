import 'package:flutter/material.dart';
import 'quizinit.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  AppBar appBar(String titulo) {
    return AppBar(
        title: Text(titulo),
      );
  }

  Widget quiz() {
    return QuizInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title),
      //drawer: Drawer(),
      body: quiz()
    );
  }
}
