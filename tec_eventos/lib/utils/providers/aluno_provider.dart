import 'package:flutter/material.dart';

class AlunoProvider extends ChangeNotifier {
  String nomeAluno = "";
  String emailAluno = "";
  int rmAluno = 0;
  String senhaAluno = "";

  void acessarLogin(String nome, String email, int rMAluno, String senha) {
    nomeAluno = nome;
    emailAluno = email;
    rmAluno = rMAluno;
    senhaAluno = senha;

    notifyListeners();
  }
}
