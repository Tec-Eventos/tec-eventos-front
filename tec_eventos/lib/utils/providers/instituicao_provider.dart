import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InstituicaoProvider extends ChangeNotifier {
  int? cdEscolar;
  String? nomeInstituicao;
  String? emailInstituicao;
  String? senhaInstituicao;

SharedPreferences _prefs;
  InstituicaoProvider(this._prefs) {
    // Chame a função para inicializar as variáveis a partir do SharedPreferences
    _inicializarVariaveis();
  }

  Future<void> acessarInfos(
    int codigoEscolar, String nome, String email) async {


    _prefs.setInt('cd_escolar', codigoEscolar);
    _prefs.setString('nome', nome);
    _prefs.setString('email', email);

    // Atualize as variáveis com os novos valores
    await _inicializarVariaveis();

    notifyListeners();
  }

  Future<void> _inicializarVariaveis() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Inicialize as variáveis com os valores armazenados no SharedPreferences
    cdEscolar = prefs.getInt('cd_escolar');
    nomeInstituicao = prefs.getString('nome');
    emailInstituicao = prefs.getString('email');
    senhaInstituicao = prefs.getString('senha');

    // Notifique os ouvintes após a inicialização
    notifyListeners();
  }
}