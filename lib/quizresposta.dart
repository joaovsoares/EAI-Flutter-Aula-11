import 'package:flutter/material.dart';
import 'resposta.dart';

class QuizResposta extends StatelessWidget {
  final Function escolherResposta;
  final Resposta resposta;
  
  QuizResposta(this.escolherResposta, this.resposta);
  
  @override 
  Widget build(BuildContext context) {
    var texto = resposta.texto;

    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(texto),
        onPressed: escolherResposta,
      ),
    );
  }
}