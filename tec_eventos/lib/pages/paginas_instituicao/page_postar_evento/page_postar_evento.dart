import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/acesso/cadastro.dart';
import 'package:tec_eventos/pages/paginas_aluno/pag_inscricao_evento/google_maps.dart';
import 'package:tec_eventos/widgets/InputText/input_text.dart';
import 'package:tec_eventos/widgets/Perfil_user/menu_perfil/favoritos.dart';
import 'package:tec_eventos/widgets/botao/botao.dart';
import 'package:tec_eventos/widgets/botaoInfoEvento/inscrever/inscrever.dart';

class PagePostarEvento extends StatefulWidget {
  const PagePostarEvento({super.key});

  @override
  State<PagePostarEvento> createState() => _PagePostarEventoState();
}

class _PagePostarEventoState extends State<PagePostarEvento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            //AppBar
            const AppBarPostarEvento()
          ],
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              //parte do nome, horário e organização do evento
              ListTile(
                shape: Border(bottom: BorderSide(color: Cores.cinza)),
                style: ListTileStyle.drawer,
                title: Text("10/10 às 10h",
                    style: TextStyle(
                        fontFamily: Fontes.raleway,
                        fontSize: 18,
                        color: Cores.cinza6A6666,
                        fontWeight: FontWeight.bold)),
                subtitle: Text("oioioi",
                    style: TextStyle(
                        fontFamily: Fontes.raleway,
                        fontSize: 20,
                        color: Cores.preto,
                        fontWeight: FontWeight.bold)),
                trailing: Image.asset(
                  "assets/unimarImagem.png",
                  fit: BoxFit.scaleDown,
                  height: 70,
                  width: 70,
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Informações do ingresso",
                      style: TextStyle(
                          fontFamily: Fontes.raleway,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
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
                      style: TextStyle(
                          fontFamily: Fontes.raleway,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Um texto qualquer sobre a descrição do evento que está acontecendo em tal lugar e agora eu fiquei sem ideia então vou encher de lorem ipsum lorem lorem ipsum lorem ipsum pasdafsd dsdajk lorem.",
                      style:
                          TextStyle(fontFamily: Fontes.raleway, fontSize: 13),
                    ),
                    const SizedBox(height: 50),
                    Text(
                      "Local",
                      style: TextStyle(
                          fontFamily: Fontes.raleway,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "O evento acontecerá na universidade Univem em Marília, SP.",
                      style:
                          TextStyle(fontFamily: Fontes.raleway, fontSize: 13),
                    ),
                    SizedBox(
                      width: 160,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          side: BorderSide(
                            color: Cores.azul42A5F5,
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  contentPadding: const EdgeInsets.all(20),
                                  shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  title: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(Icons.arrow_back)),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Adicione o cep:",
                                        style: TextStyle(
                                            fontFamily: Fontes.inter,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  content: TextFormField(
                                    keyboardType: TextInputType.name,
                                    // controller: controllerUser,
                                    decoration: InputDecoration(
                                      suffixIcon: const Icon(
                                          Icons.location_on_outlined),
                                      isDense: true,
                                      labelText: "CEP",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                  ),
                                  actions: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 10),
                                        child: Container(
                                          width: 282,
                                          height: 52,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: [
                                                    Cores.azul47BBEC,
                                                    Cores.azul42A5F5,
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Center(
                                            child: Text(
                                              "Confirmar",
                                              style: TextStyle(
                                                  fontFamily: Fontes.inter,
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.w500,
                                                  color: Cores.branco),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              });

                          // Navigator.push(
                          //     context,
                          //     PageTransition(
                          //         child: const GooglePage(),
                          //         type: PageTransitionType.bottomToTop));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.location_on_outlined,
                                color: Cores.azul42A5F5),
                            Text(
                              "Adicionar coordenada",
                              style: TextStyle(
                                  fontFamily: Fontes.raleway,
                                  fontSize: 10,
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
                      style: TextStyle(
                          fontFamily: Fontes.raleway,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
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

                    const Botao(),

                    const SizedBox(height: 30),

                    const Botao()
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: const Inscrever());
  }
}

class AppBarPostarEvento extends StatefulWidget {
  const AppBarPostarEvento({super.key});

  @override
  State<AppBarPostarEvento> createState() => _AppBarPostarEventoState();
}

class _AppBarPostarEventoState extends State<AppBarPostarEvento> {
  @override
  Widget build(BuildContext context) {
    double displayHeight = MediaQuery.of(context).size.height;

    return SliverAppBar(
      expandedHeight: displayHeight / 3,
      flexibleSpace: const FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Botao(),
        ),
      ),
      floating: true,
      snap: true,
      pinned: true,
      elevation: 0,
      backgroundColor: Cores.brancoCinzento,
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
