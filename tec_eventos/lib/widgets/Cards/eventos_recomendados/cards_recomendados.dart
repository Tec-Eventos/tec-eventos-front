import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/paginas_aluno/pag_inscricao_evento/info_evento/info_evento.dart';

class Recomendados extends StatefulWidget {
  const Recomendados(
      {Key? key,
      required this.nomeEvento,
      required this.imagemEvento,
      required this.imagemOrganizacao,
      required this.descricao})
      : super(key: key);

  final String nomeEvento, imagemEvento, imagemOrganizacao, descricao;

  @override
  State<Recomendados> createState() => _RecomendadosState();
}

class _RecomendadosState extends State<Recomendados> {
  @override
  Widget build(BuildContext context) {
    final InfoEvento navegacao = InfoEvento(
        imagemEvento: widget.imagemEvento,
        imagemOrganizacao: widget.imagemOrganizacao,
        diaRealizacao: "10/06",
        nomeEvento: widget.nomeEvento,
        horarioRealizacao: "10:00");

    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
      child: SizedBox(
        width: 305,
        child: GestureDetector(
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
                      widget.imagemEvento,
                      height: 180,
                      width: 305,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      leading: Image.asset(widget.imagemOrganizacao),

                      //nome do Evento
                      title: Text(
                        widget.nomeEvento,
                        style: TextStyle(
                          fontFamily: Fontes.raleway,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Cores.preto),
                      ),

                      //descrição dele
                      subtitle: Text(
                        widget.descricao,
                        style: TextStyle(
                          fontFamily: Fontes.raleway,
                            fontSize: 7, color: Cores.preto),
                      ),
                      trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 2,
                              minimumSize: const Size(14, 18),
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
                            "Info",
                            style: TextStyle(
                              fontFamily: Fontes.raleway,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Cores.branco),
                          )),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
