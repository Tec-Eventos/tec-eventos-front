import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tec_eventos/data/repositories/inscritos_repository.dart';
import 'package:tec_eventos/data/repositories/presentes_repository.dart';
import 'package:tec_eventos/splash/splash.dart';
import 'package:provider/provider.dart' as legacy_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(ProviderScope(
    child: legacy_provider.MultiProvider(
      providers: [
        legacy_provider.ChangeNotifierProvider(create: (context) => InscritosRepository()),
        legacy_provider.ChangeNotifierProvider(create: (context) => PresentesRepository()),
      ],
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
