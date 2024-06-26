import 'dart:collection';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:tec_eventos/data/models/inscritos_evento_model.dart';
import 'package:tec_eventos/data/repositories/inscritos_repository.dart';

class PresentesRepository extends ChangeNotifier {
  List<InscritosEventosModel> _lista = [
    
  ];
  // InscritosRepository inscritos;

  UnmodifiableListView<InscritosEventosModel> get lista =>
      UnmodifiableListView(_lista);

  saveAll(List<InscritosEventosModel> inscritos) {
    inscritos.forEach((inscritos) {
      if (!_lista.contains(inscritos)) _lista.add(inscritos);
    });

    notifyListeners();
  }

  remove(InscritosEventosModel inscrito) {
    _lista.remove(inscrito);
    notifyListeners();
  }
}
