import 'dart:async';


import 'package:carousel_slider/carousel_slider.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tec_eventos/componentes/Appbar/appbar.dart';
import 'package:tec_eventos/componentes/Cards/eventos_inscritos/cards_eventos_inscritos.dart';
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

List<String> imagens = [
  'assets/UnivemIMG.png',
  'assets/UnivemIMG.png',
  'assets/UnivemIMG.png',
  'assets/UnivemIMG.png',
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
              "Eventos que você está inscrito",
              style: GoogleFonts.raleway(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(
              width: 285,
              child: Card(

                margin: EdgeInsets.only(top: 20),
                shadowColor: Cores.Preto,
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
                          "https://i0.wp.com/eztravel.com.br/wp-content/uploads/2022/01/elizeu-dias-seq9dyzse6c-unsplash.jpeg",
                          height: 158,
                          width: 285,
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 88,
                            height: 15,
                            decoration: BoxDecoration(
                            color: Colors.blue,
                              borderRadius: BorderRadius.circular(50)
                            ),

                            child: Text("Competição", style: GoogleFonts.raleway(fontSize: 12, color: Cores.Branco, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
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

                              child: Text(
                                "Univem Fest",
                                style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            //DIA QUE VAI ROLAR O EVENTO



                          Row(
                            children: [
                              Icon(Icons.location_on_outlined, size: 15, color: Cores.Azul42A5F5,),
                              Text("Marília, SP", style: GoogleFonts.raleway(fontSize: 12, color: Cores.Azul42A5F5),),
                            ],
                          ),

                            const SizedBox(height: 5),

                            //DIA EM ESPECÍFICO, COM DATA E HORÁRIO

                            Text(
                              "LoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremmLoremLoremLoremLoremLorem",
                              style: GoogleFonts.raleway(fontSize: 12,),),



                            //BOTÃO PARA VER MAIS SOBRE O EVENTO
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                
                                Image.asset("assets/UnivemIMG.png", height: 19, width: 62,),
                                
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 2,
                                        minimumSize: Size(100, 18),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(7))),
                                    onPressed: () {},
                                    child: Text(
                                      "Ver mais",
                                      style: GoogleFonts.raleway(
                                          fontSize: 12, fontWeight: FontWeight.bold, color: Cores.Branco),
                                    )),
                              ],
                            ),
                          ]),
                    ),

                  ],
                ),
              ),
            ),



            const SizedBox(height: 50),

            Text(
              "Recomendados para você",
              style: GoogleFonts.raleway(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(
              width: 285,
              child: Card(

                margin: EdgeInsets.only(top: 20),
                shadowColor: Cores.Preto,
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
                          "https://i0.wp.com/eztravel.com.br/wp-content/uploads/2022/01/elizeu-dias-seq9dyzse6c-unsplash.jpeg",
                          height: 158,
                          width: 285,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),


                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: Image.asset("assets/UnivemIMG.png"),

                        title: Text("Univem"),
                        subtitle: Text("LoreLoremLoremLoremLoremLoremm"),
                      )
                    ),

                  ],
                ),
              ),
            ),

          ],
        ),
      ],
    );
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






