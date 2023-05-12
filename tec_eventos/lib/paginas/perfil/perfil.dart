import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tec_eventos/componentes/Drawer/drawer.dart';
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
        drawer: DrawerPages(),
        backgroundColor: Cores.Branco,
        body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
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
                    eventosParticipados ?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Eventos(
                            imagem: "assets/UnivemIMG.png",
                            nomeEvento: "Univem Nasa",
                            descricao: "Aqui você terá todo o conhecimento dos trabalhos da NASA, juntamente de especialistas que estarão trabalhando conosco"
                        ),
                        Eventos(
                            imagem: "assets/UnivemIMG.png",
                            nomeEvento: "Univem Nasa",
                            descricao: "Aqui você terá todo o conhecimento dos trabalhos da NASA, juntamente de especialistas que estarão trabalhando conosco"
                        ),
                        Eventos(
                            imagem: "assets/UnivemIMG.png",
                            nomeEvento: "Univem Nasa",
                            descricao: "Aqui você terá todo o conhecimento dos trabalhos da NASA, juntamente de especialistas que estarão trabalhando conosco"
                        ),
                      ],
                    ) :

                    medalhas ?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       SizedBox(
                         child: ListTile(
                           autofocus: true,
                           leading:
                           Icon(
                             Icons.workspace_premium_outlined,
                           ),
                           title: Text("Medalha de tal evento"),
                           subtitle: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text("Univem"),
                               Text("3° lugar"),
                             ],
                           ),
                           trailing: Image.asset("assets/UnivemIMG.png"),
                         ),
                       )
                      ],
                    )
                      :
                     favoritos ?
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Eventos(
                             imagem: "assets/UnivemIMG.png",
                             nomeEvento: "Univem Na",
                             descricao: "Aqui você terá todo o conhecimento dos trabalhos da NASA, juntamente de especialistas que estarão trabalhando conosco"
                         ),
                         Eventos(
                             imagem: "assets/UnivemIMG.png",
                             nomeEvento: "Univem Na",
                             descricao: "Aqui você terá todo o conhecimento dos trabalhos da NASA, juntamente de especialistas que estarão trabalhando conosco"
                         ),
                         Eventos(
                             imagem: "assets/UnivemIMG.png",
                             nomeEvento: "Univem Na",
                             descricao: "Aqui você terá todo o conhecimento dos trabalhos da NASA, juntamente de especialistas que estarão trabalhando conosco"
                         ),
                       ],
                     )
                     :
                    Container(),









              ],
            ),
    ]
    ),
    ),
    );
  }

  //Classe para aparecer determinado conteúdo ao clicar
  ParticipacaoPerfil(bool eventosBool, bool medalBool, bool favBool, Icon icon, bool optionTrue) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            eventosParticipados = eventosBool;
            medalhas = medalBool;
            favoritos = favBool;
          });
        },
        child:  Column(
            children: [
            icon,
            AnimatedContainer(
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

      ),
    );
  }
}

//classe da descricao de perfil do usuário / appbar
PerfilDescricao(context) {
  return SliverAppBar(
    floating: false,
    backgroundColor: Cores.AzulBebe,
    expandedHeight: 85,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))),
    leading:   IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 18,
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => PrincipalPage()));
              },
            ),



    actions: [
      Builder(
        builder: (BuildContext context)  {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Scaffold.of(context).openDrawer();
              },
              child: Image.asset("assets/Icons/menuicon.png",

              ),
            ),
          );
        },
      ),
    ],

    //inicio das informações do usuário
    bottom: PreferredSize(
      preferredSize: Size.square(250),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //descrição do perfil dentro do PrefferedSize
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage("assets/imgPerfil.png"),
          ),

          SizedBox(height: MediaQuery.of(context).size.height / 50),
          Text(
            "Gabriel Felix",
            style: GoogleFonts.raleway(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height / 50),
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

          SizedBox(height: MediaQuery.of(context).size.height / 50),

          Text(
            "Desempregado",
            style: GoogleFonts.raleway(
              fontSize: 13.0,
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height / 200),
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

          SizedBox(height: MediaQuery.of(context).size.height / 30),
        ],
      ),
    ),
  );
}


class Eventos extends StatefulWidget {
   const Eventos({Key? key, required this.imagem, required this.nomeEvento, required this.descricao}) : super(key: key);

    //perguntar para o Menoi a respeito do tipo que devo passar para a imagem do usuário
   final String imagem, nomeEvento, descricao;

  @override
  State<Eventos> createState() => _EventosState();
}

class _EventosState extends State<Eventos> {
  @override
  Widget build(BuildContext context) {


    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 6.5,
      child: ListTile(
        leading: Image.asset(widget.imagem),
        title: Text(widget.nomeEvento),
        subtitle: Text(widget.descricao),
      ),
    );
  }
}

//
// class Medalhas extends StatefulWidget {
//   const Medalhas({Key? key}) : super(key: key);
//
//   @override
//   State<Medalhas> createState() => _MedalhasState();
// }
//
// class _MedalhasState extends State<Medalhas> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width / 1.1,
//       height: MediaQuery.of(context).size.height / 6.5,
//       child: ListTile(
//        
//         leading: Icons(icone),
//         title: ,
//         subtitle: ,
//       ),
//     );
//   }
// }
//
//
