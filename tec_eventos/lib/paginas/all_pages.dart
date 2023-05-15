import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/componentes/Appbar/appbar.dart';
import 'package:tec_eventos/componentes/Drawer/drawer.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/paginas/pag_eventos/eventos_page.dart';
import 'package:tec_eventos/paginas/pag_principal/principal_page.dart';

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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Cores.AzulCinzento,
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconeAssetIcon(
                isActive: 0 == paginaAtual,
                icone: "assets/Icons/home.png",
              ),
              Icone(
                isActive: 1 == paginaAtual,
                icone: Icons.confirmation_num_outlined,
              ),
              IconeAssetIcon(
                  isActive: 2 == paginaAtual,
                  icone: "assets/Icons/medalhas.png"),
              Icone(
                  isActive: 3 == paginaAtual,
                  icone: Icons.notifications_none_outlined),
              IconeAssetIcon(
                isActive: 4 == paginaAtual,
                icone: "assets/Icons/configuracao.png",
              )
            ],
          ),
        ),
      ),
    );
  }
}

//
// ImageIcon(
//   const AssetImage("assets/Icons/home.png")),
// Icon(Icons.confirmation_num_outlined,),
// ImageIcon(
//   const AssetImage("assets/Icons/medalhas.png"),),
//
// Icon(Icons.notifications_none_outlined,),
// ImageIcon(
//   const AssetImage("assets/Icons/configuracao.png"),
// ),

List<Widget> lista_pages = [
  PrincipalPage(),
  EventosPage(),
];

List<IconData> iconeGlobal = [
  Icons.notifications_none_outlined,
  Icons.ac_unit_rounded,
  Icons.access_alarm_outlined,
  Icons.accessible_forward_outlined,
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

//Indicador de qual etapa o usuário está
class Icone extends StatelessWidget {
  Icone({
    Key? key,
    this.isActive = false,
    required this.icone,
  }) : super(key: key);

  final bool isActive;
  final IconData icone;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icone,
            color: isActive ? Cores.Azul42A5F5 : Colors.black,
            size: 25,
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 100),
            height: isActive ? 2 : 0,
            width: isActive ? 9 : 0,
            decoration: BoxDecoration(
              color: isActive ? Cores.Azul42A5F5 : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
        ],
      ),
    );
  }
}

class IconeAssetIcon extends StatelessWidget {
  const IconeAssetIcon({
    Key? key,
    this.isActive = false,
    required this.icone,
  }) : super(key: key);

  final bool isActive;
  final String icone;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImageIcon(
            AssetImage(icone),
            color: isActive ? Cores.Azul42A5F5 : Colors.black,
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 100),
            height: isActive ? 2 : 0,
            width: isActive ? 9 : 0,
            decoration: BoxDecoration(
              color: isActive ? Cores.Azul42A5F5 : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
        ],
      ),
    );
  }
}
