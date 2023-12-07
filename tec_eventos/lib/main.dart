import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tec_eventos/data/repositories/inscritos_repository.dart';
import 'package:tec_eventos/data/repositories/presentes_repository.dart';
import 'package:tec_eventos/utils/providers/aluno_provider.dart';
import 'package:tec_eventos/splash/splash.dart';
import 'package:provider/provider.dart';
import 'package:tec_eventos/utils/providers/instituicao_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  // Inicialize o SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AlunoProvider(prefs)),
      ChangeNotifierProvider(
          create: (context) => InstituicaoProvider(
              prefs) // Passe o SharedPreferences para o construtor
          ),
      ChangeNotifierProvider(create: (context) => InscritosRepository()),
      ChangeNotifierProvider(create: (context) => PresentesRepository()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // static final coresColorScheme = ColorScheme.fromSwatch(
  //     primarySwatch: Colors.amber, backgroundColor: Colors.purple);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projeto Tec!Eventos',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const Splash(),
    );
  }
}
