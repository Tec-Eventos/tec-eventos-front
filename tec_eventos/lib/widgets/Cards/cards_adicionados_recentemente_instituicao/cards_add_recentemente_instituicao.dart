import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/paginas_instituicao/page_lista_participantes/page_lista_participantes.dart';

class CardsRecentesInstituicao extends StatelessWidget {
  const CardsRecentesInstituicao({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
      child: SizedBox(
        width: 285,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    child: const PageListaParticipantes(),
                    type: PageTransitionType.bottomToTop));
          },
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
                    Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF4X9x0n7hHdQ1izZGxwEq81y0glQtxjmOF81cIQTlXxPtQBpecLHV3Bggot7kov4GK3g&usqp=CAU",
                      height: 158,
                      width: 285,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 95,
                        height: 15,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          "Competição",
                          style: TextStyle(
                              fontFamily: Fontes.raleway,
                              fontSize: 12,
                              color: Cores.branco,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
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
                                "Unicamp Fest",
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
                            Icon(
                              Icons.location_on_outlined,
                              size: 15,
                              color: Cores.azul42A5F5,
                            ),
                            Text(
                              "Marília, SP",
                              style: TextStyle(
                                  fontFamily: Fontes.raleway,
                                  fontSize: 12,
                                  color: Cores.azul42A5F5),
                            ),
                          ],
                        ),

                        const SizedBox(height: 5),

                        //DIA EM ESPECÍFICO, COM DATA E HORÁRIO

                        Text(
                          "LOREM LOREM AKDISAMUIDMSAIUCMSAIUCMASIUCMSAIUCMSAIUCMSAIUCMSAUICMSUI",
                          style: TextStyle(
                              fontFamily: Fontes.raleway,
                              fontSize: 12,
                              color: Cores.preto),
                        ),

                        //BOTÃO PARA VER MAIS SOBRE O EVENTO
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/UnivemIMG.png",
                              height: 19,
                              width: 62,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Cores.azul42A5F5,
                                    elevation: 2,
                                    minimumSize: const Size(100, 20),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(7))),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: const PageListaParticipantes(),
                                          type:
                                              PageTransitionType.bottomToTop));
                                },
                                child: Text(
                                  "Ver lista",
                                  style: TextStyle(
                                      fontFamily: Fontes.raleway,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Cores.branco),
                                )),
                          ],
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
