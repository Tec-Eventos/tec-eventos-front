import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/componentes/Perfil_user/menu_perfil/favoritos.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/pagamento/metodospagamento.dart';
import 'package:tec_eventos/paginas/pag_inscricao_evento/google_maps.dart';

class info_evento extends StatefulWidget {
  const info_evento({super.key});

  @override
  State<info_evento> createState() => _info_eventoState();
}

class _info_eventoState extends State<info_evento> {


  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    double displayHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: displayHeight / 3,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://i0.wp.com/eztravel.com.br/wp-content/uploads/2022/01/elizeu-dias-seq9dyzse6c-unsplash.jpeg",
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
                color: Cores.Branco,
              ),
            ),
          ),
        ],
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            //parte do nome, horário e organização do evento
            ListTile(
              shape: Border(bottom: BorderSide(color: Cores.Cinza)),
              style: ListTileStyle.drawer,
              title: Text("Mês e horário"),
              subtitle: Text("Nome do evento"),
              trailing: SizedBox(
                height: 36,
                width: 108,
                child: Image.asset(
                  "assets/UnivemIMG.png",
                  fit: BoxFit.fill,
                ),
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
                          backgroundColor: Cores.Azul42A5F5,
                          child: Icon(Icons.chair_outlined, color: Cores.Branco, size: 20,)),
                    ),
                    title: const Text("10 ingressos restantes"),
                  ),

                  //parte do preço

                ListTile(
                  leading: SizedBox(
                    height: 40,
                    width: 40,
                    child: CircleAvatar(
                        backgroundColor: Cores.Azul42A5F5,
                        child: Icon(Icons.payments_outlined, color: Cores.Branco, size: 20,)),
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
                        backgroundColor: Cores.Branco,
                        side: BorderSide(
                          color: Cores.Azul42A5F5,
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
                              color: Cores.Azul42A5F5),
                          Text(
                            "Ver no mapa",
                            style: GoogleFonts.raleway(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Cores.Azul42A5F5),
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
                  SingleChildScrollView(
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
      bottomNavigationBar: GestureDetector(
        onTap: (){
           Navigator.push(
                            context,
                            PageTransition(
                                child: MetodosPagamento(),
                                type: PageTransitionType.bottomToTop));
        },
        child: Container(
          height: 64,
          decoration: BoxDecoration(
              color: Cores.Azul42A5F5,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15))),
          child: Center(
            child: Text(
              "Inscrever-se",
              style: GoogleFonts.raleway(
                  fontSize: 29, fontWeight: FontWeight.bold, color: Cores.Branco),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
