import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tec_eventos/data/models/inscritos_evento_model.dart';
import 'package:http/http.dart' as http;

class InscritosRepository extends ChangeNotifier {
  List<InscritosEventosModel> _listPresenca = [];

  List<InscritosEventosModel> get listPresenca => _listPresenca;

  InscritosRepository() {
    _setupListPresencaTable();
    // _setupDadosListPresencaInscritos();
  }

  _setupDadosListPresencaInscritos(String cdEvento) async {
    String uri = 'https://api-tec-eventos-i6hr.onrender.com/listaPresenca/$cdEvento';

    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> participantesEvento = json['data'];

      participantesEvento.forEach((alunos) {
        final cdEvento = alunos['cd_evento'];
        final nome = alunos['nome'];
        final rmAluno = alunos['rm_aluno'];
      });
    }
  }

  _setupListPresencaTable() async {}
}
