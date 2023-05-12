import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tec_eventos/componentes/Appbar/appbar.dart';
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





class _PrincipalPageState extends State<PrincipalPage> {
  @override
  Widget build(BuildContext context) {

    //LISTA DOS EVENTOS INSCRITOS
    // List<Widget> EventosInscritos = [
    //
    //   Container(
    //     width: 500,
    //
    //     child:
    //     //CUSTOMIZAÇÃO DO CARD
    //     Card(
    //       margin: EdgeInsets.only(top: 20),
    //       shadowColor: Cores.Preto,
    //       borderOnForeground: false,
    //       clipBehavior: Clip.hardEdge,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(7.0),
    //       ),
    //       color: Colors.white,
    //       elevation: 6,
    //       child:
    //
    //       //COMPONENTES QUE VÃO ESTAR DENTRO DO CARD
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Column(children: [
    //             SizedBox(height: MediaQuery.of(context).size.height / 90),
    //             Padding(
    //               padding: const EdgeInsets.only(left: 8.0),
    //               child:
    //
    //               //NOME DA INSTITUIÇÃO
    //               Text(
    //                 "Unicamp",
    //                 style: GoogleFonts.raleway(
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: MediaQuery.of(context).size.width / 30,
    //                 ),
    //               ),
    //             ),
    //             SizedBox(height: MediaQuery.of(context).size.height / 140),
    //             //DIA QUE VAI ROLAR O EVENTO
    //             Text(
    //               "É HOJE!",
    //               style: GoogleFonts.raleway(
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: MediaQuery.of(context).size.width / 30,
    //                 color: Cores.Azul1E88E5,
    //               ),
    //             ),
    //             SizedBox(height: MediaQuery.of(context).size.height / 150),
    //
    //
    //             //DIA EM ESPECÍFICO, COM DATA E HORÁRIO
    //             Padding(
    //               padding: const EdgeInsets.all(1.0),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     "21/02/2023",
    //                     style: GoogleFonts.inter(
    //                       fontSize: MediaQuery.of(context).size.width / 45,
    //                     ),
    //                   ),
    //                   Text(
    //                     "13h00",
    //                     style: GoogleFonts.inter(
    //                       fontSize: MediaQuery.of(context).size.width / 45,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //
    //
    //             //BOTÃO PARA VER MAIS SOBRE O EVENTO
    //             Padding(
    //               padding: const EdgeInsets.only(left: 8.0),
    //               child: ElevatedButton(
    //                   style: ElevatedButton.styleFrom(
    //                       elevation: 2,
    //                       minimumSize: Size(10, 17),
    //                       shape: RoundedRectangleBorder(
    //                           borderRadius:
    //                           BorderRadius.circular(7))),
    //                   onPressed: () {},
    //                   child: Text(
    //                     "Ver mais",
    //                     style: GoogleFonts.raleway(
    //                         fontSize: MediaQuery.of(context).size.width / 40,
    //                         fontWeight: FontWeight.bold),
    //                   )),
    //             ),
    //           ]),
    //
    //
    //           //IMAGEM DO EVENTO
    //           Stack(
    //             alignment: Alignment.bottomCenter,
    //             children: [
    //               Image.network(
    //                 "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKeOAXzBhqQCDcid2tD1HJiWUzECWBpuU_ozXny7mC&s",
    //                 height: 120,
    //                 width: MediaQuery.of(context).size.width * 0.4,
    //                 fit: BoxFit.fill,
    //               ),
    //               Container(
    //                 width: MediaQuery.of(context).size.width * 0.4,
    //                 height: 25,
    //                 decoration: BoxDecoration(
    //                   boxShadow: [
    //                     BoxShadow(
    //                       color: Colors.black,
    //                       blurRadius: 7,
    //                       // Shadow position
    //                     ),
    //                   ],
    //                 ),
    //                 child: Image.asset(
    //                   "assets/UnivemIMG.png",
    //                   height: 20,
    //                   alignment: Alignment.center,
    //                 ),
    //               ),
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    //
    // ];




    return Scaffold(
      backgroundColor: Colors.white,
      drawer:
          //Drawer,ou seja, o menu que aparece quando clica no botão
          DrawerPages(),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          //appbar, ou seja, parte superior
          AppBarPages(),
        ],

        //aqui é o corpo da página, ou seja,

        // onde vai ficar o conteúdo dela, deixe ela dentro de um ListView com o Axis.vertical.
        body:

        ListView(
          padding: const EdgeInsets.symmetric(horizontal: 13),
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

                  SizedBox(height: 50),

                  Text(
                    "Eventos que você está inscrito",
                    style: GoogleFonts.raleway(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  //Carrossel que o usuário poderá mexer.
                  // CarouselSlider(
                  //     items: EventosInscritos.map((Widget) => Widget).toList(),
                  //     options: CarouselOptions(
                  //
                  //       enlargeCenterPage: true,
                  //
                  //       aspectRatio: 18/7,
                  //       autoPlayInterval: const Duration(seconds: 3),
                  //     )),



                  //SingleScroll
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 1.5,


                              child:
                              //CUSTOMIZAÇÃO DO CARD
                              Card(
                                margin: EdgeInsets.only(top: 20),
                                shadowColor: Cores.Preto,
                                borderOnForeground: false,
                                clipBehavior: Clip.hardEdge,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                color: Colors.white,
                                elevation: 6,
                                child:

                                //COMPONENTES QUE VÃO ESTAR DENTRO DO CARD
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(children: [
                                      SizedBox(height: 9),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child:

                                        //NOME DA INSTITUIÇÃO
                                        Text(
                                          "Unicamp",
                                          style: GoogleFonts.raleway(
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context).size.width / 30,
                                        ),
                                      ),
                                      ),
                                      SizedBox(height: 5),

                                      //DIA QUE VAI ROLAR O EVENTO
                                      Text(
                                        "É HOJE!",
                                        style: GoogleFonts.raleway(
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context).size.width / 30,
                                          color: Cores.Azul1E88E5,
                                        ),
                                      ),
                                      SizedBox(height: 5),


                                      //DIA EM ESPECÍFICO, COM DATA E HORÁRIO
                                      Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "21/02/2023",
                                              style: GoogleFonts.inter(
                                                fontSize: MediaQuery.of(context).size.width / 40,
                                              ),
                                            ),
                                            Text(
                                              "13h00",
                                              style: GoogleFonts.inter(
                                                fontSize: MediaQuery.of(context).size.width / 40,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),


                                      //BOTÃO PARA VER MAIS SOBRE O EVENTO
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                elevation: 2,
                                                minimumSize: Size(
                                                    MediaQuery.of(context).size.width / 20,
                                                    MediaQuery.of(context).size.height / 50),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(7))),
                                            onPressed: () {},
                                            child: Text(
                                              "Ver mais",
                                              style: GoogleFonts.raleway(
                                                  fontSize: MediaQuery.of(context).size.width / 35,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                    ]),


                                    //IMAGEM DO EVENTO
                                    Stack(

                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Image.network(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKeOAXzBhqQCDcid2tD1HJiWUzECWBpuU_ozXny7mC&s",
                                          height: MediaQuery.of(context).size.width * 0.320,
                                          width: MediaQuery.of(context).size.width / 2.4,
                                          fit: BoxFit.fill,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width / 2.5,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black,
                                                blurRadius: 7,
                                                // Shadow position
                                              ),
                                            ],
                                          ),
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



                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.5,

                              child:
                              //CUSTOMIZAÇÃO DO CARD
                              Card(
                                margin: EdgeInsets.only(top: 20),
                                shadowColor: Cores.Preto,
                                borderOnForeground: false,
                                clipBehavior: Clip.hardEdge,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                color: Colors.white,
                                elevation: 6,
                                child:

                                //COMPONENTES QUE VÃO ESTAR DENTRO DO CARD
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(children: [
                                      SizedBox(height: 9),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child:

                                        //NOME DA INSTITUIÇÃO
                                        Text(
                                          "Unicamp",
                                          style: GoogleFonts.raleway(
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context).size.width / 30,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),

                                      //DIA QUE VAI ROLAR O EVENTO
                                      Text(
                                        "É HOJE!",
                                        style: GoogleFonts.raleway(
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context).size.width / 30,
                                          color: Cores.Azul1E88E5,
                                        ),
                                      ),
                                      SizedBox(height: 5),


                                      //DIA EM ESPECÍFICO, COM DATA E HORÁRIO
                                      Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "21/02/2023",
                                              style: GoogleFonts.inter(
                                                fontSize: MediaQuery.of(context).size.width / 40,
                                              ),
                                            ),
                                            Text(
                                              "13h00",
                                              style: GoogleFonts.inter(
                                                fontSize: MediaQuery.of(context).size.width / 40,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),


                                      //BOTÃO PARA VER MAIS SOBRE O EVENTO
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                elevation: 2,
                                                minimumSize: Size(
                                                    MediaQuery.of(context).size.width / 20,
                                                    MediaQuery.of(context).size.height / 50),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(7))),
                                            onPressed: () {},
                                            child: Text(
                                              "Ver mais",
                                              style: GoogleFonts.raleway(
                                                  fontSize: MediaQuery.of(context).size.width / 35,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                    ]),


                                    //IMAGEM DO EVENTO
                                    Stack(

                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Image.network(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKeOAXzBhqQCDcid2tD1HJiWUzECWBpuU_ozXny7mC&s",
                                          height: MediaQuery.of(context).size.width * 0.320,
                                          width: MediaQuery.of(context).size.width / 2.4,
                                          fit: BoxFit.fill,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width / 2.5,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black,
                                                blurRadius: 7,
                                                // Shadow position
                                              ),
                                            ],
                                          ),
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
                        ],
                      ),
                    ),
                  ),





                  SizedBox(height: 50),

                  Text(
                    "Eventos que você está inscrito",
                    style: GoogleFonts.raleway(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),


                ],
              ),
            ],
          ),
        ),


      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Cores.AzulCinzento,
            borderRadius: BorderRadius.all(Radius.circular(24)),

          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [


                  Icon(Icons.home_filled),
                  Icon(Icons.home_filled),
                  Icon(Icons.home_filled),
                  Icon(Icons.home_filled),


            ],
          ),
    ),
    ),
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
            duration: Duration(milliseconds: 300),
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
                      ? EdgeInsets.symmetric(horizontal: 10)
                      : EdgeInsets.all(0),
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
