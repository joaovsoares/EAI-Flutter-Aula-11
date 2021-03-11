//pubspec.yaml
//  assets:
//    - assets/perguntas.json
import 'dart:convert';
import 'pergunta.dart';
import 'leitordearquivo.dart';

class PerguntaRepository {
  static const origemPerguntas = 'assets/perguntas.json';

  Future<List<Pergunta>> obter() async {
    var resultado = <Pergunta>[];   
    var perguntasJson = await LeitorDeArquivo.carregar(origemPerguntas);

    if (perguntasJson != null) {
      var perguntasJsonList = json.decode(perguntasJson) as List;
      resultado = perguntasJsonList 
        .map((perguntaJson) => Pergunta.fromJson(perguntaJson)).toList();  
    }

    return resultado;
  }
}