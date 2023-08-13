import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/componentes/Perfil_user/menu_perfil/favoritos.dart';
import 'package:tec_eventos/componentes/botaoInfoEvento/meuIngressoButton/meuingresso_button.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/paginas/pag_inscricao_evento/google_maps.dart';

class InfoEventoPendentes extends StatefulWidget {
  const InfoEventoPendentes({super.key});

  @override
  State<InfoEventoPendentes> createState() => _InfoEventoPendentesState();
}

class _InfoEventoPendentesState extends State<InfoEventoPendentes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          //AppBar
          const AppBarEventosInfo(
              imagem:
                  "https://cdn-7.motorsport.com/images/amp/0oOEJVw0/s1000/lewis-hamilton-mercedes-1.jpg")
        ],
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            //parte do nome, horário e organização do evento
            ListTile(
              shape: Border(bottom: BorderSide(color: Cores.cinza)),
              style: ListTileStyle.drawer,
              title: Text("12/02/2024 às 14h00",
                  style: GoogleFonts.raleway(
                      fontSize: 18,
                      color: Cores.cinza6A6666,
                      fontWeight: FontWeight.bold)),
              subtitle: Text("Lewis Hamilton Unimar",
                  style: GoogleFonts.raleway(
                      fontSize: 20,
                      color: Cores.preto,
                      fontWeight: FontWeight.bold)),
              trailing: Image.asset(
                "assets/UnimarIMG.png",
                fit: BoxFit.scaleDown,
                height: 70,
                width: 70,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Informações do ingresso",
                    style: GoogleFonts.raleway(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  //parte dos ingressos restantes
                  ListTile(
                    leading: SizedBox(
                      height: 40,
                      width: 40,
                      child: CircleAvatar(
                          backgroundColor: Cores.azul42A5F5,
                          child: Icon(
                            Icons.chair_outlined,
                            color: Cores.branco,
                            size: 20,
                          )),
                    ),
                    title: const Text("10 ingressos restantes"),
                  ),

                  //parte do preço

                  ListTile(
                    leading: SizedBox(
                      height: 40,
                      width: 40,
                      child: CircleAvatar(
                          backgroundColor: Cores.azul42A5F5,
                          child: Icon(
                            Icons.payments_outlined,
                            color: Cores.branco,
                            size: 20,
                          )),
                    ),
                    title: const Text("Grátis"),
                  ),

                  const SizedBox(height: 20),
                  Text(
                    "Descrição",
                    style: GoogleFonts.raleway(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Um texto qualquer sobre a descrição do evento que está acontecendo em tal lugar e agora eu fiquei sem ideia então vou encher de lorem ipsum lorem lorem ipsum lorem ipsum pasdafsd dsdajk lorem.",
                    style: GoogleFonts.raleway(fontSize: 13),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    "Local",
                    style: GoogleFonts.raleway(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "O evento acontecerá na universidade Univem em Marília, SP.",
                    style: GoogleFonts.raleway(fontSize: 13),
                  ),
                  SizedBox(
                    width: 135,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Cores.branco,
                        side: BorderSide(
                          color: Cores.azul42A5F5,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: const GooglePage(),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.location_on_outlined,
                              color: Cores.azul42A5F5),
                          Text(
                            "Ver no mapa",
                            style: GoogleFonts.raleway(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Cores.azul42A5F5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    "Imagens do local",
                    style: GoogleFonts.raleway(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
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
            )
          ],
        ),
      ),
      bottomNavigationBar: const MeuIngressoButton(),
    );
  }
}

class AppBarEventosInfo extends StatefulWidget {
  const AppBarEventosInfo({Key? key, required this.imagem}) : super(key: key);

  final String imagem;

  @override
  _AppBarEventosInfoState createState() => _AppBarEventosInfoState();
}

class _AppBarEventosInfoState extends State<AppBarEventosInfo> {
  @override
  Widget build(BuildContext context) {
    double displayHeight = MediaQuery.of(context).size.height;

    return SliverAppBar(
      expandedHeight: displayHeight / 3,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          widget.imagem,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
      floating: true,
      snap: true,
      pinned: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          size: 30,
          color: Cores.branco,
        ),
      ),
    );
  }
}
