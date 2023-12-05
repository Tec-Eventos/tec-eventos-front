import 'package:flutter/material.dart';
import 'package:tec_eventos/data/http/exceptions.dart';
import 'package:tec_eventos/data/models/instituicao_model.dart';
import 'package:tec_eventos/data/repositories/instituicao_repository.dart';

class InstStore {
  final IinstituicaoReposity repository;

  //variável reativa para o loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  //variável reativa para o state
  final ValueNotifier<List<InstituicaoModel>> stateInst =
      ValueNotifier<List<InstituicaoModel>>([]);

  //variável reativa para o erro
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  InstStore({required this.repository});

  Future getInst() async {
    isLoading.value = true;

    try {
      final result = await repository.getInstituicao();
      stateInst.value = result;
    } on NotFoundExceptionUrl catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }

    isLoading.value = false;
  }
}
