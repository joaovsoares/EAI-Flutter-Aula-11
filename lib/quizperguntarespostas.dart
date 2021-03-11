import 'package:flutter/material.dart';
import 'pergunta.dart';
import 'quizresposta.dart';
import 'quizpergunta.dart';

class QuizPerguntaRespostas extends StatelessWidget {
  final List<Pergunta> perguntas;
  final int indicePergunta;
  final Function escolherResposta;

  QuizPerguntaRespostas({
    @required this.perguntas,
    @required this.escolherResposta,
    @required this.indicePergunta,
  });

  @override 
  Widget build(BuildContext context) {
    var children = <Widget>[];
    var pergunta = QuizPergunta(perguntas[indicePergunta]);
    var respostas = perguntas[indicePergunta]
      .respostas.map((resposta) => QuizResposta(() => escolherResposta(resposta), resposta)).toList();

    children.add(pergunta);
    children.addAll(respostas);

    return Column(
      children: children,
    );
  }
}