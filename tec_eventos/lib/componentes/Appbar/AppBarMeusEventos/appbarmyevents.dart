import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tec_eventos/cores.dart';

class AppBarMyEvents extends StatefulWidget {
  const AppBarMyEvents(
      {super.key, required this.pendentes, required this.concluidos});

  final Widget pendentes;
  final Widget concluidos;

  @override
  State<AppBarMyEvents> createState() => _AppBarMyEventsState();
}

class _AppBarMyEventsState extends State<AppBarMyEvents> {
  @override
  Widget build(BuildContext context) {
    // bool campo_pesquisa = true;
    return SliverAppBar(
      elevation: 0,
      floating: true,
      snap: true,
      backgroundColor: Colors.white,
      expandedHeight: 35,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: Cores.preto,
                size: 20,
              ));
        },
      ),
      title: Center(
        child: Text(
          "Meus Eventos",
          style: GoogleFonts.raleway(
              fontWeight: FontWeight.bold, fontSize: 22, color: Cores.preto),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 24,
              color: Cores.preto,
            ))
      ],
      bottom: PreferredSize(
          preferredSize: const Size.square(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              widget.pendentes,
              widget.concluidos,
            ],
          )),
    );
  }
}

class OptionMyEvents extends StatefulWidget {
  const OptionMyEvents(
      {Key? key, required this.icon, required this.nome, this.isActive = false})
      : super(key: key);

  final bool isActive;
  final IconData icon;
  final String nome;

  @override
  State<OptionMyEvents> createState() => _OptionMyEventsState();
}

class _OptionMyEventsState extends State<OptionMyEvents> {
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 50,
      width: displayWidth / 2,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: widget.isActive
                    ? Cores.azul42A5F5
                    : Cores.cinzaMaisClaro)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            size: 20,
            color: widget.isActive ? Cores.azul42A5F5 : Cores.preto,
          ),
          const SizedBox(width: 10),
          Text(
            widget.nome,
            style: GoogleFonts.raleway(
                fontSize: 17, fontWeight: FontWeight.bold, color: Cores.preto),
          )
        ],
      ),
    );
  }
}
