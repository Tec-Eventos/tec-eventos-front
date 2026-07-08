import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/core/theme/fontes.dart';
import 'package:tec_eventos/features/events/presentation/providers/events_provider.dart';
import 'package:tec_eventos/pages/paginas_aluno/pag_inscricao_evento/info_evento/info_evento.dart';
import 'package:tec_eventos/widgets/Cards/cardLoading/card_loading.dart';

/// Exibe uma listagem horizontal dos eventos em alta para o Aluno.
class RowEventosEmAlta extends ConsumerWidget {
  const RowEventosEmAlta({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(alunoEventsListProvider);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 380,
      child: eventsAsync.when(
        loading: () => ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            CardLoading(),
            CardLoading(),
          ],
        ),
        error: (err, stack) => Center(
          child: Text(
            "Erro ao carregar eventos",
            style: TextStyle(
              color: Cores.preto,
              fontWeight: FontWeight.w600,
              fontSize: 20,
              fontFamily: Fontes.raleway,
            ),
          ),
        ),
        data: (events) {
          if (events.isEmpty) {
            return Center(
              child: Text(
                'Nenhum evento em alta',
                style: TextStyle(
                  color: Cores.preto,
                  fontWeight: FontWeight.w600,
                  fontFamily: Fontes.raleway,
                  fontSize: 20,
                ),
              ),
            );
          }
          return SizedBox(
            height: 100,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              scrollDirection: Axis.horizontal,
              itemCount: events.length,
              itemBuilder: (_, index) {
                final item = events[index];
                return EventosAlta(
                  imagemEvento: item.imagemEvento,
                  nomeEvento: item.nomeEvento,
                  descricao: item.descricao,
                  organizacaoImagem: item.logoEvento,
                  dataRealizacao: item.dataEvento,
                  horario: item.horario,
                  cdEvento: item.cdEvento,
                  ingressos: item.quantidadeIngressos,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class EventosAlta extends StatefulWidget {
  const EventosAlta({
    Key? key,
    required this.imagemEvento,
    required this.nomeEvento,
    required this.descricao,
    required this.organizacaoImagem,
    required this.dataRealizacao,
    required this.horario,
    required this.cdEvento,
    required this.ingressos,
  }) : super(key: key);

  final String imagemEvento, nomeEvento, descricao, organizacaoImagem;
  final String dataRealizacao, horario;
  final int cdEvento, ingressos;

  @override
  State<EventosAlta> createState() => _EventosAltaState();
}

class _EventosAltaState extends State<EventosAlta> {
  @override
  Widget build(BuildContext context) {
    final InfoEvento navegacao = InfoEvento(
      imagemEvento: widget.imagemEvento,
      imagemOrganizacao: widget.organizacaoImagem,
      diaRealizacao: widget.dataRealizacao,
      nomeEvento: widget.nomeEvento,
      horarioRealizacao: widget.horario,
      cdEvento: widget.cdEvento,
      descricao: widget.descricao,
      ingressos: widget.ingressos,
    );

    const urlImage = 'https://api-tec-eventos-i6hr.onrender.com/imagem/';
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
                child: navegacao,
                type: PageTransitionType.bottomToTop,
              ),
            );
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
            child: Column(
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
                      SizedBox(
                        child: Row(
                          children: [
                            Text(
                              widget.nomeEvento,
                              style: TextStyle(
                                fontFamily: Fontes.raleway,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Cores.preto,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
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
                              color: Cores.azul42A5F5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.descricao,
                        style: TextStyle(
                          fontFamily: Fontes.raleway,
                          fontSize: 12,
                          color: Cores.preto,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
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
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  child: navegacao,
                                  type: PageTransitionType.bottomToTop,
                                ),
                              );
                            },
                            child: Text(
                              "Ver mais",
                              style: TextStyle(
                                fontFamily: Fontes.raleway,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Cores.branco,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
