import 'package:flutter/material.dart';

class InstituicaoProvider extends ChangeNotifier {
  int cdEscolar = 0;
  String nomeInstituicao = "";
  String emailInstituicao = "";
  String senhaInstituicao = "";

  void acessarLogin(int codigoEscolar, String nome, String email) {
    cdEscolar = codigoEscolar;
    nomeInstituicao = nome;
    emailInstituicao = email;

    notifyListeners();
  }
}
