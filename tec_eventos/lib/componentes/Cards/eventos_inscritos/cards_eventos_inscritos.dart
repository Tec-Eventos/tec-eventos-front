import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tec_eventos/cores.dart';

class CardEventosInscritos extends StatefulWidget {
  CardEventosInscritos(
      {Key? key,
      required this.nomeEvento,
      required this.dias_faltam,
      required this.dia_realizacao,
      required this.horas,
      required this.imagemEvento,
      required this.organizacao})
      : super(key: key);

  String nomeEvento,
      dias_faltam,
      dia_realizacao,
      horas,
      imagemEvento,
      organizacao;

  @override
  State<CardEventosInscritos> createState() => _CardEventosInscritosState();
}

class _CardEventosInscritosState extends State<CardEventosInscritos> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 150,
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
              // COMPONENTES QUE VÃO ESTAR DENTRO DO CARD
              Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(

                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //NOME DA INSTITUIÇÃO
                      SizedBox(

                        child: Text(
                          widget.nomeEvento,
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),

                      //DIA QUE VAI ROLAR O EVENTO
                      Text(
                        widget.dias_faltam,
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Cores.Azul1E88E5,
                        ),
                      ),
                      const SizedBox(height: 5),

                      //DIA EM ESPECÍFICO, COM DATA E HORÁRIO

                      Text(
                        widget.dia_realizacao,
                        style: GoogleFonts.inter(
                          fontSize: 9,
                        ),
                      ),
                      Text(
                        widget.horas,
                        style: GoogleFonts.inter(
                          fontSize: 9,
                        ),
                      ),


                      //BOTÃO PARA VER MAIS SOBRE O EVENTO
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 2,
                              minimumSize: Size(87, 17),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7))),
                          onPressed: () {},
                          child: Text(
                            "Ver mais",
                            style: GoogleFonts.raleway(
                                fontSize: 12, fontWeight: FontWeight.bold, color: Cores.Branco),
                          )),
                    ]),
              ),

              //IMAGEM DO EVENTO
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.network(
                    widget.imagemEvento,
                    height: 175,
                    width: 160,
                    fit: BoxFit.fill,
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
                    child: Image.asset(
                      widget.organizacao,
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
    );
  }
}
