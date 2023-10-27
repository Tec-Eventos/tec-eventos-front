import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tec_eventos/pages/paginas_aluno/onBoarding/onboarding.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key, required this.nextScreen}) : super(key: key);

  final bool nextScreen;

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    widget.nextScreen
        ? Timer(
            const Duration(seconds: 3),
            () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => OnBoarding())))
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
}
