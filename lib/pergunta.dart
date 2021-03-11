import 'resposta.dart';
import 'dart:convert';

class Pergunta {
  int numero;
  String texto;
  List<Resposta> respostas;

  Pergunta({this.numero, this.texto, this.respostas});

  Map<String, dynamic> toJson() {
    List<String> respostas = this.respostas != null 
      ? this.respostas.map((resposta) => respostaToJson(resposta)).toList() 
      : null;

    return {
      "numero": numero,
      "texto": texto,
      "respostas": respostas
    };
  }

  factory Pergunta.fromJson(Map<String, dynamic> json) {
    List<Resposta> respostasTraduzidasDoJson;

    if (json["respostas"] != null)
    {
      var respostasNoJson = json["respostas"] as List;
      respostasTraduzidasDoJson = respostasNoJson
        .map((respostaJson) => Resposta.fromJson(respostaJson)).toList();
    }

    return Pergunta(
      numero: json["numero"],
      texto: json["texto"],
      respostas: respostasTraduzidasDoJson,
    );
  }
}

Pergunta perguntaFromJson(String dados) => Pergunta.fromJson(json.decode(dados));
String perguntaToJson(Pergunta dados) => json.encode(dados.toJson());