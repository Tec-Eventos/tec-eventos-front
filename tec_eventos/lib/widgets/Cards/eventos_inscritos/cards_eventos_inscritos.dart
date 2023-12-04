import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/data/http/http_client.dart';
import 'package:tec_eventos/data/repositories/events_repository.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/paginas_aluno/pag_inscricao_evento/info_evento/info_evento.dart';
import 'package:tec_eventos/utils/stores/events_store.dart';
import 'package:tec_eventos/widgets/Cards/cardLoading/card_loading.dart';

class RowCardEventosInscritos extends StatefulWidget {
  const RowCardEventosInscritos({super.key});

  @override
  State<RowCardEventosInscritos> createState() =>
      _RowCardEventosInscritosState();
}

class _RowCardEventosInscritosState extends State<RowCardEventosInscritos> {
  final EventsStore store = EventsStore(
    repository: EventsRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();
    store.getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: AnimatedBuilder(
          animation:
              Listenable.merge([store.isLoading, store.erro, store.state]),
          builder: (context, child) {
            if (store.isLoading.value) {
              return ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CardLoading(),
                    CardLoading(),
                  ]);
            }

            if (store.erro.value.isNotEmpty) {
              return Center(
                child: Text(
                  "Erro na requisição",
                  style: TextStyle(
                    color: Cores.preto,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    fontFamily: Fontes.raleway,
                  ),
                ),
              );
            }

            if (store.state.value.isEmpty) {
              return Center(
                child: Text(
                  'Nenhum evento inscrito',
                  style: TextStyle(
                      color: Cores.preto,
                      fontWeight: FontWeight.w600,
                      fontFamily: Fontes.raleway,
                      fontSize: 20),
                ),
              );
            } else {
              return SizedBox(
                height: 210,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  padding: const EdgeInsets.all(16),
                  scrollDirection: Axis.horizontal,
                  itemCount: store.state.value.length,
                  itemBuilder: (_, index) {
                    final item = store.state.value[index];

                    if (item != null) {
                      return CardEventosInscritos(
                          nomeEvento: item.nomeEvento,
                          diasFaltam: "É HOJE",
                          diaRealizacao: item.dataEvento,
                          horas: item.horario,
                          imagemEvento: item.imagemEvento,
                          organizacao: item.logoEvento);
                    } else {
                      return Container();
                    }
                  },
                ),
              );
            }
          }),
    );
  }
}

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

    const urlImage = 'http://192.168.1.112:8080/imagem/';
    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
      child: SizedBox(
        height: 131,
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
                            style: TextStyle(
                              fontFamily: Fontes.raleway,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),

                        //DIA QUE VAI ROLAR O EVENTO
                        Text(
                          widget.diasFaltam,
                          style: TextStyle(
                            fontFamily: Fontes.raleway,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Cores.azul1E88E5,
                          ),
                        ),
                        const SizedBox(height: 5),

                        //DIA EM ESPECÍFICO, COM DATA E HORÁRIO

                        Text(
                          widget.diaRealizacao,
                          style: TextStyle(
                            fontFamily: Fontes.inter,
                            fontSize: 9,
                          ),
                        ),
                        Text(
                          widget.horas,
                          style: TextStyle(
                            fontFamily: Fontes.inter,
                            fontSize: 9,
                          ),
                        ),

                        //BOTÃO PARA VER MAIS SOBRE O EVENTO
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 2,
                                backgroundColor: Cores.azul42A5F5,
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
                              style: TextStyle(
                                  fontFamily: Fontes.raleway,
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
                      urlImage + widget.imagemEvento,
                      fit: BoxFit.cover,
                      width: 160,
                      height: MediaQuery.of(context).size.height / 1,
                    ),
                    Container(
                      width: 160,
                      height: 25,
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
                      child: Image.network(
                        urlImage + widget.organizacao,
                        fit: BoxFit.scaleDown,
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
    ).animate().slideX();
  }
}
