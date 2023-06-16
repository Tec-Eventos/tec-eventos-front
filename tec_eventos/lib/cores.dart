import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';




class Cores{
  late Color Branco;

  late Future<bool?> _modoEscuro;


  Cores(){
    _modoEscuro = GetCores();
    modoEscuro == true ? Branco = Color(0xFF000000) : Branco = Color(0xFFFaFaFa);
  }

  Future<bool?> GetCores() async{
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    final bool? modoEscuro = prefs.getBool('modo_escuro');

    if(modoEscuro == true || modoEscuro == false){
      return modoEscuro;
    }
    else{
      prefs.setBool("modoEscuro", false);
      return false;
    }
  }

  Future get modoEscuro => _modoEscuro;



  //Azul
  static Color AzulClaro = Color(0xff64B5F6);
  static Color AzulCinzento = Color(0xffBBDEFB);
  static Color AzulBebe = Color(0xffE3F2FD);
  static Color AzulEscuroPerfilOption = Color(0xff1976D2);
  static Color Azul42A5F5 = Color(0xff42A5F5);
  static Color Azul1E88E5 = Color(0xff1E88E5);
  static Color Azul45B0F0 = Color(0xff45B0F0);
  static Color Azul47BBEC = Color(0xff47BBEC);

  //Branco


  //Preto
  static Color Preto = Color(0xff000000);

  //Cinza
  static Color Cinza = Color(0xffB8B3AF);
  static Color Cinza_mais_escuro = Color(0xff4D4A4A);
  static Color Cinza_mais_claro = Color(0xffD1CFCF);

  //Cores do pódio
  static Color Bronze = Color(0xffCD7F32);
  static Color Amarelo = Color(0xffFFE533);

}