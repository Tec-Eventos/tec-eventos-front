
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/componentes/Appbar/appbar.dart';
import 'package:tec_eventos/componentes/Drawer/drawer.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/paginas/configuracoes/config.dart';
import 'package:tec_eventos/paginas/notificacao_page/notification_page.dart';
import 'package:tec_eventos/paginas/pag_eventos/eventos_page.dart';
import 'package:tec_eventos/paginas/pag_principal/principal_page.dart';
import 'package:tec_eventos/paginas/ranking_page/ranking.dart';

class AllPages extends StatefulWidget {
  const AllPages({Key? key}) : super(key: key);

  @override
  State<AllPages> createState() => _AllPagesState();
}

int paginaAtual = 0;

class _AllPagesState extends State<AllPages> {
  late PageController _pageController;

  //controle das páginas
  @override
  void initState() {
    _pageController = PageController(initialPage: paginaAtual);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer:
          //Drawer,ou seja, o menu que aparece quando clica no botão
          const DrawerPages(),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          //appbar, ou seja, parte superior
          const AppBarPages(),
        ],
        //aqui é o corpo da página, ou seja,
        //onde vai ficar o conteúdo dela, deixe ela dentro de um ListView com o Axis.vertical.
        body: PageView.builder(
            itemCount: lista_pages.length,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                paginaAtual = index;
              });
            },
            itemBuilder: (context, index) =>
                Paginas(paginas: lista_pages[index])),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(displayWidth / 50),
        height: 58,
        decoration: BoxDecoration(
          color: Cores.AzulCinzento,
          boxShadow: [
            BoxShadow(
              color: Cores.Preto.withOpacity(.1),
              blurRadius: 30,
              offset: Offset(0, 10),
            )
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 25,
              activeColor: Cores.Azul42A5F5,
              iconSize: 20,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Cores.Preto,
              tabs: [
                GButton(

                  icon: Icons.home_outlined,
                  text: 'Página Inicial',
                  textStyle: GoogleFonts.raleway(
                     fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Cores.Azul42A5F5
                  ),
                ),
                GButton(
                  icon: Icons.confirmation_num_outlined,
                  text: 'Eventos',
                  textStyle: GoogleFonts.raleway(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Cores.Azul42A5F5
                  ),
                ),
                GButton(
                  icon: Icons.workspace_premium_outlined,
                  text: 'Medalhas',
                  textStyle: GoogleFonts.raleway(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Cores.Azul42A5F5
                  ),
                ),
                GButton(
                  icon: Icons.notifications_none_outlined,
                  text: 'Notificação',
                  textStyle: GoogleFonts.raleway(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Cores.Azul42A5F5
                  ),
                ),

                GButton(
                  icon: Icons.settings_outlined,
                  text: 'Configurações',
                  textStyle: GoogleFonts.raleway(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Cores.Azul42A5F5
                  ),
                ),
              ],
              selectedIndex: paginaAtual,
              onTabChange: (index) {
                setState(() {
                  paginaAtual = index;
                  _pageController.jumpToPage(index);
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

List<String> nomesPages = [
  'Início',
  'Eventos',
  'Medalhas',
  'Notificações',
  'Configurações',
];


const List<Widget> lista_pages = [
  PrincipalPage(),
  EventosPage(),
  Ranking(),
  notification_page(),
  configuration_page(),
];


class Paginas extends StatefulWidget {
  const Paginas({Key? key, required this.paginas}) : super(key: key);

  final Widget paginas;

  @override
  State<Paginas> createState() => _PaginasState();
}

class _PaginasState extends State<Paginas> {
  @override
  Widget build(BuildContext context) {
    return widget.paginas;
  }
}

