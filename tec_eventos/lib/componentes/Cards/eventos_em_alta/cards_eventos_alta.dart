import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tec_eventos/cores.dart';

class Eventos_Alta extends StatefulWidget {
  const Eventos_Alta({Key? key}) : super(key: key);

  @override
  State<Eventos_Alta> createState() => _Eventos_AltaState();
}

class _Eventos_AltaState extends State<Eventos_Alta> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
      child: SizedBox(
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
                      width: 95,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Competição",
                        style: GoogleFonts.raleway(
                            fontSize: 12,
                            color: Cores.Branco,
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
                          Icon(
                            Icons.location_on_outlined,
                            size: 15,
                            color: Cores.Azul42A5F5,
                          ),
                          Text(
                            "Marília, SP",
                            style: GoogleFonts.raleway(
                                fontSize: 12, color: Cores.Azul42A5F5),
                          ),
                        ],
                      ),

                      const SizedBox(height: 5),

                      //DIA EM ESPECÍFICO, COM DATA E HORÁRIO

                      Text(
                        "LoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremmLoremLoremLoremLoremLorem",
                        style: GoogleFonts.raleway(
                          fontSize: 12,
                        ),
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
                                  elevation: 2,
                                  minimumSize: Size(100, 18),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7))),
                              onPressed: () {},
                              child: Text(
                                "Ver mais",
                                style: GoogleFonts.raleway(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Cores.Branco),
                              )),
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
