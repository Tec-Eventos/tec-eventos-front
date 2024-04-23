import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tec_eventos/data/http/exceptions.dart';
import 'package:tec_eventos/data/http/http_client.dart';
import 'package:tec_eventos/data/models/instituicao_model.dart';

abstract class IinstituicaoReposity {
  Future<List<InstituicaoModel>> getInstituicao();
}

class InstituicaoRepository implements IinstituicaoReposity {
  final IHttpClient client;

  InstituicaoRepository({required this.client});

  @override
  Future<List<InstituicaoModel>> getInstituicao() async {

    final response = await client.get(
      url: 'https://api-tec-eventos-i6hr.onrender.com/',
    );

    if (response.statusCode == 200) {
      final List<InstituicaoModel> instituicaoInfo = [];

      final body = jsonDecode(response.body);

      body['data'].map((item) {
        final InstituicaoModel instituicao = InstituicaoModel.fromMap(item);

        instituicaoInfo.add(instituicao);
      }).toList();

      return instituicaoInfo;
    } else if (response.statusCode == 404) {
      throw NotFoundExceptionUrl("A url informada não é válida");
    } else {
      throw Exception("Não foi possível carregar os eventos");
    }
  }
}
