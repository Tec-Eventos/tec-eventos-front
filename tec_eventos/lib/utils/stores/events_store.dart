import 'package:flutter/material.dart';
import 'package:tec_eventos/data/http/exceptions.dart';
import 'package:tec_eventos/data/models/events_model.dart';
import 'package:tec_eventos/data/repositories/events_repository.dart';

class EventsStore {
  final IEventsReposity repository;

  //variável reativa para o loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  //variável reativa para o state
  final ValueNotifier<List<EventsModel>> state =
      ValueNotifier<List<EventsModel>>([]);

  //variável reativa para o erro
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  EventsStore({required this.repository});

  Future getEvents() async {
    isLoading.value = true;

    try {
      final result = await repository.getEvents();
      state.value = result;
    } on NotFoundExceptionUrl catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }

    isLoading.value = false;
  }
}
