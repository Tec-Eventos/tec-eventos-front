import 'package:flutter/material.dart';
import 'package:tec_eventos/data/http/exceptions.dart';
import 'package:tec_eventos/data/models/events_model.dart';
import 'package:tec_eventos/data/models/inst_events_model.dart';
import 'package:tec_eventos/data/repositories/events_repository.dart';
import 'package:tec_eventos/data/repositories/inst_events_repository.dart';
import 'package:tec_eventos/data/repositories/instituicao_repository.dart';

class InstEventsStore {
  final IInstEventsReposity repository;

  //variável reativa para o loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  //variável reativa para o state
  final ValueNotifier<List<InstituicaoEventsModel>> state =
      ValueNotifier<List<InstituicaoEventsModel>>([]);

  //variável reativa para o erro
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  InstEventsStore({required this.repository});

  Future getEventsInst() async {
    isLoading.value = true;

    try {
      final result = await repository.getEventsInst();
      state.value = result;
      print("Esse é o estado: ${state.value}");
    } on NotFoundExceptionUrl catch (e) {
      print("Esse é o erro:  ${erro.value}");
      erro.value = e.message;
    } catch (e) {
      print(state.value);
      print("Esse é o erro:  ${erro.value}");
      erro.value = e.toString();
    }

    isLoading.value = false;
  }
}
