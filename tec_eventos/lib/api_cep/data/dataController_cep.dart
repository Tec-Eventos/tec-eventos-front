import 'dart:convert';

import 'package:tec_eventos/api_cep/data/api.dart';
import 'package:tec_eventos/api_cep/model/cepModel.dart';

class CepController {
  final api = API();

  Future<CEP?> getCEP(String cep) async {
    try {
      final response = await api.get("https://viacep.com.br/ws/${cep}/json/");
      print(response?.data.toString());
      if (response?.statusCode == 200) {
        return CEP.fromJson(json.decode(json.encode(response?.data)));
      }
    } catch (e) {
      rethrow;
    }
  }
}
