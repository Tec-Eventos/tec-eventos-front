import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tec_eventos/cores.dart';

class EventosInscritos extends StatefulWidget {
  const EventosInscritos({super.key});

  @override
  State<EventosInscritos> createState() => _EventosInscritosState();
}

class _EventosInscritosState extends State<EventosInscritos> {
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
        body: Container(),
      ),
    );
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
    bool campo_pesquisa = true;
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

      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Container(
              child: Row(
            children: [Text("oi"), Text("oi")],
          ))),

      // bottom: PreferredSize(
      //     preferredSize: const Size.square(100),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Row(
      //           children: [
      //             ListTile(
      //               leading: Icon(
      //                 Icons.access_time,
      //                 size: 19,
      //                 color: Cores.Preto,
      //               ),
      //               title: Text(
      //                 "Pendentes",
      //                 style: GoogleFonts.raleway(
      //                     fontWeight: FontWeight.w900,
      //                     fontSize: 17,
      //                     color: Cores.Preto),
      //               ),
      //             )
      //           ],
      //         ),
      //       ],
      //     ))
    );
  }
}
