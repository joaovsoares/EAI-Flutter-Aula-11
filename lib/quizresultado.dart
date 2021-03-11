import 'package:flutter/material.dart';

class QuizResultado extends StatelessWidget {
  final int pontuacao;
  final Function reiniciarQuiz;

  QuizResultado(this.pontuacao, this.reiniciarQuiz);

  String get mensagemResultado { 
    String mensagem;

    if (pontuacao >= 41) {
      mensagem = 'Você é incrível!';
    }
    else if (pontuacao >= 31) {
      mensagem = 'Muito bom!';
    }
    else if (pontuacao >= 21) {
      mensagem = 'Você consegue mais!';
    }
    else if (pontuacao >= 1) {
      mensagem = 'Precisa estudar!';
    }
    else {
      mensagem = 'Errou tudo! Estude pra valer!';
    }

    return mensagem;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            mensagemResultado,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            'Pontuacao ' '$pontuacao',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Reiniciar Quiz!',
            ),
            textColor: Colors.blue,
            onPressed: reiniciarQuiz,
          ),
        ],
      ),
    );
  }
}