import 'package:flutter/material.dart';
import 'package:tec_eventos/widgets/Drawer/drawer.dart';
import 'package:tec_eventos/widgets/Perfil_user/informacao_perfil/perfil_descricao.dart';
import 'package:tec_eventos/widgets/Perfil_user/menu_perfil/eventos_participados.dart';
import 'package:tec_eventos/widgets/Perfil_user/menu_perfil/favoritos.dart';
import 'package:tec_eventos/widgets/Perfil_user/menu_perfil/medalhas.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';

List<Widget> listaInformacaoPerfil = const [
  EventosParticipadosOption(),
  MedalhasEventosParticipadosOption(),
  EventosFavoritosOption(),
];

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

int menu = 1;

class _PerfilState extends State<Perfil> {
  late PageController _pageController;
  int paginaAtual = 0;
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
      drawer: const DrawerPages(),
      backgroundColor: Cores.branco,
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                //Classe da appbar da página. Juntamente da descrição de perfil.PerfilDescricao(),
                const PerfilDescricao(),
              ],
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => _pageController.jumpToPage(paginaAtual = 0),
                      child: MenuPerfilOption(
                          isActive: paginaAtual == 0,
                          icon: Icons.school_outlined),
                    ),
                    GestureDetector(
                      onTap: () => _pageController.jumpToPage(paginaAtual = 1),
                      child: MenuPerfilOption(
                          isActive: paginaAtual == 1,
                          icon: Icons.workspace_premium_outlined),
                    ),
                    GestureDetector(
                      onTap: () => _pageController.jumpToPage(paginaAtual = 2),
                      child: MenuPerfilOption(
                          isActive: paginaAtual == 2,
                          icon: Icons.favorite_border),
                    )
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                    itemCount: listaInformacaoPerfil.length,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        paginaAtual = index;
                      });
                    },
                    itemBuilder: (context, index) =>
                        Paginas(pagina: listaInformacaoPerfil[index])),
              ),
            ],
          )),
    );
  }
}

class Paginas extends StatefulWidget {
  const Paginas({super.key, required this.pagina});

  final Widget pagina;

  @override
  State<Paginas> createState() => _PaginasState();
}

class _PaginasState extends State<Paginas> {
  @override
  Widget build(BuildContext context) {
    return widget.pagina;
  }
}

class MenuPerfilOption extends StatefulWidget {
  const MenuPerfilOption(
      {super.key, required this.isActive, required this.icon});

  final bool isActive;
  final IconData icon;

  @override
  State<MenuPerfilOption> createState() => _MenuPerfilOptionState();
}

class _MenuPerfilOptionState extends State<MenuPerfilOption> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: widget.isActive
              ? Cores.azulEscuroPerfilOption
              : Colors.transparent,
        ),
      )),
      child: Icon(widget.icon),
    );
  }
}

class EventosFavoritosOption extends StatefulWidget {
  const EventosFavoritosOption({super.key});

  @override
  State<EventosFavoritosOption> createState() => _EventosFavoritosOptionState();
}

class _EventosFavoritosOptionState extends State<EventosFavoritosOption> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tecnologia",
                style: TextStyle(
                    fontFamily: Fontes.raleway,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Favoritos(
                          imgEvento: "assets/evento1.png",
                          imgOrg: "assets/UnivemIMG.png"),
                      Favoritos(
                          imgEvento: "assets/evento1.png",
                          imgOrg: "assets/UnivemIMG.png"),
                      Favoritos(
                          imgEvento: "assets/evento1.png",
                          imgOrg: "assets/UnivemIMG.png"),
                      Favoritos(
                          imgEvento: "assets/evento1.png",
                          imgOrg: "assets/UnivemIMG.png"),
                      Favoritos(
                          imgEvento: "assets/evento1.png",
                          imgOrg: "assets/UnivemIMG.png"),
                      Favoritos(
                          imgEvento: "assets/evento1.png",
                          imgOrg: "assets/UnivemIMG.png"),
                    ],
                  )),
              Text(
                "Informação",
                style: TextStyle(
                    fontFamily: Fontes.raleway,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Favoritos(
                          imgEvento: "assets/evento1.png",
                          imgOrg: "assets/UnivemIMG.png"),
                      Favoritos(
                          imgEvento: "assets/evento1.png",
                          imgOrg: "assets/UnivemIMG.png"),
                      Favoritos(
                          imgEvento: "assets/evento1.png",
                          imgOrg: "assets/UnivemIMG.png"),
                      Favoritos(
                          imgEvento: "assets/evento1.png",
                          imgOrg: "assets/UnivemIMG.png"),
                      Favoritos(
                          imgEvento: "assets/evento1.png",
                          imgOrg: "assets/UnivemIMG.png"),
                      Favoritos(
                          imgEvento: "assets/evento1.png",
                          imgOrg: "assets/UnivemIMG.png"),
                    ],
                  )),
              Text(
                "Matemática",
                style: TextStyle(
                    fontFamily: Fontes.raleway,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Favoritos(
                          imgEvento: "assets/evento1.png",
                          imgOrg: "assets/UnivemIMG.png"),
                      Favoritos(
                          imgEvento: "assets/evento1.png",
                          imgOrg: "assets/UnivemIMG.png"),
                      Favoritos(
                          imgEvento: "assets/evento1.png",
                          imgOrg: "assets/UnivemIMG.png"),
                      Favoritos(
                          imgEvento: "assets/evento1.png",
                          imgOrg: "assets/UnivemIMG.png"),
                      Favoritos(
                          imgEvento: "assets/evento1.png",
                          imgOrg: "assets/UnivemIMG.png"),
                      Favoritos(
                          imgEvento: "assets/evento1.png",
                          imgOrg: "assets/UnivemIMG.png"),
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class MedalhasEventosParticipadosOption extends StatefulWidget {
  const MedalhasEventosParticipadosOption({super.key});

  @override
  State<MedalhasEventosParticipadosOption> createState() =>
      _MedalhasEventosParticipadosOptionState();
}

class _MedalhasEventosParticipadosOptionState
    extends State<MedalhasEventosParticipadosOption> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Medalhas(
            nomeEvento: "Univem NASA",
            organizacao: "Univem",
            posicao: "3°Lugar",
            imgOrg: "assets/UnivemIMG.png",
            corPodio: Cores.bronze),
        Medalhas(
            nomeEvento: "Univem NASA",
            organizacao: "Univem",
            posicao: "2°Lugar",
            imgOrg: "assets/UnivemIMG.png",
            corPodio: Cores.cinza),
        Medalhas(
            nomeEvento: "Univem NASA",
            organizacao: "Univem",
            posicao: "1°Lugar",
            imgOrg: "assets/UnivemIMG.png",
            corPodio: Cores.amarelo),
        Medalhas(
            nomeEvento: "Univem NASA",
            organizacao: "Univem",
            posicao: "9°Lugar",
            imgOrg: "assets/UnivemIMG.png",
            corPodio: Cores.azul45B0F0)
      ],
    );
  }
}

class EventosParticipadosOption extends StatefulWidget {
  const EventosParticipadosOption({super.key});

  @override
  State<EventosParticipadosOption> createState() =>
      _EventosParticipadosOptionState();
}

class _EventosParticipadosOptionState extends State<EventosParticipadosOption> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: const [
        EventosParticipados(
            imagem: "assets/UnivemIMG.png",
            nomeEvento: "Univem Nasa",
            descricao:
                "Aqui você terá todo o conhecimento dos trabalhos da NASA, juntamente de especialistas que estarão trabalhando conosco"),
        EventosParticipados(
            imagem: "assets/UnivemIMG.png",
            nomeEvento: "Univem Nasa",
            descricao:
                "Aqui você terá todo o conhecimento dos trabalhos da NASA, juntamente de especialistas que estarão trabalhando conosco"),
        EventosParticipados(
            imagem: "assets/UnivemIMG.png",
            nomeEvento: "Univem Nasa",
            descricao:
                "Aqui você terá todo o conhecimento dos trabalhos da NASA, juntamente de especialistas que estarão trabalhando conosco"),
      ],
    );
  }
}
