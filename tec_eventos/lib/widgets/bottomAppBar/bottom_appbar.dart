import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';

class BottomAppBarAluno extends StatefulWidget {
  BottomAppBarAluno(
      {Key? key, required this.paginaAtual, required this.pageController})
      : super(key: key);

  int paginaAtual;
  PageController pageController;

  @override
  _BottomAppBarAlunoState createState() => _BottomAppBarAlunoState();
}

class _BottomAppBarAlunoState extends State<BottomAppBarAluno> {
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(displayWidth / 50),
      height: 58,
      decoration: BoxDecoration(
        color: Cores.azulCinzento,
        boxShadow: [
          BoxShadow(
            color: Cores.preto.withOpacity(.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          )
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.transparent,
            hoverColor: Colors.transparent,
            gap: 25,
            activeColor: Cores.azul42A5F5,
            iconSize: 20,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: Cores.preto,
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                text: 'Página Inicial',
                textStyle: TextStyle(
                    fontFamily: Fontes.raleway,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Cores.azul42A5F5),
              ),
              GButton(
                icon: Icons.confirmation_num_outlined,
                text: 'Eventos',
                textStyle: TextStyle(
                    fontFamily: Fontes.raleway,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Cores.azul42A5F5),
              ),
              GButton(
                icon: Icons.workspace_premium_outlined,
                text: 'Medalhas',
                textStyle: TextStyle(
                    fontFamily: Fontes.raleway,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Cores.azul42A5F5),
              ),
              GButton(
                icon: Icons.notifications_none_outlined,
                text: 'Notificação',
                textStyle: TextStyle(
                    fontFamily: Fontes.raleway,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Cores.azul42A5F5),
              ),
              GButton(
                icon: Icons.settings_outlined,
                text: 'Configurações',
                textStyle: TextStyle(
                    fontFamily: Fontes.raleway,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Cores.azul42A5F5),
              ),
            ],
            selectedIndex: widget.paginaAtual,
            onTabChange: (index) {
              setState(() {
                widget.paginaAtual = index;
                widget.pageController.jumpToPage(index);
              });
            },
          ),
        ),
      ),
    );
  }
}
