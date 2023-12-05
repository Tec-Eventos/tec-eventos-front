import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlunoProvider extends ChangeNotifier {
  String? nomeAluno;
  String? emailAluno;
  int? rmAluno;

  final SharedPreferences _prefs;
  AlunoProvider(this._prefs) {
    _inicializarVariaveis();
  }

  Future<void> acessarInfos(String nome, String email, int rMAluno) async {
    _prefs.setString('nome', nome);
    _prefs.setString('email', email);
    _prefs.setInt('rm_aluno', rMAluno);


    await _inicializarVariaveis();
    notifyListeners();
  }


  Future<void> _inicializarVariaveis() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();


    rmAluno = prefs.getInt('rm_aluno');
    nomeAluno = prefs.getString('nome');
    emailAluno = prefs.getString('email');


    notifyListeners();
  }
}
