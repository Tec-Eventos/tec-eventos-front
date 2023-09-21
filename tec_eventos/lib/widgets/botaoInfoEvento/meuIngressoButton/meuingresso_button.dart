import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/paginas_aluno/meuIngresso/meu_ingresso.dart';

class MeuIngressoButton extends StatelessWidget {
  const MeuIngressoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: const MeuIngresso(),
                type: PageTransitionType.bottomToTop));
      },
      child: Container(
        height: 64,
        decoration: BoxDecoration(
            color: Cores.azul42A5F5,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15))),
        child: Center(
          child: Text(
            "Meu Ingresso",
            style: TextStyle(
                fontFamily: Fontes.raleway,
                fontSize: 29,
                fontWeight: FontWeight.bold,
                color: Cores.branco),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
