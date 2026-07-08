import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/core/theme/fontes.dart';
import 'package:tec_eventos/features/events/domain/entities/app_event.dart';
import 'package:tec_eventos/features/events/presentation/providers/events_provider.dart';
import 'package:tec_eventos/pages/paginas_aluno/pag_inscricao_evento/info_evento/info_evento.dart';

/// Exibe uma linha horizontal com os cartões de eventos disponíveis para o Aluno.
///
/// Consome reativamente o [alunoEventsListProvider] para atualizar a exibição.
class RowCardEventosParaVoce extends ConsumerWidget {
  /// Construtor padrão.
  const RowCardEventosParaVoce({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(alunoEventsListProvider);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: eventsAsync.when(
        data: (events) {
          if (events.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                  'Nenhum evento disponível no momento.',
                  style: TextStyle(
                    color: Cores.preto,
                    fontWeight: FontWeight.w600,
                    fontFamily: Fontes.raleway,
                    fontSize: 16,
                  ),
                ),
              ),
            );
          }

          return SizedBox(
            height: 330,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              scrollDirection: Axis.horizontal,
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return CardEventosParaVoce(event: event);
              },
            ),
          );
        },
        loading: () => const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: CircularProgressIndicator(),
          ),
        ),
        error: (error, _) => Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Text(
              'Erro ao carregar eventos: $error',
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Cartão individual que exibe detalhes básicos de um evento.
class CardEventosParaVoce extends StatelessWidget {
  /// A entidade de evento a ser exibida.
  final AppEvent event;

  /// Construtor padrão do cartão.
  const CardEventosParaVoce({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    const urlImage = 'https://api-tec-eventos-i6hr.onrender.com/imagem/';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: 219,
        child: Card(
          shadowColor: Cores.preto,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Colors.white,
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                urlImage + event.imagemEvento,
                height: 126,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 126,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.image, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.nomeEvento,
                      style: const TextStyle(
                        fontFamily: Fontes.raleway,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Cores.preto,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Text(
                          "Local:",
                          style: TextStyle(
                            fontFamily: Fontes.inter,
                            fontSize: 12,
                            color: Cores.preto,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            event.instituicao.isNotEmpty ? event.instituicao : "Marília, SP",
                            style: const TextStyle(
                              fontFamily: Fontes.inter,
                              fontSize: 12,
                              color: Cores.azul42A5F5,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Restantes:",
                          style: TextStyle(
                            fontFamily: Fontes.inter,
                            fontSize: 12,
                            color: Cores.preto,
                          ),
                        ),
                        Text(
                          "${event.quantidadeIngressos} vagas",
                          style: const TextStyle(
                            fontFamily: Fontes.inter,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: InfoEvento(
                                imagemEvento: event.imagemEvento,
                                imagemOrganizacao: event.logoEvento,
                                diaRealizacao: event.dataEvento,
                                nomeEvento: event.nomeEvento,
                                horarioRealizacao: event.horario,
                                descricao: event.descricao,
                                cdEvento: event.cdEvento,
                                ingressos: event.quantidadeIngressos,
                              ),
                              type: PageTransitionType.rightToLeft,
                            ),
                          );
                        },
                        child: const Text(
                          "Saiba mais",
                          style: TextStyle(
                            fontSize: 14,
                            color: Cores.azul42A5F5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
