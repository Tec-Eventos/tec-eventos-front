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
                Paginas(pagina: listaEventosGeral[index])),
      ),
    );
  }
}

List<Widget> listaEventosGeral = [
  const EventosPendentes(),
  const EventosConcluidos(),
];

//pagina Pendentes
class EventosPendentes extends StatefulWidget {
  const EventosPendentes({Key? key}) : super(key: key);

  @override
  _EventosPendentesState createState() => _EventosPendentesState();
}

class _EventosPendentesState extends State<EventosPendentes> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/evento1.png",
                fit: BoxFit.fitWidth,
                height: 166,
              ),
              ListTile(
                minVerticalPadding: 20,
                tileColor: Colors.transparent,
                leading: Text(
                  "Mês  \n 17",
                  style: GoogleFonts.raleway(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Cores.Preto),
                ),
                title: Text("Evento, que vai acontecer ali e aqui",
                    style: GoogleFonts.inter(
                        fontSize: 18, fontWeight: FontWeight.w300)),
                trailing: GestureDetector(
                  onTap: () {
                    // notificationButton = botaoIcone;
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    decoration: BoxDecoration(
                        color: Cores.Branco,
                        border: Border.all(color: Cores.Azul42A5F5),
                        borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                        onPressed: () {},
                        color: Cores.Azul42A5F5,
                        icon: Icon(Icons.notifications_none_outlined)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//pagina Concluidos
class EventosConcluidos extends StatefulWidget {
  const EventosConcluidos({Key? key}) : super(key: key);

  @override
  _EventosConcluidosState createState() => _EventosConcluidosState();
}

class _EventosConcluidosState extends State<EventosConcluidos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Cores.Amarelo,
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

class OptionMyEvents extends StatefulWidget {
  const OptionMyEvents({Key? key, required this.icon, required this.nome})
      : super(key: key);

  final IconData icon;
  final String nome;

  @override
  _OptionMyEventsState createState() => _OptionMyEventsState();
}

class _OptionMyEventsState extends State<OptionMyEvents> {
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
            widget.icon,
            size: 20,
            color: Cores.Preto,
          ),
          const SizedBox(width: 10),
          Text(
            widget.nome,
            style: GoogleFonts.raleway(
                fontSize: 17, fontWeight: FontWeight.bold, color: Cores.Preto),
          )
        ],
      ),
    );
  }
}
