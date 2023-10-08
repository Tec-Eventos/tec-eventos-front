import 'package:flutter/material.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';

class PageListaParticipantes extends StatefulWidget {
  const PageListaParticipantes({super.key});

  @override
  State<PageListaParticipantes> createState() => _PageListaParticipantesState();
}

class _PageListaParticipantesState extends State<PageListaParticipantes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Cores.branco,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              size: 20,
              color: Cores.preto,
            ),
          ),
          title: Text(
            "LISTA",
            style: TextStyle(
              fontFamily: Fontes.raleway,
              fontWeight: FontWeight.w600,
              color: Cores.preto,
            ),
          ),
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: const Size(0, 50),
              child: Center(
                  child: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Cores.azul1565C0,
                    ),
                  ),
                ),
                child: Text(
                  "Participantes",
                  style: TextStyle(
                    fontFamily: Fontes.ralewayBold,
                    color: Cores.preto,
                    fontSize: 20,
                  ),
                ),
              ))),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: 300,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  Participantes(),
                  Participantes(),
                  Participantes(),
                  Participantes(),
                  Participantes(),
                ],
              ),
            ),
            const SizedBox(height: 50),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Cores.preto,
                ),
                foregroundColor: Cores.azul1565C0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_circle_outline,
                      color: Cores.preto,
                    ),
                  ),
                  Text(
                    "Iniciar Evento",
                    style: TextStyle(
                      fontFamily: Fontes.ralewayBold,
                      color: Cores.preto,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 50),
            Text(
              "Presenças Confirmadas",
              style: TextStyle(fontFamily: Fontes.ralewayBold, fontSize: 18),
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 300,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  PresencaConfirmada(),
                  PresencaConfirmada(),
                  PresencaConfirmada(),
                  PresencaConfirmada(),
                ],
              ),
            ),
          ],
        ));
  }
}

class Participantes extends StatelessWidget {
  const Participantes({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: 308,
        decoration: BoxDecoration(
            border: Border.all(
              color: Cores.preto,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          autofocus: true,
          dense: true,
          visualDensity: VisualDensity.comfortable,
          titleAlignment: ListTileTitleAlignment.center,
          leading: const CircleAvatar(
            backgroundImage: AssetImage("assets/imgPerfil.png"),
          ),
          title: Text(
            "André",
            style: TextStyle(
              color: Cores.preto,
              fontFamily: Fontes.raleway,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          subtitle: Text(
            "Desenvolvimento de Sistemas",
            style: TextStyle(
              color: Cores.preto,
              fontFamily: Fontes.raleway,
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}

class PresencaConfirmada extends StatelessWidget {
  const PresencaConfirmada({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: 328,
        decoration: BoxDecoration(
            border: Border.all(
              color: Cores.preto,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          autofocus: true,
          dense: true,
          visualDensity: VisualDensity.comfortable,
          titleAlignment: ListTileTitleAlignment.center,
          leading: const CircleAvatar(
            backgroundImage: AssetImage("assets/imgPerfil.png"),
          ),
          title: Text(
            "André",
            style: TextStyle(
              color: Cores.preto,
              fontFamily: Fontes.raleway,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          subtitle: Text(
            "Desenvolvimento de Sistemas",
            style: TextStyle(
              color: Cores.preto,
              fontFamily: Fontes.raleway,
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          ),
          trailing: Icon(
            Icons.check_rounded,
            size: 30,
            color: Cores.verde,
          ),
        ),
      ),
    );
  }
}
