import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tec_eventos/splash/splash.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent));
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
      home: Splash(),


    );
  }
}