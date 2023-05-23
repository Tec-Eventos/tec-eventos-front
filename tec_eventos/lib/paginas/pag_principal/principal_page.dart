import 'dart:async';

import 'package:carousel_images/carousel_images.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tec_eventos/componentes/Appbar/appbar.dart';
import 'package:tec_eventos/componentes/Cards/eventos_em_alta/cards_eventos_alta.dart';
import 'package:tec_eventos/componentes/Cards/eventos_inscritos/cards_eventos_inscritos.dart';
import 'package:tec_eventos/componentes/Cards/eventos_recomendados/cards_recomendados.dart';
import 'package:tec_eventos/componentes/Drawer/drawer.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/paginas/perfil/perfil.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

bool palestras = true;
bool competicoes = false;
bool bootcamp = false;

List<String> imagensEventos = [
  "assets/UnivemIMG.png",
  "assets/UnivemIMG.png",
  "assets/UnivemIMG.png",
  "assets/UnivemIMG.png",
];

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 23),
        scrollDirection: Axis.vertical,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //menu de filtragem
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      //BOTÕES DE FILTRAGEM
                      FiltragemEventos(false, !competicoes, false,
                          Icons.school_outlined, competicoes),
                      FiltragemEventos(!palestras, false, false,
                          Icons.school_outlined, palestras),
                      FiltragemEventos(!palestras, false, false,
                          Icons.school_outlined, palestras),
                      FiltragemEventos(!palestras, false, false,
                          Icons.school_outlined, palestras),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 50),

              Text(
                "Eventos que você está inscrito",
                style: GoogleFonts.raleway(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),

              //SingleScroll
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      CardEventosInscritos(
                          nomeEvento: "Hackathon Univem Nasa",
                          dias_faltam: "2 DIAS",
                          dia_realizacao: "12/02/2222",
                          horas: "13h00",
                          imagemEvento:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKeOAXzBhqQCDcid2tD1HJiWUzECWBpuU_ozXny7mC&s",
                          organizacao: "assets/UnivemIMG.png"),
                      CardEventosInscritos(
                          nomeEvento: "Festa de Formatura",
                          dias_faltam: "É HOJE!",
                          dia_realizacao: "15/12/2023",
                          horas: "19h00",
                          imagemEvento:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZh_ed8ebxamWQoJtWg8cF1fOvOYIEr0Tkaw17UpGV1RGydNI3TxyfoqwNTbvOxrpOMN0&usqp=CAU",
                          organizacao: "assets/UnivemIMG.png"),
                      CardEventosInscritos(
                          nomeEvento: "Visita Técnica",
                          dias_faltam: "10 DIAS",
                          dia_realizacao: "20/05/2023",
                          horas: "7h10",
                          imagemEvento:
                              "https://i0.wp.com/eztravel.com.br/wp-content/uploads/2022/01/elizeu-dias-seq9dyzse6c-unsplash.jpeg",
                          organizacao: "assets/UnivemIMG.png")
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 50),

              Text(
                "Eventos em alta",
                style: GoogleFonts.raleway(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),


              SingleChildScrollView(
                scrollDirection: Axis.horizontal,

                child: Row(
                  children: [
                    Eventos_Alta(),
                    Eventos_Alta(),
                    Eventos_Alta(),
                    Eventos_Alta(),
                    Eventos_Alta(),
                    Eventos_Alta(),
                    Eventos_Alta(),

                  ],
                ),
              ),



              const SizedBox(height: 50),

              Text(
                "Recomendados para você",
                style: GoogleFonts.raleway(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),


              SingleChildScrollView(
                scrollDirection: Axis.horizontal,

                child: Row(
                  children: [
                    Recomendados(),
                    Recomendados(),
                    Recomendados(),
                    Recomendados(),

                  ],
                ),
              ),


              const SizedBox(height: 50),

              Text(
                "Algumas instituições",
                style: GoogleFonts.raleway(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),



              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset("assets/UnimarIMG.png",
                        height: 55,
                        width: 55,),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset("assets/UnimarIMG.png",
                        height: 55,
                      width: 55,),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset("assets/UnimarIMG.png",
                        height: 55,
                        width: 55,),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset("assets/EtecIMG.png",
                        height: 55,
                        width: 55,),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset("assets/FaipIMG.png",
                        height: 55,
                        width: 55),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset("assets/UnimarIMG.png",
                        height: 55,
                        width: 55,),
                    ),

                  ],
                ),
              )
            ],
          ),
        ]);
  }

  //Classe para A filtragem dos eventos
  FiltragemEventos(bool palestrasBool, bool compBool, bool bootcampBool,
      IconData icon, bool optionTrue) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            palestras = palestrasBool;
            competicoes = compBool;
            bootcamp = bootcampBool;
          });
        },
        child: Column(children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: optionTrue ? 120 : 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: optionTrue
                  ? BorderRadius.circular(10.0)
                  : BorderRadius.circular(50.0),
              border: Border.all(
                  color: optionTrue ? Colors.transparent : Cores.Azul42A5F5),

              //cor de fundo
              color: optionTrue ? Cores.Azul42A5F5 : Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //icone
                Icon(
                  icon,
                  color: optionTrue ? Cores.Branco : Cores.Azul42A5F5,
                ),

                Padding(
                  padding: optionTrue
                      ? const EdgeInsets.symmetric(horizontal: 10)
                      : const EdgeInsets.all(0),
                  child: Text(
                    optionTrue ? "Palestras" : "",
                    style:
                        GoogleFonts.raleway(fontSize: 12, color: Cores.Branco),
                  ),

                  //texto do filtro em específico
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
