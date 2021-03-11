import 'package:flutter/material.dart';
import 'perguntarepository.dart';
import 'quiz.dart';

class QuizInit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var repository = new PerguntaRepository();

    return FutureBuilder(
      future: repository.obter(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Quiz(perguntas: snapshot.data);
          }
          else if (snapshot.hasError) {
            return Center(
              child: Text('Ocorreu um erro na leitura das perguntas!'),
            );
          }
          else {
            return Center(
              child: Text('Nenhuma pergunta encontrada!'),
            );
          }
        }
        else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }
}