import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/paginas/pag_inscricao_evento/info_evento/info_evento.dart';

class CardEventosInscritos extends StatefulWidget {
  const CardEventosInscritos(
      {Key? key,
      required this.nomeEvento,
      required this.diasFaltam,
      required this.diaRealizacao,
      required this.horas,
      required this.imagemEvento,
      required this.organizacao})
      : super(key: key);

  final String nomeEvento,
      diasFaltam,
      diaRealizacao,
      horas,
      imagemEvento,
      organizacao;

  @override
  State<CardEventosInscritos> createState() => _CardEventosInscritosState();
}

class _CardEventosInscritosState extends State<CardEventosInscritos> {
  @override
  Widget build(BuildContext context) {
    final InfoEvento navegacao = InfoEvento(
        imagemEvento: widget.imagemEvento,
        imagemOrganizacao: widget.organizacao,
        diaRealizacao: widget.diaRealizacao,
        nomeEvento: widget.nomeEvento,
        horarioRealizacao: widget.horas);

    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
      child: SizedBox(
        height: 160,
        child:
            //CUSTOMIZAÇÃO DO CARD
            GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    child: navegacao, type: PageTransitionType.bottomToTop));
          },
          child: Card(
            margin: const EdgeInsets.only(top: 20),
            shadowColor: Cores.preto,
            borderOnForeground: false,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
            color: Cores.branco,
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
                          widget.diasFaltam,
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Cores.azul1E88E5,
                          ),
                        ),
                        const SizedBox(height: 5),

                        //DIA EM ESPECÍFICO, COM DATA E HORÁRIO

                        Text(
                          widget.diaRealizacao,
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
                                minimumSize: const Size(87, 17),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: navegacao,
                                      type: PageTransitionType.bottomToTop));
                            },
                            child: Text(
                              "Ver mais",
                              style: GoogleFonts.raleway(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Cores.branco),
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

                      //imagem da organização do evento
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
      ),
    );
  }
}
