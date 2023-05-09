import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: ListView(
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

                  Card(
                    margin: EdgeInsets.only(top: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.pink,
                    elevation: 10,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Column(
                              children: [
                                Text("Unicamp"),
                                Text("É HOJE!"),
                                Text("21/02/2023"),
                                Text("13h00"),
                                TextButton(
                                    onPressed: () {}, child: Text("Ver mais"))
                              ],
                            ),
                          ),
                          title: Image.network(
                              "https://kleeventos.com.br/wp-content/uploads/2019/11/AdobeStock_100250075-1030x687.jpeg"),
                        ),
                      ],
                    ),
                  ),




                   Row(

                      children: [


                        Column(
                          children: [
                          Text("Unicamp"),
                          Text("É HOJE!"),
                          Text("21/02/2023"),
                          Text("13h00"),
                          TextButton(onPressed: () {}, child: Text("Ver mais"))
                        ]),

                        Image.network("https://distrito.me/wp-content/uploads/2022/06/Eventos-de-inovacao-confira-o-calendario-para-2022.png",
                        height: 120,
                        width: 240,
                        ),

                      ],
                    ),
                ],
              ),
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
            width: optionTrue ? 120 : MediaQuery.of(context).size.width / 8,
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
                  child:
                      //texto
                      Text(
                    optionTrue ? "Palestras" : "",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                        fontSize: 12.0, color: Cores.Branco),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
