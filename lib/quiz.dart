import 'package:flutter/material.dart';
import 'quizperguntarespostas.dart';
import 'quizresultado.dart';
import 'pergunta.dart';
import 'resposta.dart';
  
class Quiz extends StatefulWidget {
  Quiz({Key key, this.perguntas}) : super(key: key);

  final List<Pergunta> perguntas;

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var _indicePergunta = 0;
  var _pontuacao = 0;

  void _reiniciarQuiz() {
    setState(() {
      _indicePergunta = 0;
      _pontuacao = 0;
    });
  }

  void _escolherResposta(Resposta resposta) { 
    _pontuacao += resposta.pontos;
  
    setState(() {
      _indicePergunta = _indicePergunta + 1;
    });
  }
  
  Widget quiz() {
    return _indicePergunta < widget.perguntas.length
      ? QuizPerguntaRespostas(
        escolherResposta: _escolherResposta,
        indicePergunta: _indicePergunta,
        perguntas: widget.perguntas,
      )
      : QuizResultado(_pontuacao, _reiniciarQuiz);
  }

  Widget switcherQuiz() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(child: child, scale: animation);
      },
      child: Padding(
        key: ValueKey<int>(_indicePergunta),
        padding: EdgeInsets.all(8.0),
        child: quiz(),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: switcherQuiz(),
    );
  }
}