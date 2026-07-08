import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/core/theme/fontes.dart';
import 'package:tec_eventos/features/events/presentation/providers/events_provider.dart';
import 'package:tec_eventos/pages/paginas_aluno/pag_inscricao_evento/info_evento/info_evento.dart';
import 'package:tec_eventos/pages/paginas_aluno/pag_inscricao_evento/info_evento_pendentes/info_evento_pendente.dart';
import 'package:tec_eventos/widgets/Cards/cardLoading/card_loading.dart';

/// Exibe uma listagem horizontal dos eventos aos quais o Aluno está inscrito.
class RowCardEventosInscritos extends ConsumerWidget {
  const RowCardEventosInscritos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(alunoEventsListProvider);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
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
                'Nenhum evento inscrito',
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
            height: 210,
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              padding: const EdgeInsets.all(16),
              scrollDirection: Axis.horizontal,
              itemCount: events.length,
              itemBuilder: (_, index) {
                final item = events[index];
                return CardEventosInscritos(
                  nomeEvento: item.nomeEvento,
                  diasFaltam: "É HOJE",
                  diaRealizacao: item.dataEvento,
                  horas: item.horario,
                  imagemEvento: item.imagemEvento,
                  organizacao: item.logoEvento,
                  cdEvento: item.cdEvento,
                  descricao: item.descricao,
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

class CardEventosInscritos extends StatefulWidget {
  const CardEventosInscritos({
    Key? key,
    required this.nomeEvento,
    required this.diasFaltam,
    required this.diaRealizacao,
    required this.horas,
    required this.imagemEvento,
    required this.organizacao,
    required this.descricao,
    required this.cdEvento,
    required this.ingressos,
  }) : super(key: key);

  final String nomeEvento, diasFaltam, imagemEvento, organizacao, descricao;
  final String diaRealizacao, horas;
  final int cdEvento, ingressos;

  @override
  State<CardEventosInscritos> createState() => _CardEventosInscritosState();
}

class _CardEventosInscritosState extends State<CardEventosInscritos> {
  @override
  Widget build(BuildContext context) {
    DateTime data = DateTime.tryParse(widget.diaRealizacao)?.toLocal() ?? DateTime.now();
    String dataFormatada = "${data.day}/${data.month}/${data.year}";

    int hourVal = 0;
    int minVal = 0;
    final splitted = widget.horas.split(":");
    if (splitted.isNotEmpty) hourVal = int.tryParse(splitted[0]) ?? 0;
    if (splitted.length > 1) minVal = int.tryParse(splitted[1]) ?? 0;

    TimeOfDay hora = TimeOfDay(
      hour: hourVal,
      minute: minVal,
    );

    String horaFormatada = "${hora.hour}h${hora.minute.toString().padLeft(2, '0')}";

    final urlImage = 'https://api-tec-eventos-i6hr.onrender.com/imagem/';
    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
      child: SizedBox(
        height: 131,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                child: const InfoEventoPendentes(),
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
              borderRadius: BorderRadius.circular(7.0),
            ),
            color: Cores.branco,
            elevation: 6,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.nomeEvento,
                        style: TextStyle(
                          fontFamily: Fontes.raleway,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Cores.preto,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.diasFaltam,
                        style: TextStyle(
                          fontFamily: Fontes.ralewayBold,
                          color: Cores.vermelho,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 11,
                            color: Cores.cinza6A6666,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            dataFormatada,
                            style: TextStyle(
                              fontFamily: Fontes.raleway,
                              fontSize: 10,
                              color: Cores.cinza6A6666,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            Icons.access_time_outlined,
                            size: 11,
                            color: Cores.cinza6A6666,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            horaFormatada,
                            style: TextStyle(
                              fontFamily: Fontes.raleway,
                              fontSize: 10,
                              color: Cores.cinza6A6666,
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
