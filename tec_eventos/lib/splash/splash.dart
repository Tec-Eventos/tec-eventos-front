import 'dart:async';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tec_eventos/aluno_provider.dart';
import 'package:tec_eventos/pages/all_pages.dart';
import 'package:tec_eventos/pages/paginas_aluno/onBoarding/onboarding.dart';
import 'package:tec_eventos/pages/paginas_aluno/perfil/perfil.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    verificarUsuario().then((value) {
      if (value) {
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: AllPages(paginaAtual: 0),
                type: PageTransitionType.bottomToTop));
      } else {
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: const OnBoarding(),
                type: PageTransitionType.bottomToTop));
      }
    });

    // widget.nextScreen
    //     ? Timer(
    //         const Duration(seconds: 3),
    //         () => Navigator.pushReplacement(
    //             context, MaterialPageRoute(builder: (context) => OnBoarding())))
    //     : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            './assets/t!e_logo.png',
            height: 300,
            width: 300,
          ),
          const CircularProgressIndicator(),
        ],
      ),
    ));
  }

  Future<bool> verificarUsuario() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();

    if (sharedPreference.getString('token') == null &&
        sharedPreference.getString('userType') == null) {
      return false;
    } else {
      if (sharedPreference.getString('userType') == 'Aluno') {
        String? nomeKey = sharedPreference.getString('nome');
        String? emailKey = sharedPreference.getString('email');
        int? rmAlunoKey = sharedPreference.getInt('rm_aluno');

        Provider.of<AlunoProvider>(context, listen: false)
            .acessarLogin(nomeKey!, emailKey!, rmAlunoKey!, '');
      } else {}
      return true;
    }
  }
}
