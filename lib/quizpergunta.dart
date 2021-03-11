import 'package:flutter/material.dart';
import 'pergunta.dart'; 
  
class QuizPergunta extends StatelessWidget {
  final Pergunta pergunta;
  
  QuizPergunta(this.pergunta);
  
  @override
  Widget build(BuildContext context) {
    var texto = 'P${pergunta.numero}: ${pergunta.texto}';

    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(texto,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}