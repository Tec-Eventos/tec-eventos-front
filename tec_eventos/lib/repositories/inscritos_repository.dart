import 'package:flutter/material.dart';
import 'package:tec_eventos/models/inscritos_evento_model.dart';

class InscritosRepository {
  static List<InscritosEventosModel> listPresenca = [
    InscritosEventosModel(
        cdEvento: 24571, nomeAluno: "Bielzinho", rmAluno: 21088),
    InscritosEventosModel(
        cdEvento: 24571, nomeAluno: "vielzinho", rmAluno: 31088)
  ];

  // List<InscritosEventosModel> get listPresenca => _listPresenca;

  // InscritosRepository() {
  //   _setupListPresencaTable();
  // }

  // _setupListPresencaTable() async{

  // }
}
