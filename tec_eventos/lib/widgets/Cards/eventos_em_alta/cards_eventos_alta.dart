import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/data/http/http_client.dart';
import 'package:tec_eventos/data/repositories/events_repository.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/paginas_aluno/pag_inscricao_evento/info_evento/info_evento.dart';
import 'package:tec_eventos/utils/stores/events_store.dart';
import 'package:tec_eventos/widgets/Cards/cardLoading/card_loading.dart';

class RowEventosEmAlta extends StatefulWidget {
  const RowEventosEmAlta({super.key});

  @override
  State<RowEventosEmAlta> createState() => _RowEventosEmAltaState();
}

class _RowEventosEmAltaState extends State<RowEventosEmAlta> {
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
      height: 380,
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
                  store.erro.value,
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
                height: 100,
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  scrollDirection: Axis.horizontal,
                  itemCount: store.state.value.length,
                  itemBuilder: (_, index) {
                    final item = store.state.value[index];

                    return EventosAlta(
                      imagemEvento: item.imagemEvento,
                      nomeEvento: item.nomeEvento,
                      descricao: item.descricao,
                      organizacaoImagem: item.logoEvento,
                      dataRealizacao: item.dataEvento,
                      horario: item.horario,
                    );
                  },
                ),
              );
            }
          }),
    );
  }
}

class EventosAlta extends StatefulWidget {
  const EventosAlta(
      {Key? key,
      required this.imagemEvento,
      required this.nomeEvento,
      required this.descricao,
      required this.organizacaoImagem,
      required this.dataRealizacao,
      required this.horario})
      : super(key: key);

  final String imagemEvento,
      dataRealizacao,
      horario,
      nomeEvento,
      descricao,
      organizacaoImagem;

  @override
  State<EventosAlta> createState() => _EventosAltaState();
}

class _EventosAltaState extends State<EventosAlta> {
  @override
  Widget build(BuildContext context) {
    final InfoEvento navegacao = InfoEvento(
        imagemEvento: widget.imagemEvento,
        imagemOrganizacao: widget.organizacaoImagem,
        diaRealizacao: "10/06",
        nomeEvento: widget.nomeEvento,
        horarioRealizacao: "10:00");

    final urlImage = 'http://192.168.1.112:8080/imagem/';
    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
      child: SizedBox(
        width: 285,
        height: 190,
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
                      urlImage + widget.imagemEvento,
                      height: 158,
                      width: 285,
                      fit: BoxFit.cover,
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
                          child: Row(
                            children: [
                              Text(
                                widget.nomeEvento,
                                style: TextStyle(
                                    fontFamily: Fontes.raleway,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Cores.preto),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        //DIA QUE VAI ROLAR O EVENTO

                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 15,
                              color: Cores.azul42A5F5,
                            ),
                            Text(
                              "Marília, SP",
                              style: TextStyle(
                                  fontFamily: Fontes.raleway,
                                  fontSize: 12,
                                  color: Cores.azul42A5F5),
                            ),
                          ],
                        ),

                        const SizedBox(height: 5),

                        //DIA EM ESPECÍFICO, COM DATA E HORÁRIO

                        Text(
                          widget.descricao,
                          style: TextStyle(
                              fontFamily: Fontes.raleway,
                              fontSize: 12,
                              color: Cores.preto),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),

                        //BOTÃO PARA VER MAIS SOBRE O EVENTO
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                              urlImage + widget.organizacaoImagem,
                              height: 19,
                              width: 62,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Cores.azul42A5F5,
                                    elevation: 2,
                                    minimumSize: const Size(100, 18),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(7))),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: navegacao,
                                          type:
                                              PageTransitionType.bottomToTop));
                                },
                                child: Text(
                                  "Ver mais",
                                  style: TextStyle(
                                      fontFamily: Fontes.raleway,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Cores.branco),
                                )),
                          ],
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
