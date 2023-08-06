import 'package:flutter/material.dart';
import 'package:tec_eventos/componentes/Appbar/AppBarMeusEventos/appbarmyevents.dart';
import 'package:tec_eventos/componentes/Cards/eventos_pendentes/eventos_pendentes.dart';
import 'package:tec_eventos/componentes/Cards/meusEventos/meus_eventos.dart';

List<Widget> listaEventosGeral = [
  const EventosPendentes(),
  const EventosConcluidos(),
];

class EventosInscritos extends StatefulWidget {
  const EventosInscritos({super.key});

  @override
  State<EventosInscritos> createState() => _EventosInscritosState();
}

class _EventosInscritosState extends State<EventosInscritos> {
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
      backgroundColor: Colors.white,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          //appbar, ou seja, parte superior
          AppBarMyEvents(
            pendentes: GestureDetector(
              onTap: () {
                _pageController.jumpToPage(paginaAtual = 0);
              },
              child: OptionMyEvents(
                  isActive: paginaAtual == 0,
                  icon: Icons.timer_outlined,
                  nome: "Pendentes"),
            ),
            concluidos: GestureDetector(
              onTap: () {
                _pageController.jumpToPage(paginaAtual = 1);
              },
              child: OptionMyEvents(
                  isActive: paginaAtual == 1,
                  icon: Icons.check_circle_outline_rounded,
                  nome: "Concluidos"),
            ),
          ),
        ],
        body: PageView.builder(
            itemCount: listaEventosGeral.length,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                paginaAtual = index;
              });
            },
            itemBuilder: (context, index) =>
                Paginas(pagina: listaEventosGeral[index])),
      ),
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

//pagina Concluidos
class EventosConcluidos extends StatefulWidget {
  const EventosConcluidos({Key? key}) : super(key: key);

  @override
  State<EventosConcluidos> createState() => _EventosConcluidosState();
}

class _EventosConcluidosState extends State<EventosConcluidos> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: const [CardEventosConcluidos(), CardEventosNaoPresentes()],
    );
  }
}

//pagina Pendentes
class EventosPendentes extends StatefulWidget {
  const EventosPendentes({Key? key}) : super(key: key);

  @override
  State<EventosPendentes> createState() => _EventosPendentesState();
}

class _EventosPendentesState extends State<EventosPendentes> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: const [CardPendentes(), CardPendentes(), CardPendentes()],
    );
  }
}
