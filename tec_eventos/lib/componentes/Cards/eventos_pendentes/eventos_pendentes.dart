import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/paginas_aluno/pag_inscricao_evento/info_evento_pendentes/info_evento_pendente.dart';

class CardPendentes extends StatefulWidget {
  const CardPendentes({Key? key}) : super(key: key);

  @override
  State<CardPendentes> createState() => _CardPendentesState();
}

class _CardPendentesState extends State<CardPendentes> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: const InfoEventoPendentes(),
                type: PageTransitionType.bottomToTop));
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/evento1.png",
              fit: BoxFit.fitWidth,
              height: 166,
            ),
            ListTile(
              minVerticalPadding: 20,
              tileColor: Colors.transparent,
              leading: Text(
                "Mês  \n 17",
                style: TextStyle(
                  fontFamily: Fontes.raleway,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Cores.preto),
              ),
              title: Text("Evento, que vai acontecer ali e aqui",
                  style: TextStyle(
                      fontFamily: Fontes.inter,
                      fontSize: 18, fontWeight: FontWeight.w300)),
              trailing: GestureDetector(
                onTap: () {
                  // notificationButton = botaoIcone;
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  decoration: BoxDecoration(
                      color: Cores.branco,
                      border: Border.all(color: Cores.azul42A5F5),
                      borderRadius: BorderRadius.circular(100)),
                  child: IconButton(
                      onPressed: () {},
                      color: Cores.azul42A5F5,
                      icon: const Icon(Icons.notifications_none_outlined)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
