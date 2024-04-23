import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/widgets/Perfil_user/menu_perfil/favoritos.dart';
import 'package:tec_eventos/widgets/botaoInfoEvento/inscrever/inscrever.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:intl/intl.dart';
import 'package:tec_eventos/pages/paginas_aluno/pag_inscricao_evento/google_maps.dart';

final urlImage = 'https://api-tec-eventos-i6hr.onrender.com/imagem/';

class InfoEvento extends StatefulWidget {
  const InfoEvento(
      {super.key,
      required this.imagemEvento,
      required this.imagemOrganizacao,
      required this.diaRealizacao,
      required this.nomeEvento,
      required this.horarioRealizacao,
      required this.descricao,
      required this.cdEvento,
      required this.ingressos});

  final String imagemEvento;
  final String imagemOrganizacao;
  final String diaRealizacao;
  final String horarioRealizacao;
  final String nomeEvento, descricao;
  final int cdEvento, ingressos;

  @override
  State<InfoEvento> createState() => _InfoEventoState();
}

class _InfoEventoState extends State<InfoEvento> {
  @override
  Widget build(BuildContext context) {
    // double displayWidth = MediaQuery.of(context).size.width;

    DateTime data = DateTime.parse(widget.diaRealizacao).toLocal();
    String dataFormatada = "${data.day}/${data.month}/${data.year}";

    TimeOfDay hora = TimeOfDay(
      hour: int.parse(widget.horarioRealizacao.split(":")[0]),
      minute: int.parse(widget.horarioRealizacao.split(":")[1]),
    );
    String horaFormatada =
        "${hora.hour}h${hora.minute.toString().padLeft(2, '0')}";
    return Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            //AppBar
            AppBarEventosInfo(imagem: widget.imagemEvento)
          ],
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              //parte do nome, horário e organização do evento
              ListTile(
                shape: Border(bottom: BorderSide(color: Cores.cinza)),
                style: ListTileStyle.drawer,
                title: Text("${dataFormatada} às ${horaFormatada}",
                    style: TextStyle(
                        fontFamily: Fontes.raleway,
                        fontSize: 20,
                        color: Cores.cinza6A6666,
                        fontWeight: FontWeight.bold)),
                subtitle: Text(widget.nomeEvento,
                    style: TextStyle(
                        fontFamily: Fontes.raleway,
                        fontSize: 22,
                        color: Cores.preto,
                        fontWeight: FontWeight.bold)),
                trailing: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Image.network(
                    urlImage + widget.imagemOrganizacao,
                    fit: BoxFit.contain,
                    height: 90,
                    width: 90,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      "${widget.cdEvento}",
                      style: TextStyle(
                        fontFamily: Fontes.ralewayBold,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      "Informações do ingresso",
                      style: TextStyle(
                          fontFamily: Fontes.raleway,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),

                    //parte dos ingressos restantes

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
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
                        const SizedBox(
                          width: 20,
                        ),
                        Text('${widget.ingressos}'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
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
                        const SizedBox(
                          width: 20,
                        ),
                        const Text("Grátis"),
                      ],
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
                      widget.descricao,
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
                      "Confira o local onde o evento ocorrerá",
                      style:
                          TextStyle(fontFamily: Fontes.raleway, fontSize: 13),
                    ),
                    SizedBox(
                      width: 135,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
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
                              style: TextStyle(
                                  fontFamily: Fontes.raleway,
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
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Inscrever(cdEvento: widget.cdEvento));
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
          urlImage + widget.imagem,
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
          color: Cores.preto,
        ),
      ),
    );
  }
}
