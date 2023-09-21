import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/paginas_aluno/pagamento/metodospagamento.dart';

class Inscrever extends StatelessWidget {
  const Inscrever({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: MetodosPagamento(),
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
            "Inscrever-se",
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
