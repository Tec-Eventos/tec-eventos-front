import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tec_eventos/cores.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

bool eventosParticipados = false;
bool medalhas = false;
bool favoritos = false;

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.Branco,
      body: Column(
        children: [

          //container com a cor de fundo alterada e com seus radius específicado
          Container(
            height: MediaQuery.of(context).size.height / 2.6,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),

              color: Cores.AzulBebe,
            ),



            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                SizedBox(height: MediaQuery.of(context).size.height / 40),
                //descrição do perfil dentro do container
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage("assets/imgPerfil.png"),
                ),

                SizedBox(height: 10),
                Text(
                  "Gabriel Felix",
                  style: GoogleFonts.raleway(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height / 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text("1000",
                          style: GoogleFonts.raleway(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        Text("Seguindo",
                          style: GoogleFonts.raleway(
                            fontSize: 12.0,
                          ),),
                      ],
                    ),

                    VerticalDivider(
                      color: Colors.amber,
                    ),

                    Column(
                      children: [
                        Text("1000",
                          style: GoogleFonts.raleway(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        Text("Seguidores",
                          style: GoogleFonts.raleway(
                            fontSize: 12.0,
                          ),),
                      ],
                    )
                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height / 40),

                Text("Desempregado",
                  style: GoogleFonts.raleway(
                    fontSize: 13.0,
                  ),),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on_outlined),
                    Text("Marília-SP",
                      style: GoogleFonts.raleway(
                        fontSize: 13.0,

                      ),),
                  ],
                ),

              ],
            ),
          ),

          Container(
            height: 50,
            width: 550,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 4.0)),
            alignment: Alignment.center,

            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,

              children: [
                Icon(Icons.location_on),
                Icon(Icons.location_on),

                Icon(Icons.location_on),
                Icon(Icons.location_on),
                Icon(Icons.location_on),
                Icon(Icons.location_on),
                Icon(Icons.location_on),

              ],
            ),
          )
        ],
      ),
    );
  }
}
