import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tec_eventos/cores.dart';


class CardPendentes extends StatefulWidget {
  const CardPendentes({Key? key}) : super(key: key);

  @override
  State<CardPendentes> createState() => _CardPendentesState();
}

class _CardPendentesState extends State<CardPendentes> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
              style: GoogleFonts.raleway(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Cores.preto),
            ),
            title: Text("Evento, que vai acontecer ali e aqui",
                style: GoogleFonts.inter(
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
    );
  }
}