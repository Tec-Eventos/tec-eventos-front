import 'package:flutter/material.dart';
import 'package:tec_eventos/widgets/Cards/eventos_em_alta/cards_eventos_alta.dart';
import 'package:tec_eventos/widgets/Cards/eventos_inscritos/cards_eventos_inscritos.dart';
import 'package:tec_eventos/widgets/Cards/eventos_recomendados/cards_recomendados.dart';
import 'package:tec_eventos/widgets/InstituicaoSugerida/instituicao_sugerida.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';

class PrincipalPage extends StatelessWidget {
  const PrincipalPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imagensEventos = [
      "assets/UnivemIMG.png",
      "assets/UnivemIMG.png",
      "assets/UnivemIMG.png",
      "assets/UnivemIMG.png",
    ];

    bool palestras = true;
    bool competicoes = false;
    bool bootcamp = false;
    bool notificationButton = false;

    return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 23),
        scrollDirection: Axis.vertical,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //menu de filtragem
              // Center(
              //   child: SingleChildScrollView(
              //     scrollDirection: Axis.horizontal,
              //     child: Row(
              //       children: <Widget>[
              //         filtragemEventos(false, !competicoes, false,
              //             Icons.school_outlined, competicoes),
              //         filtragemEventos(!palestras, false, false,
              //             Icons.school_outlined, palestras),
              //         filtragemEventos(false, false, !bootcamp,
              //             Icons.school_outlined, bootcamp),
              //       ],
              //     ),
              //   ),
              // ),

              const SizedBox(height: 50),

              Text(
                "Eventos que você está inscrito",
                style: TextStyle(
                    fontFamily: Fontes.raleway,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),

              //carrossel dos eventos que o usuário vai participar, mostrando os dias que faltam
              const RowCardEventosInscritos(),

              const SizedBox(height: 50),

              Text(
                "Eventos em alta",
                style: TextStyle(
                    fontFamily: Fontes.raleway,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),

              //carrossel dos eventos que as pessoas mais fizeram inscrições
              const RowEventosEmAlta(),

              const SizedBox(height: 50),

              Text(
                "Recomendados para você",
                style: TextStyle(
                    fontFamily: Fontes.raleway,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),

              //carrossel dos cards recomendados para o aluno
              const RowEventosRecomendados(),

              const SizedBox(height: 50),

              Text(
                "Algumas instituições",
                style: TextStyle(
                    fontFamily: Fontes.raleway,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),

              //imagens das instituições parceiras
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InstituicaoSugerida(imagem: "assets/unimarImagem.png"),
                    InstituicaoSugerida(imagem: "assets/unimarImagem.png"),
                    InstituicaoSugerida(imagem: "assets/unimarImagem.png")
                  ],
                ),
              ),
            ],
          ),
        ]);
  }

  // // //filtragem
  // // filtragemEventos(bool palestrasBool, bool compBool, bool bootcampBool,
  // //     IconData icon, bool optionTrue) {
  // //   return Padding(
  // //     padding: const EdgeInsets.symmetric(horizontal: 5.0),
  // //     child: GestureDetector(
  // //       onTap: () {
  // //       //   setState(() {
  // //       //     palestras = palestrasBool;
  // //       //     competicoes = compBool;
  // //       //     bootcamp = bootcampBool;
  // //       //   });
  // //       // },
  // //       child: Column(children: [
  // //         AnimatedContainer(
  // //             duration: const Duration(milliseconds: 300),
  // //             width: 72,
  // //             height: 72,
  // //             decoration: BoxDecoration(
  // //               borderRadius: BorderRadius.circular(50.0),
  // //               border: Border.all(
  // //                   color: optionTrue ? Colors.transparent : Cores.azul42A5F5),

  // //               //cor de fundo
  // //               color: optionTrue ? Cores.azul42A5F5 : Colors.transparent,
  // //             ),
  // //             child: optionTrue
  // //                 ? Column(
  // //                     mainAxisAlignment: MainAxisAlignment.center,
  // //                     crossAxisAlignment: CrossAxisAlignment.center,
  // //                     children: [
  // //                       //icone
  // //                       Icon(
  // //                         icon,
  // //                         color: Cores.branco,
  // //                         size: 30,
  // //                       ),

  // //                       Text(
  // //                         "Palestras",
  // //                         style: TextStyle(
  // //                             fontFamily: Fontes.raleway,
  // //                             fontSize: 10,
  // //                             color: Cores.branco,
  // //                             fontWeight: FontWeight.bold),
  // //                       ),

  // //                       //texto do filtro em específico
  // //                     ],
  // //                   )
  // //                 : Icon(icon, color: Cores.azul42A5F5, size: 30)),
  // //       ]),
  // //     ),
  // //   );
  // }
}
