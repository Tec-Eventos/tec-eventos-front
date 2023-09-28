import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/paginas_aluno/perfil/perfil.dart';



class CardsEventosInstituicao extends StatelessWidget {
  const CardsEventosInstituicao({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
                      padding:
                          const EdgeInsets.only(right: 15, top: 10, bottom: 10),
                      child: SizedBox(
                        height: 160,
                        child:
                            //CUSTOMIZAÇÃO DO CARD
                            GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const Perfil(),
                                    type: PageTransitionType.bottomToTop));
                          },
                          child: Card(
                            margin: const EdgeInsets.only(top: 20),
                            shadowColor: Cores.preto,
                            borderOnForeground: false,
                            clipBehavior: Clip.hardEdge,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            color: Cores.branco,
                            elevation: 6,
                            child:
                                // COMPONENTES QUE VÃO ESTAR DENTRO DO CARD
                                Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //NOME DA INSTITUIÇÃO
                                        SizedBox(
                                          child: Text(
                                            "Unicamp",
                                            style: TextStyle(
                                              fontFamily: Fontes.raleway,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),

                                        //DIA QUE VAI ROLAR O EVENTO
                                        Text(
                                          "É HOJE",
                                          style: TextStyle(
                                            fontFamily: Fontes.raleway,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: Cores.azul1E88E5,
                                          ),
                                        ),
                                        const SizedBox(height: 5),

                                        //DIA EM ESPECÍFICO, COM DATA E HORÁRIO

                                        Text(
                                          "21/02/2023",
                                          style: TextStyle(
                                            fontFamily: Fontes.inter,
                                            fontSize: 9,
                                          ),
                                        ),
                                        Text(
                                          "13h00",
                                          style: TextStyle(
                                            fontFamily: Fontes.inter,
                                            fontSize: 9,
                                          ),
                                        ),

                                        //BOTÃO PARA VER MAIS SOBRE O EVENTO
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                elevation: 0,
                                                minimumSize: const Size(87, 27),
                                                shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color:
                                                            Cores.azul42A5F5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7))),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  PageTransition(
                                                      child: const Perfil(),
                                                      type: PageTransitionType
                                                          .bottomToTop));
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(Icons.edit_outlined,
                                                    size: 16,
                                                    color: Cores.azul42A5F5),
                                                const SizedBox(width: 10),
                                                Text(
                                                  "Editar",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          Fontes.raleway,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Cores.azul42A5F5),
                                                ),
                                              ],
                                            )),
                                      ]),
                                ),

                                //IMAGEM DO EVENTO
                                Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Image.network(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF4X9x0n7hHdQ1izZGxwEq81y0glQtxjmOF81cIQTlXxPtQBpecLHV3Bggot7kov4GK3g&usqp=CAU",
                                      height: 175,
                                      width: 160,
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                      width: 160,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 9,
                                              offset: Offset(5, 5)
                                              // Shadow position
                                              ),
                                        ],
                                      ),

                                      //imagem da organização do evento
                                      child: Image.asset(
                                        "assets/UnivemIMG.png",
                                        height: 16,
                                        width: 46,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
  }
}