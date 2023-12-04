import 'dart:convert';

import 'package:tec_eventos/data/api.dart';
import 'package:tec_eventos/data/http/exceptions.dart';
import 'package:tec_eventos/data/http/http_client.dart';
import 'package:tec_eventos/data/models/events_model.dart';

abstract class IEventsReposity {
  Future<List<EventsModel>> getEvents();
}

class EventsRepository implements IEventsReposity {
  final IHttpClient client;

  EventsRepository({required this.client});

  @override
  Future<List<EventsModel>> getEvents() async {
    final response = await client.get(
      url: 'http://192.168.1.112:8080/aluno/21087',
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
