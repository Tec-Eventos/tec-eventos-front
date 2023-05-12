import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
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
      drawer: const DrawerPages(),
      backgroundColor: Cores.Branco,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          //Classe da appbar da página. Juntamente da descrição de perfil.PerfilDescricao(),
          PerfilDescricao(),
        ],
        body: ListView(scrollDirection: Axis.vertical, children: [
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
                        Icon(Icons.school_outlined, color: Colors.black),
                        eventosParticipados),

                    //parte das medalhas
                    ParticipacaoPerfil(
                        false,
                        !medalhas,
                        false,
                        Icon(Icons.workspace_premium_outlined,
                            color: Colors.black),
                        medalhas),

                    //parte dos eventos favoritados
                    ParticipacaoPerfil(
                        false,
                        false,
                        !favoritos,
                        Icon(Icons.favorite_border_outlined,
                            color: Colors.black),
                        favoritos),
                  ],
                ),
              ),

              SizedBox(height: 30),

              //se os eventos participados estiverem marcados

              eventosParticipados
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Eventos(
                            imagem: "assets/UnivemIMG.png",
                            nomeEvento: "Univem Nasa",
                            descricao:
                                "Aqui você terá todo o conhecimento dos trabalhos da NASA, juntamente de especialistas que estarão trabalhando conosco"),
                        Eventos(
                            imagem: "assets/UnivemIMG.png",
                            nomeEvento: "Univem Nasa",
                            descricao:
                                "Aqui você terá todo o conhecimento dos trabalhos da NASA, juntamente de especialistas que estarão trabalhando conosco"),
                        Eventos(
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
        child: Column(children: [
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
class PerfilDescricao extends StatefulWidget {
  const PerfilDescricao({Key? key}) : super(key: key);

  @override
  State<PerfilDescricao> createState() => _PerfilDescricaoState();
}

class _PerfilDescricaoState extends State<PerfilDescricao> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      backgroundColor: Cores.AzulBebe,
      expandedHeight: 85,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 18,
        ),
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  child: PrincipalPage(),
                  type: PageTransitionType.leftToRight));
        },
      ),

      actions: [
        Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Image.asset(
                  "assets/Icons/menuicon.png",
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
}

//Eventos participados pelo usuário
class Eventos extends StatefulWidget {
  Eventos(
      {Key? key,
      required this.imagem,
      required this.nomeEvento,
      required this.descricao})
      : super(key: key);

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

//Medalhas do usuário
class Medalhas extends StatefulWidget {
  const Medalhas(
      {Key? key,
      required this.nomeEvento,
      required this.organizacao,
      required this.posicao,
      required this.imgOrg,
      required this.corPodio})
      : super(key: key);

  final String nomeEvento, organizacao, posicao, imgOrg;
  final Color corPodio;

  @override
  State<Medalhas> createState() => _MedalhasState();
}

class _MedalhasState extends State<Medalhas> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.1,
      child: ListTile(
        isThreeLine: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
        ),
        tileColor: Colors.transparent,
        leading: Container(
          width: 30,
          height: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              color: widget.corPodio),
          child: const Icon(
            Icons.workspace_premium_outlined,
          ),
        ),
        title: Text(
          widget.nomeEvento,
          style: GoogleFonts.raleway(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.organizacao,
              style: GoogleFonts.raleway(
                fontSize: 13,
              ),
            ),
            Text(
              widget.posicao,
              style: GoogleFonts.raleway(
                fontSize: 13,
              ),
            ),
          ],
        ),
        trailing: SizedBox(
            width: 90,
            height: 90,
            child: Image.asset(
              widget.imgOrg,
              alignment: Alignment.bottomRight,
            )),
      ),
    );
  }
}

//Eventos favoritos do usuário
class Favoritos extends StatefulWidget {
  Favoritos({Key? key, required this.imgEvento, required this.imgOrg})
      : super(key: key);

  final String imgEvento, imgOrg;

  @override
  State<Favoritos> createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, top: 25, bottom: 25),
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Image.asset(
          widget.imgEvento,
          height: 93,
          width: 93,
          fit: BoxFit.fill,
        ),
        Container(
          width: 93,
          height: 30,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 8,
                // Shadow position
              ),
            ],
          ),
          child: Image.asset(
            widget.imgOrg,
            height: 16,
            width: 46,
            alignment: Alignment.center,
          ),
        ),
      ]),
    );
  }
}
