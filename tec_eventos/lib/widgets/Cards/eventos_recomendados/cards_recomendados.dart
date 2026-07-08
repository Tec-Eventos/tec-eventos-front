import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/core/theme/fontes.dart';
import 'package:tec_eventos/features/events/presentation/providers/events_provider.dart';
import 'package:tec_eventos/pages/paginas_aluno/pag_inscricao_evento/info_evento/info_evento.dart';
import 'package:tec_eventos/widgets/Cards/cardLoading/card_loading.dart';

/// Exibe uma listagem horizontal dos eventos recomendados para o Aluno.
class RowEventosRecomendados extends ConsumerWidget {
  const RowEventosRecomendados({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(alunoEventsListProvider);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 340,
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
            "Erro ao carregar eventos recomendados",
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
                'Nenhum evento recomendado',
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
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              scrollDirection: Axis.horizontal,
              itemCount: events.length,
              itemBuilder: (_, index) {
                final item = events[index];
                return Recomendados(
                  nomeEvento: item.nomeEvento,
                  imagemEvento: item.imagemEvento,
                  imagemOrganizacao: item.logoEvento,
                  descricao: item.descricao,
                  cdEvento: item.cdEvento,
                  data: item.dataEvento,
                  horario: item.horario,
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

class Recomendados extends StatefulWidget {
  const Recomendados({
    Key? key,
    required this.nomeEvento,
    required this.imagemEvento,
    required this.imagemOrganizacao,
    required this.descricao,
    required this.cdEvento,
    required this.data,
    required this.horario,
    required this.ingressos,
  }) : super(key: key);

  final String nomeEvento, imagemEvento, imagemOrganizacao, descricao;
  final int cdEvento, ingressos;
  final String data, horario;

  @override
  State<Recomendados> createState() => _RecomendadosState();
}

class _RecomendadosState extends State<Recomendados> {
  @override
  Widget build(BuildContext context) {
    final InfoEvento navegacao = InfoEvento(
      imagemEvento: widget.imagemEvento,
      imagemOrganizacao: widget.imagemOrganizacao,
      diaRealizacao: widget.data,
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
        width: 172,
        height: 251,
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
            shadowColor: Cores.preto,
            borderOnForeground: false,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.white,
            elevation: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Image.network(
                      urlImage + widget.imagemEvento,
                      height: 106,
                      width: 172,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.nomeEvento,
                        style: TextStyle(
                          fontFamily: Fontes.ralewayBold,
                          fontSize: 16,
                          color: Cores.preto,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.descricao,
                        style: TextStyle(
                          fontFamily: Fontes.raleway,
                          fontSize: 11,
                          color: Cores.preto,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(
                            urlImage + widget.imagemOrganizacao,
                            height: 16,
                            width: 53,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Cores.azul42A5F5,
                              elevation: 2,
                              minimumSize: const Size(60, 20),
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
                              "Inscrever",
                              style: TextStyle(
                                fontFamily: Fontes.raleway,
                                fontSize: 10,
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
