import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tec_eventos/data/http/exceptions.dart';
import 'package:tec_eventos/data/http/http_client.dart';
import 'package:tec_eventos/data/models/events_model.dart';
import 'package:tec_eventos/data/models/inst_events_model.dart';
import 'package:tec_eventos/utils/providers/aluno_provider.dart';

abstract class IInstEventsReposity {
  Future<List<InstituicaoEventsModel>> getEventsInst();
}

class InstEventsRepository implements IInstEventsReposity {
  final IHttpClient client;

  InstEventsRepository({required this.client});

  @override
  Future<List<InstituicaoEventsModel>> getEventsInst() async {
    final response = await client.get(
      url: 'https://api-tec-eventos-i6hr.onrender.com/escola/events/28060903',
    );

    if (response.statusCode == 200) {
      final List<InstituicaoEventsModel> instEventos = [];

      final body = jsonDecode(response.body);

      body['data'].map((item) {
        final InstituicaoEventsModel eventoInst =
            InstituicaoEventsModel.fromMap(item);

        instEventos.add(eventoInst);
      }).toList();

      return instEventos;
    } else if (response.statusCode == 404) {
      throw NotFoundExceptionUrl("A url informada não é válida");
    } else {
      throw Exception("Não foi possível carregar os eventos");
    }
  }
}
