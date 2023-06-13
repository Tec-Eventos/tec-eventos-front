 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/componentes/Drawer/drawer.dart';
import 'package:tec_eventos/componentes/Perfil_user/informacao_perfil/perfil_descricao.dart';
import 'package:tec_eventos/componentes/Perfil_user/menu_perfil/eventosParticipados.dart';
import 'package:tec_eventos/componentes/Perfil_user/menu_perfil/favoritos.dart';
import 'package:tec_eventos/componentes/Perfil_user/menu_perfil/medalhas.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/paginas/pag_principal/principal_page.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

bool eventosParticipados = true;
bool medalhas = false;
bool favoritos = false;

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerPages(),
      backgroundColor: Cores.Branco,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          //Classe da appbar da página. Juntamente da descrição de perfil.PerfilDescricao(),
          const PerfilDescricao(),
        ],
        body:

        ListView(scrollDirection: Axis.vertical, 
           padding: EdgeInsets.symmetric(vertical: 0),
            children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //parte dos eventos participados
                    ParticipacaoPerfil(!eventosParticipados, false, false, Icon(Icons.school_outlined, color: Colors.black), eventosParticipados),

                    //parte das medalhas
                    ParticipacaoPerfil(false, !medalhas, false, Icon(Icons.workspace_premium_outlined, color: Colors.black), medalhas),

                    //parte dos eventos favoritados
                    ParticipacaoPerfil(false, false, !favoritos, Icon(Icons.favorite_border_outlined, color: Colors.black), favoritos),
                  ],
                ),
              ),

              SizedBox(height: 30),

              //se os eventos participados estiverem marcados

              eventosParticipados
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                    )
                  : medalhas
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Medalhas(
                                nomeEvento: "Univem NASA",
                                organizacao: "Univem",
                                posicao: "3°Lugar",
                                imgOrg: "assets/UnivemIMG.png",
                                corPodio: Cores.Bronze),
                            Medalhas(
                                nomeEvento: "Univem NASA",
                                organizacao: "Univem",
                                posicao: "2°Lugar",
                                imgOrg: "assets/UnivemIMG.png",
                                corPodio: Cores.Cinza),
                            Medalhas(
                                nomeEvento: "Univem NASA",
                                organizacao: "Univem",
                                posicao: "1°Lugar",
                                imgOrg: "assets/UnivemIMG.png",
                                corPodio: Cores.Amarelo),
                            Medalhas(
                                nomeEvento: "Univem NASA",
                                organizacao: "Univem",
                                posicao: "9°Lugar",
                                imgOrg: "assets/UnivemIMG.png",
                                corPodio: Cores.Azul45B0F0)
                          ],
                        )
                      : favoritos
                          ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tecnologia",
                                    style: GoogleFonts.raleway(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
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


                                  Text(
                                    "Informação",
                                    style: GoogleFonts.raleway(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),

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

                                  Text(
                                    "Matemática",
                                    style: GoogleFonts.raleway(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),

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
                          : Container(),
            ],
          ),
        ]),
      ),
    );
  }

  //Classe para aparecer determinado conteúdo ao clicar
  ParticipacaoPerfil(bool eventosBool, bool medalBool, bool favBool, Icon icon,
      bool optionTrue) {
    return
      GestureDetector(
        onTap: () {
          setState(() {
            eventosParticipados = eventosBool;
            medalhas = medalBool;
            favoritos = favBool;
          });
        },
        child: Column(children: [
          icon,
          AnimatedContainer(
              padding: const EdgeInsets.symmetric(horizontal: 10),
            duration: Duration(milliseconds: 100),
            width: optionTrue ? MediaQuery.of(context).size.width / 8 : 0.0,
            height: 2,
            decoration: BoxDecoration(
              color: optionTrue
                  ? Cores.AzulEscuroPerfilOption
                  : Colors.transparent,
            ),
          ),
        ]),

    );
  }
}


