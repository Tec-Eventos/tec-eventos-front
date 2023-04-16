import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tec_eventos/cores.dart';

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
        backgroundColor: Cores.Branco,
        body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) =>
            [
              //Classe da appbar da página. Juntamente da descrição de perfil.
              PerfilDescricao(context),
            ],
            body: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          //parte dos eventos participados
                          ParticipacaoPerfil(
                            !eventosParticipados,
                            false,
                            false,
                            Icon(Icons.school_outlined,
                                color: Colors.black),

                            AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              width: eventosParticipados ?  MediaQuery.of(context).size.width / 8 : 0.0,
                              height: 2,

                              decoration: BoxDecoration(
                                color: eventosParticipados
                                    ? Cores.AzulEscuroPerfilOption
                                    :   Colors.transparent,
                              ),
                            ),
                          ),

                          //parte das medalhas
                          ParticipacaoPerfil(
                            false,
                            !medalhas,
                            false,
                            Icon(Icons.workspace_premium_outlined,
                                color: Colors.black),

                            AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              width: medalhas ?  MediaQuery.of(context).size.width / 8 : 0.0,
                              height: 2,

                              decoration: BoxDecoration(
                                color: medalhas
                                    ? Cores.AzulEscuroPerfilOption
                                    :   Colors.transparent,
                              ),
                            ),
                          ),

                          //parte dos eventos favoritados
                          ParticipacaoPerfil(
                            false,
                            false,
                            !favoritos,
                            Icon(Icons.favorite_border_outlined,
                                color: Colors.black),

                            AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              width: favoritos ?  MediaQuery.of(context).size.width / 8 : 0.0,
                              height: 2,

                              decoration: BoxDecoration(
                                color: favoritos
                                    ? Cores.AzulEscuroPerfilOption
                                    :   Colors.transparent,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }

  //Classe para aparecer determinado conteúdo ao clicar
  ParticipacaoPerfil(
      bool eventos,
      bool medal,
      bool fav,
      Icon icon,
      AnimatedContainer animatedContainer) {
    return GestureDetector(
      onTap: () {
        setState(() {
          eventosParticipados = eventos;
          medalhas = medal;
          favoritos = fav;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
            children: [
              icon,
              animatedContainer,
            ]),
      ),
    );
  }
}


//classe da descricao de perfil do usuário
PerfilDescricao(context) {
  return SliverAppBar(
    elevation: 0,
    floating: true,
    snap: true,
    pinned: false,
    backgroundColor: Cores.AzulBebe,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))),
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          tooltip: 'Menu',
          onPressed: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Menu')));
          },
        );
      },
    ),
    actions: [
    IconButton(
  icon: const Icon(Icons.menu_rounded, color: Colors.black),
  tooltip: 'Menu',
  onPressed: () {
  ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(content: Text('Menu')));
  },
  ),
    ],


    //inicio das informações do usuário
    bottom: PreferredSize(
      preferredSize: Size.square(245.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          //descrição do perfil dentro do PrefferedSize
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage("assets/imgPerfil.png"),
          ),

          SizedBox(height: MediaQuery
              .of(context)
              .size
              .height / 50),
          Text(
            "Gabriel Felix",
            style: GoogleFonts.raleway(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: MediaQuery
              .of(context)
              .size
              .height / 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "1000",
                    style: GoogleFonts.raleway(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Seguindo",
                    style: GoogleFonts.raleway(
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              VerticalDivider(
                color: Colors.amber,
              ),
              Column(
                children: [
                  Text(
                    "1000",
                    style: GoogleFonts.raleway(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Seguidores",
                    style: GoogleFonts.raleway(
                      fontSize: 12.0,
                    ),
                  ),
                ],
              )
            ],
          ),

          SizedBox(height: MediaQuery
              .of(context)
              .size
              .height / 50),

          Text(
            "Desempregado",
            style: GoogleFonts.raleway(
              fontSize: 13.0,
            ),
          ),

          SizedBox(height: MediaQuery
              .of(context)
              .size
              .height / 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on_outlined),
              Text(
                "Marília-SP",
                style: GoogleFonts.raleway(
                  fontSize: 13.0,
                ),
              ),
            ],
          ),

          SizedBox(height: MediaQuery
              .of(context)
              .size
              .height / 30),
        ],
      ),
    ),
  );
}
