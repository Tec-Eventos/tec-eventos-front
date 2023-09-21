import 'package:flutter/material.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';



class CardEventosConcluidos extends StatefulWidget {
  const CardEventosConcluidos({super.key});

  @override
  State<CardEventosConcluidos> createState() => _CardEventosConcluidosState();
}

class _CardEventosConcluidosState extends State<CardEventosConcluidos> {
  @override
  Widget build(BuildContext context) {
    return  Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/evento1.png",
                fit: BoxFit.fitWidth,
                height: 166,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("UnivemFest",
                            style: TextStyle(
                              fontFamily: Fontes.raleway,
                                fontSize: 17, fontWeight: FontWeight.bold)),
                        ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     PageTransition(
                            //         child: const LoginPage(),
                            //         type: PageTransitionType.rightToLeft));
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Cores.branco,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Cores.azul42A5F5),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(7))),
                          ),
                          child: Text(
                            'Questionário',
                            style: TextStyle(
                              fontFamily: Fontes.inter,
                                fontSize: 17, color: Cores.azul42A5F5),
                          ),
                        )
                      ],
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      decoration: BoxDecoration(
                          color: Cores.branco,
                          border: Border.all(color: Cores.verde),
                          borderRadius: BorderRadius.circular(100)),
                      child: IconButton(
                          onPressed: () {},
                          color: Cores.verde,
                          icon: const Icon(Icons.check)),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
  }
}


class CardEventosNaoPresentes extends StatefulWidget {
  const CardEventosNaoPresentes({super.key});

  @override
  State<CardEventosNaoPresentes> createState() => _CardEventosNaoPresentesState();
}

class _CardEventosNaoPresentesState extends State<CardEventosNaoPresentes> {
  @override
  Widget build(BuildContext context) {
    return 
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/evento1.png",
                fit: BoxFit.fitWidth,
                height: 166,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("UnivemFest",
                            style: TextStyle(
                              fontFamily: Fontes.raleway,
                                fontSize: 17, fontWeight: FontWeight.bold)),
                        Text("17",
                            style: TextStyle(
                              fontFamily: Fontes.raleway,
                                fontSize: 17, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      decoration: BoxDecoration(
                          color: Cores.branco,
                          border: Border.all(color: Cores.vermelho),
                          borderRadius: BorderRadius.circular(100)),
                      child: IconButton(
                          onPressed: () {},
                          color: Cores.vermelho,
                          icon: const Icon(Icons.close)),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
  }
}

