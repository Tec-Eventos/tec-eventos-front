import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tec_eventos/cores.dart';

class EventosInscritos extends StatefulWidget {
  EventosInscritos({super.key, required this.paginaAtual});

  int paginaAtual = 0;

  @override
  State<EventosInscritos> createState() => _EventosInscritosState();
}

class _EventosInscritosState extends State<EventosInscritos> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          //appbar, ou seja, parte superior
          const AppBarMyEvents(),
        ],
        body: PageView.builder(
            itemCount: listaEventosGeral.length,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                widget.paginaAtual = index;
              });
            },
            itemBuilder: (context, index) =>
                Testes(nome: listaEventosGeral[index])),
      ),
    );
  }
}

List<Widget> listaEventosGeral = [
  Card(
    child: Column(
      children: [
        Image.asset("assets/evento1.png"),
        ListTile(
          leading: Text("Mês 17"),
          title: Text("Evento tal, que vai acontecer ali e aqui"),
          trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_outlined,
              )),
        )
      ],
    ),
  ),
  Testes(
      nome: Container(
    height: 200,
    color: Colors.green,
  ))
];

class Testes extends StatefulWidget {
  const Testes({super.key, required this.nome});

  final Widget nome;

  @override
  State<Testes> createState() => _TestesState();
}

class _TestesState extends State<Testes> {
  @override
  Widget build(BuildContext context) {
    return widget.nome;
  }
}

class AppBarMyEvents extends StatefulWidget {
  const AppBarMyEvents({super.key});

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
                color: Cores.Preto,
                size: 20,
              ));
        },
      ),
      title: Center(
        child: Text(
          "Meus Eventos",
          style: GoogleFonts.raleway(
              fontWeight: FontWeight.bold, fontSize: 22, color: Cores.Preto),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 24,
              color: Cores.Preto,
            ))
      ],
      bottom: const PreferredSize(
          preferredSize: Size.square(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OptionMyEvents(icon: Icons.timer_outlined, nome: "Pendentes"),
              OptionMyEvents(
                  icon: Icons.check_circle_outline_rounded, nome: "Concluidos")
            ],
          )),
    );
  }
}

class OptionMyEvents extends StatelessWidget {
  const OptionMyEvents({super.key, required this.icon, required this.nome});

  final IconData icon;
  final String nome;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 50,
      width: displayWidth / 2,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Cores.Cinza_mais_claro)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
            color: Cores.Preto,
          ),
          const SizedBox(width: 10),
          Text(
            nome,
            style: GoogleFonts.raleway(
                fontSize: 17, fontWeight: FontWeight.bold, color: Cores.Preto),
          )
        ],
      ),
    );
  }
}
