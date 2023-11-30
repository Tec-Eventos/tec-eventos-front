import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tec_eventos/repositories/inscritos_repository.dart';
import 'package:tec_eventos/repositories/presentes_repository.dart';
import 'package:tec_eventos/utils/providers/aluno_provider.dart';
import 'package:tec_eventos/splash/splash.dart';
import 'package:provider/provider.dart';
import 'package:tec_eventos/utils/providers/instituicao_provider.dart';

void main() async {
  //runApp(const Splash(nextScreen: false,));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AlunoProvider()),
      ChangeNotifierProvider(create: (context) => InstituicaoProvider()),
      ChangeNotifierProvider(create: (context) => PresentesRepository()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projeto Tec!Eventos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Splash(),
    );
  }
}
