import 'package:flutter/services.dart';

class LeitorDeArquivo {
  static Map<String, String> arquivosCarregados = new Map<String, String>();

  static Future<String> carregar(String arquivo) async {
    if (arquivosCarregados[arquivo] == null)
      arquivosCarregados[arquivo] = await rootBundle.loadString(arquivo);

    return arquivosCarregados[arquivo];
  }
}