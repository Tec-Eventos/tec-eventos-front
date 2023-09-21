import 'package:flutter/material.dart';
import 'package:tec_eventos/componentes/Drawer/drawer.dart';
import 'package:tec_eventos/componentes/Perfil_user/informacao_perfil/perfil_descricao.dart';
import 'package:tec_eventos/componentes/Perfil_user/menu_perfil/eventos_participados.dart';
import 'package:tec_eventos/componentes/Perfil_user/menu_perfil/favoritos.dart';
import 'package:tec_eventos/componentes/Perfil_user/menu_perfil/medalhas.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

int menu = 1;

class _PerfilState extends State<Perfil> {
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
        body: ListView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(vertical: 0),
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //parte dos eventos participados
                        participacaoPerfil(
                            1,
                            const Icon(Icons.school_outlined,
                                color: Colors.black)),

                        //parte das medalhas
                        participacaoPerfil(
                            2,
                            const Icon(Icons.workspace_premium_outlined,
                                color: Colors.black)),

                        //parte dos eventos favoritados
                        participacaoPerfil(
                            3,
                            const Icon(Icons.favorite_border_outlined,
                                color: Colors.black)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
    
                  //se os eventos participados estiverem marcados

                  if (menu == 1) ...[
                    const Column(
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
                  ] else if (menu == 2) ...[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                    )
                  ] else if (menu == 3) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tecnologia",
                            style: TextStyle(
                              fontFamily: Fontes.raleway,
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                  ]
                ],
              ),
            ]),
      ),
    );
  }

  //Classe para aparecer determinado conteúdo ao clicar
  participacaoPerfil(
    int item,
    Icon icon,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          menu = item;
        });
      },
      child: Column(children: [
        icon,
        AnimatedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          duration: const Duration(milliseconds: 100),
          width: menu == item ? MediaQuery.of(context).size.width / 8 : 0.0,
          height: 2,
          decoration: BoxDecoration(
            color: menu == item
                ? Cores.azulEscuroPerfilOption
                : Colors.transparent,
          ),
        ),
      ]),
    );
  }
}
