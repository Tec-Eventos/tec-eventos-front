import 'package:flutter/material.dart';

class Cores {
  // late Color Branco;
  //
  // late Future<bool?> _modoEscuro;
  //
  //
  // Cores(){
  //   _modoEscuro = GetCores();
  //   modoEscuro == true ? Branco = Color(0xFF000000) : Branco = Color(0xFFFaFaFa);
  // }
  //
  // Future<bool?> GetCores() async{
  //   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  //   final SharedPreferences prefs = await _prefs;
  //
  //   final bool? modoEscuro = prefs.getBool('modo_escuro');
  //
  //   if(modoEscuro == true || modoEscuro == false){
  //     return modoEscuro;
  //   }
  //   else{
  //     prefs.setBool("modoEscuro", false);
  //     return false;
  //   }
  // }
  //
  // Future get modoEscuro => _modoEscuro;
  //

  //Azul
  static Color azulClaro = const Color(0xff64B5F6);
  static Color azulCinzento = const Color(0xffBBDEFB);
  static Color azulBebe = const Color(0xffE3F2FD);
  static Color azulEscuroPerfilOption = const Color(0xff1976D2);
  static Color azul42A5F5 = const Color(0xff42A5F5);
  static Color azul1E88E5 = const Color(0xff1E88E5);
  static Color azul45B0F0 = const Color(0xff45B0F0);
  static Color azul47BBEC = const Color(0xff47BBEC);

  //Branco
  static Color branco = const Color(0xffFFFFFF);

  //Preto
  static Color preto = const Color(0xff000000);

  //Cinza
  static Color cinza = const Color(0xffB8B3AF);
  static Color cinzaMaisEscuro = const Color(0xff4D4A4A);
  static Color cinzaMaisClaro = const Color(0xffD1CFCF);
  static Color cinza6A6666 = const Color(0xff6A6666);
  //Cores do pódio
  static Color bronze = const Color(0xffCD7F32);
  static Color amarelo = const Color(0xffFFE533);

  //Verde
  static Color verde = Color(0xff137B02);

  //Vermelho
  static Color vermelho = Color(0xffE50F0F);
}
