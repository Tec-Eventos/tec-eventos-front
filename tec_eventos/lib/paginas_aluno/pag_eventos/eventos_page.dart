import 'package:flutter/material.dart';
import 'package:tec_eventos/componentes/InstituicaoSugerida/instituicao_sugerida.dart';
import 'package:tec_eventos/componentes/Perfil_user/menu_perfil/favoritos.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';

class EventosPage extends StatefulWidget {
  const EventosPage({Key? key}) : super(key: key);

  @override
  State<EventosPage> createState() => _EventosPageState();
}

class _EventosPageState extends State<EventosPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 23),
      scrollDirection: Axis.vertical,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InstituicaoSugerida(imagem: "assets/unimarImagem.png"),
                  InstituicaoSugerida(imagem: "assets/unimarImagem.png"),
                ],
              ),
            ),
            const SizedBox(height: 70),
            Text("Eventos para você",
                style: TextStyle(
                    fontFamily: Fontes.ralewayBold,
                    fontSize: 22,
                    color: Cores.preto)),

            //Card dos Eventos para você

            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CardEventosParaVoce(),
                  CardEventosParaVoce(),
                  CardEventosParaVoce()
                ],
              ),
            ),

            const SizedBox(height: 70),
            Text("Sugestões",
                style: TextStyle(
                    fontFamily: Fontes.ralewayBold,
                    fontSize: 22,
                    color: Cores.preto)),

            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
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
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CardEventosParaVoce extends StatefulWidget {
  const CardEventosParaVoce({super.key});

  @override
  State<CardEventosParaVoce> createState() => _CardEventosParaVoceState();
}

class _CardEventosParaVoceState extends State<CardEventosParaVoce> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: SizedBox(
        width: 219,
        child: Card(
          margin: const EdgeInsets.only(top: 20),
          shadowColor: Cores.preto,
          borderOnForeground: false,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Colors.white,
          elevation: 6,
          child:
              // COMPONENTES QUE VÃO ESTAR DENTRO DO CARD
              Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    color: Colors.amber,
                    height: 126,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //NOME DA INSTITUIÇÃO
                      SizedBox(
                        child: Row(
                          children: [
                            Text(
                              "Evento x",
                              style: TextStyle(
                                  fontFamily: Fontes.raleway,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Cores.preto),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      //DIA QUE VAI ROLAR O EVENTO

                      Row(
                        children: [
                          Text(
                            "Local:",
                            style: TextStyle(
                                fontFamily: Fontes.inter,
                                fontSize: 12,
                                color: Cores.preto),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Marília, SP",
                            style: TextStyle(
                                fontFamily: Fontes.inter,
                                fontSize: 12,
                                color: Cores.azul42A5F5),
                          ),
                        ],
                      ),

                      const SizedBox(height: 5),

                      //DIA EM ESPECÍFICO, COM DATA E HORÁRIO

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pessoas que se \ninscreveram:",
                            style: TextStyle(
                                fontFamily: Fontes.inter,
                                fontSize: 12,
                                color: Cores.preto),
                          ),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: CircleAvatar(
                                  child: Image.asset("assets/imgPerfil.png"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: CircleAvatar(
                                  child: Image.asset("assets/imgPerfil.png"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 40),
                                child: CircleAvatar(
                                  child: Image.asset("assets/imgPerfil.png"),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //     left: 7,
                              //   ),
                              //   child: Text(
                              //     "+5",
                              //     textAlign: TextAlign.center,
                              //     style: TextStyle(
                              //         fontFamily: Fontes.inter,
                              //         fontSize: 20,
                              //         color: Cores.preto),
                              //   ),
                            ],
                          )
                        ],
                      ),

                      //BOTÃO PARA VER MAIS SOBRE O EVENTO
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Saiba mais",
                            style: TextStyle(
                                fontSize: 15, color: Cores.azul42A5F5),
                          ))
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
