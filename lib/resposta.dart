import 'dart:convert';

class Resposta {
  String texto;
  bool correta;
  int pontos;

  Resposta({this.texto, this.correta, this.pontos});

  Map<String, dynamic> toJson() => {
    "texto": texto,
    "correta": correta,
    "pontos": pontos,
  };

  factory Resposta.fromJson(Map<String, dynamic> json) => Resposta(
    texto: json["texto"],
    correta: json["correta"],
    pontos: json["pontos"],
  );
}

Resposta respostaFromJson(String dados) => Resposta.fromJson(json.decode(dados));
String respostaToJson(Resposta dados) => json.encode(dados.toJson());