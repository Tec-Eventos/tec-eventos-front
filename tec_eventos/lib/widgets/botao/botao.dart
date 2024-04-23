import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/paginas_instituicao/page_postar_evento/page_postar_evento.dart';

class Botao extends StatelessWidget {
  const Botao({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  child: const PagePostarEvento(),
                  type: PageTransitionType.bottomToTop));
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 61,
          decoration: BoxDecoration(
            border: Border.all(color: Cores.azul42A5F5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Container(
                width: 59,
                height: 61,
                decoration: BoxDecoration(
                    color: Cores.azul42A5F5,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5))),
                child: Icon(
                  Icons.add,
                  color: Cores.branco,
                  size: 33,
                ),
              ),
              const Spacer(),
              Text(
                "Adicionar evento",
                style: TextStyle(
                    fontFamily: Fontes.ralewayBold,
                    color: Cores.azul42A5F5,
                    fontSize: 27),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
