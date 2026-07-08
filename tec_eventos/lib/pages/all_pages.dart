import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tec_eventos/features/notifications/presentation/screens/notification_screen.dart';
import 'package:tec_eventos/features/ranking/presentation/screens/ranking_screen.dart';
import 'package:tec_eventos/features/profile/presentation/screens/config_instituicao_screen.dart';
import 'package:tec_eventos/features/profile/presentation/screens/config_screen.dart';
import 'package:tec_eventos/features/events/presentation/screens/principal_page_instituicao_screen.dart';
import 'package:tec_eventos/widgets/Appbar/AppBarPaginaPrincipal/appbarpages.dart';
import 'package:tec_eventos/widgets/Drawer/drawer.dart';
import 'package:tec_eventos/widgets/bottomAppBar/bottom_appbar_aluno.dart';
import 'package:tec_eventos/pages/paginas_aluno/pag_eventos/eventos_page.dart';
import 'package:tec_eventos/pages/paginas_aluno/pag_principal/principal_page.dart';
import 'package:tec_eventos/widgets/bottomAppBar/bottom_appbar_instituicao.dart';

const List<Widget> listaPagesAlunos = [
  PrincipalPage(),
  EventosPage(),
  RankingScreen(),
  NotificationScreen(),
  ConfigurationPage(),
];

const List<Widget> listaPagesInstituicao = [
  PrincipalPageInstituicao(),
  EventosPage(),
  NotificationScreen(),
  PageConfiguracaoInstituicao(),
];

/// Tela de roteamento e contêiner principal das abas do aluno e instituição.
class AllPages extends StatefulWidget {
  /// O índice inicial a ser exibido.
  final int paginaAtual;

  /// Construtor padrão.
  const AllPages({Key? key, required this.paginaAtual}) : super(key: key);

  @override
  State<AllPages> createState() => _AllPagesState();
}

class _AllPagesState extends State<AllPages> {
  late PageController _pageController;
  late int _paginaAtual;
  String? tipoUser;

  @override
  void initState() {
    super.initState();
    _paginaAtual = widget.paginaAtual;
    _pageController = PageController(initialPage: _paginaAtual);
    _getUserType().then((value) => setState(() {
          tipoUser = value.toString();
        }));
  }

  Future<String?> _getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userType');
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int qntdPages() {
    if (tipoUser == "Aluno") {
      return listaPagesAlunos.length;
    } else {
      return listaPagesInstituicao.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const DrawerPages(),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const AppBarPages(),
        ],
        body: PageView.builder(
          itemCount: qntdPages(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _paginaAtual = index;
            });
          },
          itemBuilder: (context, index) {
            if (tipoUser == "Aluno") {
              return Paginas(paginas: listaPagesAlunos[index]);
            } else if (tipoUser == "Instituição") {
              return Paginas(paginas: listaPagesInstituicao[index]);
            } else {
              return Container();
            }
          },
        ),
      ),
      bottomNavigationBar: tipoUser == "Aluno"
          ? BottomAppBarAluno(
              paginaAtual: _paginaAtual,
              pageController: _pageController,
            )
          : tipoUser == "Instituição"
              ? BottomAppBarInstituicao(
                  paginaAtual: _paginaAtual,
                  pageController: _pageController,
                )
              : Container(),
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
