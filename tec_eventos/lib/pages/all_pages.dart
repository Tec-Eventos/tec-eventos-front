import 'package:flutter/material.dart';
import 'package:tec_eventos/pages/acesso/login.dart';
import 'package:tec_eventos/pages/paginas_instituicao/page_configuracao_instituicao/page_configuracao_instituicao.dart';
import 'package:tec_eventos/pages/paginas_instituicao/page_estatisticas/page_estatisticas.dart';
import 'package:tec_eventos/pages/paginas_instituicao/page_principal_instituicao/page_principal_instituicao.dart';
import 'package:tec_eventos/widgets/Appbar/AppBarPaginaPrincipal/appbarpages.dart';
import 'package:tec_eventos/widgets/Drawer/drawer.dart';
import 'package:tec_eventos/widgets/bottomAppBar/bottom_appbar.dart';
import 'package:tec_eventos/pages/paginas_aluno/configuracoes/config.dart';
import 'package:tec_eventos/pages/paginas_aluno/notificacao_page/notification_page.dart';
import 'package:tec_eventos/pages/paginas_aluno/pag_eventos/eventos_page.dart';
import 'package:tec_eventos/pages/paginas_aluno/pag_principal/principal_page.dart';
import 'package:tec_eventos/pages/paginas_aluno/ranking_page/ranking.dart';

const List<Widget> listaPagesAlunos = [
  PrincipalPage(),
  EventosPage(),
  Ranking(),
  NotificationPage(),
  ConfigurationPage(),
];

const List<Widget> listaPagesInstituicao = [
  PrincipalPageInstituicao(),
  EventosPage(),
  PageEstatisticas(),
  NotificationPage(),
  PageConfiguracaoInstituicao(),
];

class AllPages extends StatefulWidget {
  AllPages({Key? key, required this.paginaAtual, this.tipoUser})
      : super(key: key);
  int paginaAtual;
  String? tipoUser;

  @override
  State<AllPages> createState() => _AllPagesState();
}

class _AllPagesState extends State<AllPages> {
  late PageController _pageController;
  //controle das páginas
  @override
  void initState() {
    _pageController = PageController(initialPage: widget.paginaAtual);
    widget.tipoUser = userType;
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
              itemCount: listaPagesAlunos.length,
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  widget.paginaAtual = index;
                });
              },
              itemBuilder: (context, index) {
                if (widget.tipoUser == "Aluno") {
                  return Paginas(paginas: listaPagesAlunos[index]);
                } else if (widget.tipoUser == "Instituição") {
                  return Paginas(paginas: listaPagesInstituicao[index]);
                } else {
                  return Container();
                }
              }),
        ),
        bottomNavigationBar: widget.tipoUser == "Aluno"
            ? BottomAppBarAluno(
                paginaAtual: widget.paginaAtual,
                pageController: _pageController)
            : widget.tipoUser == "Instituição"
                ? BottomAppBarInstituicao(
                    paginaAtual: widget.paginaAtual,
                    pageController: _pageController)
                : Container());
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
