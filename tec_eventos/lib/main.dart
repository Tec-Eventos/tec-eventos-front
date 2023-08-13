import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/splash/splash.dart';

void main() async {
  //runApp(const Splash(nextScreen: false,));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projeto Tec!Eventos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Splash(
        nextScreen: true,
      ),
    );
  }
}
