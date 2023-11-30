import 'dart:collection';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:tec_eventos/models/inscritos_evento_model.dart';

class PresentesRepository extends ChangeNotifier {
  List<InscritosEventosModel> _lista = [];

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
