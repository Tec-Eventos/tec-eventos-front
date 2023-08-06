import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tec_eventos/componentes/Appbar/AppBarPaginaPrincipal/appbarpages.dart';
import 'package:tec_eventos/componentes/Drawer/drawer.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/paginas/configuracoes/config.dart';
import 'package:tec_eventos/paginas/notificacao_page/notification_page.dart';
import 'package:tec_eventos/paginas/pag_eventos/eventos_page.dart';
import 'package:tec_eventos/paginas/pag_principal/principal_page.dart';
import 'package:tec_eventos/paginas/ranking_page/ranking.dart';


const List<String> nomesPages = [
  'Início',
  'Eventos',
  'Medalhas',
  'Notificações',
  'Configurações',
];

const List<Widget> listaPages = [
  PrincipalPage(),
  EventosPage(),
  Ranking(),
  NotificationPage(),
  ConfigurationPage(),
];



class AllPages extends StatefulWidget {
  AllPages({Key? key, required this.paginaAtual}) : super(key: key);

  int paginaAtual;
  @override
  State<AllPages> createState() => _AllPagesState();
}

class _AllPagesState extends State<AllPages> {
  late PageController _pageController;
  //controle das páginas
  @override
  void initState() {
    _pageController = PageController(initialPage: widget.paginaAtual);
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
            itemCount: listaPages.length,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                widget.paginaAtual = index;
              });
            },
            itemBuilder: (context, index) =>
                Paginas(paginas: listaPages[index])),
      ),
      bottomNavigationBar: Container(
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
                  textStyle: GoogleFonts.raleway(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Cores.azul42A5F5),
                ),
                GButton(
                  icon: Icons.confirmation_num_outlined,
                  text: 'Eventos',
                  textStyle: GoogleFonts.raleway(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Cores.azul42A5F5),
                ),
                GButton(
                  icon: Icons.workspace_premium_outlined,
                  text: 'Medalhas',
                  textStyle: GoogleFonts.raleway(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Cores.azul42A5F5),
                ),
                GButton(
                  icon: Icons.notifications_none_outlined,
                  text: 'Notificação',
                  textStyle: GoogleFonts.raleway(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Cores.azul42A5F5),
                ),
                GButton(
                  icon: Icons.settings_outlined,
                  text: 'Configurações',
                  textStyle: GoogleFonts.raleway(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Cores.azul42A5F5),
                ),
              ],
              selectedIndex: widget.paginaAtual,
              onTabChange: (index) {
                setState(() {
                  widget.paginaAtual = index;
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
