import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/core/theme/fontes.dart';
import 'package:tec_eventos/widgets/Drawer/drawer.dart';
import 'package:tec_eventos/widgets/Perfil_user/informacao_perfil/perfil_descricao.dart';
import 'package:tec_eventos/widgets/Perfil_user/menu_perfil/eventos_participados.dart';
import 'package:tec_eventos/widgets/Perfil_user/menu_perfil/favoritos.dart';
import 'package:tec_eventos/widgets/Perfil_user/menu_perfil/medalhas.dart';

const List<Widget> listaInformacaoPerfil = [
  EventosParticipadosOption(),
  MedalhasEventosParticipadosOption(),
  EventosFavoritosOption(),
];

/// Tela de visualização do Perfil do Aluno/Usuário.
///
/// Apresenta o cabeçalho descritivo com o [PerfilDescricao] e abas deslizantes
/// para visualizar eventos participados, medalhas conquistadas e favoritos.
class ProfileScreen extends ConsumerStatefulWidget {
  /// Construtor da tela de perfil.
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  late PageController _pageController;
  int paginaAtual = 0;

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
          const PerfilDescricao(),
        ],
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _pageController.jumpToPage(0);
                      setState(() {
                        paginaAtual = 0;
                      });
                    },
                    child: MenuPerfilOption(
                      isActive: paginaAtual == 0,
                      icon: Icons.school_outlined,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _pageController.jumpToPage(1);
                      setState(() {
                        paginaAtual = 1;
                      });
                    },
                    child: MenuPerfilOption(
                      isActive: paginaAtual == 1,
                      icon: Icons.workspace_premium_outlined,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _pageController.jumpToPage(2);
                      setState(() {
                        paginaAtual = 2;
                      });
                    },
                    child: MenuPerfilOption(
                      isActive: paginaAtual == 2,
                      icon: Icons.favorite_border,
                    ),
                  ),
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
                itemBuilder: (context, index) => listaInformacaoPerfil[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Aba individual ou opção de menu do Perfil.
class MenuPerfilOption extends StatelessWidget {
  /// Define se esta aba está selecionada e ativa na tela.
  final bool isActive;

  /// O ícone exibido na aba.
  final IconData icon;

  /// Construtor padrão da opção de menu.
  const MenuPerfilOption({
    super.key,
    required this.isActive,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isActive ? Cores.azulEscuroPerfilOption : Colors.transparent,
            width: 2.0,
          ),
        ),
      ),
      child: Icon(
        icon,
        color: isActive ? Cores.azulEscuroPerfilOption : Colors.black54,
        size: 26,
      ),
    );
  }
}

/// Widget exibido na aba de Eventos Participados.
class EventosParticipadosOption extends StatefulWidget {
  const EventosParticipadosOption({super.key});

  @override
  State<EventosParticipadosOption> createState() => _EventosParticipadosOptionState();
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
              "Aqui você terá todo o conhecimento dos trabalhos da NASA, juntamente de especialistas que estarão trabalhando conosco",
        ),
        EventosParticipados(
          imagem: "assets/UnivemIMG.png",
          nomeEvento: "Univem Nasa",
          descricao:
              "Aqui você terá todo o conhecimento dos trabalhos da NASA, juntamente de especialistas que estarão trabalhando conosco",
        ),
        EventosParticipados(
          imagem: "assets/UnivemIMG.png",
          nomeEvento: "Univem Nasa",
          descricao:
              "Aqui você terá todo o conhecimento dos trabalhos da NASA, juntamente de especialistas que estarão trabalhando conosco",
        ),
      ],
    );
  }
}

/// Widget exibido na aba de Medalhas Conquistadas.
class MedalhasEventosParticipadosOption extends StatefulWidget {
  const MedalhasEventosParticipadosOption({super.key});

  @override
  State<MedalhasEventosParticipadosOption> createState() => _MedalhasEventosParticipadosOptionState();
}

class _MedalhasEventosParticipadosOptionState extends State<MedalhasEventosParticipadosOption> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: const [
        Medalhas(
          nomeEvento: "Univem NASA",
          organizacao: "Univem",
          posicao: "3°Lugar",
          imgOrg: "assets/UnivemIMG.png",
          corPodio: Cores.bronze,
        ),
        Medalhas(
          nomeEvento: "Univem NASA",
          organizacao: "Univem",
          posicao: "2°Lugar",
          imgOrg: "assets/UnivemIMG.png",
          corPodio: Cores.cinza,
        ),
        Medalhas(
          nomeEvento: "Univem NASA",
          organizacao: "Univem",
          posicao: "1°Lugar",
          imgOrg: "assets/UnivemIMG.png",
          corPodio: Cores.amarelo,
        ),
        Medalhas(
          nomeEvento: "Univem NASA",
          organizacao: "Univem",
          posicao: "9°Lugar",
          imgOrg: "assets/UnivemIMG.png",
          corPodio: Cores.azul45B0F0,
        )
      ],
    );
  }
}

/// Widget exibido na aba de Eventos Favoritos.
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
            children: const [
              Text(
                "Tecnologia",
                style: TextStyle(
                  fontFamily: Fontes.raleway,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Favoritos(imgEvento: "assets/evento1.png", imgOrg: "assets/UnivemIMG.png"),
                    Favoritos(imgEvento: "assets/evento1.png", imgOrg: "assets/UnivemIMG.png"),
                    Favoritos(imgEvento: "assets/evento1.png", imgOrg: "assets/UnivemIMG.png"),
                    Favoritos(imgEvento: "assets/evento1.png", imgOrg: "assets/UnivemIMG.png"),
                    Favoritos(imgEvento: "assets/evento1.png", imgOrg: "assets/UnivemIMG.png"),
                    Favoritos(imgEvento: "assets/evento1.png", imgOrg: "assets/UnivemIMG.png"),
                  ],
                ),
              ),
              Text(
                "Informação",
                style: TextStyle(
                  fontFamily: Fontes.raleway,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Favoritos(imgEvento: "assets/evento1.png", imgOrg: "assets/UnivemIMG.png"),
                    Favoritos(imgEvento: "assets/evento1.png", imgOrg: "assets/UnivemIMG.png"),
                    Favoritos(imgEvento: "assets/evento1.png", imgOrg: "assets/UnivemIMG.png"),
                    Favoritos(imgEvento: "assets/evento1.png", imgOrg: "assets/UnivemIMG.png"),
                    Favoritos(imgEvento: "assets/evento1.png", imgOrg: "assets/UnivemIMG.png"),
                    Favoritos(imgEvento: "assets/evento1.png", imgOrg: "assets/UnivemIMG.png"),
                  ],
                ),
              ),
              Text(
                "Matemática",
                style: TextStyle(
                  fontFamily: Fontes.raleway,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Favoritos(imgEvento: "assets/evento1.png", imgOrg: "assets/UnivemIMG.png"),
                    Favoritos(imgEvento: "assets/evento1.png", imgOrg: "assets/UnivemIMG.png"),
                    Favoritos(imgEvento: "assets/evento1.png", imgOrg: "assets/UnivemIMG.png"),
                    Favoritos(imgEvento: "assets/evento1.png", imgOrg: "assets/UnivemIMG.png"),
                    Favoritos(imgEvento: "assets/evento1.png", imgOrg: "assets/UnivemIMG.png"),
                    Favoritos(imgEvento: "assets/evento1.png", imgOrg: "assets/UnivemIMG.png"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
