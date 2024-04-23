import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tec_eventos/data/http/exceptions.dart';
import 'package:tec_eventos/data/http/http_client.dart';
import 'package:tec_eventos/data/models/events_model.dart';
import 'package:tec_eventos/utils/providers/aluno_provider.dart';

abstract class IEventsReposity {
  Future<List<EventsModel>> getEvents();
}

class EventsRepository implements IEventsReposity {
  final IHttpClient client;

  EventsRepository({required this.client});

  @override
  Future<List<EventsModel>> getEvents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final rmAluno = prefs.getInt('rm_aluno');
    final response = await client.get(
      url: 'https://api-tec-eventos-i6hr.onrender.com/aluno/events/$rmAluno',
    );

    if (response.statusCode == 200) {
      final List<EventsModel> eventos = [];

      final body = jsonDecode(response.body);

      body['data'].map((item) {
        final EventsModel evento = EventsModel.fromMap(item);

        eventos.add(evento);
      }).toList();

      return eventos;
    } else if (response.statusCode == 404) {
      throw NotFoundExceptionUrl("A url informada não é válida");
    } else {
      throw Exception("Não foi possível carregar os eventos");
    }
  }
}
