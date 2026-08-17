import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tec_eventos/core/auth/auth_provider.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/core/theme/fontes.dart';
import 'package:tec_eventos/features/events/presentation/providers/events_provider.dart';
import 'package:tec_eventos/features/events/presentation/widgets/cards_eventos_da_instituicao_widget.dart';
import 'package:tec_eventos/widgets/Cards/cards_adicionados_recentemente_instituicao/cards_add_recentemente_instituicao.dart';
import 'package:tec_eventos/widgets/botao/botao.dart';

/// Tela principal do feed de controle de eventos da Instituição/Escola.
///
/// Exibe dados cadastrais da instituição e a listagem dinâmica de seus eventos.
class PrincipalPageInstituicao extends ConsumerWidget {
  /// Construtor padrão da tela.
  const PrincipalPageInstituicao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateAsync = ref.watch(authProvider);
    final eventsAsync = ref.watch(escolaEventsListProvider);

    return authStateAsync.when(
      data: (auth) {
        if (auth == null || !auth.isAuthenticated) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 23),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Container(
                      height: 119,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Cores.azulEscuroPerfilOption.withOpacity(0.38),
                            Cores.azulAFDAFA.withOpacity(0.5),
                            Cores.azulC8E6FC.withOpacity(0.4),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    auth.name ?? "Sem nome",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontFamily: Fontes.ralewayBold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    auth.email ?? "Sem email",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontFamily: Fontes.raleway,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.school,
                              size: 50,
                              color: Cores.azulEscuroPerfilOption,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    "Eventos de sua instituição",
                    style: TextStyle(
                      fontFamily: Fontes.raleway,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  eventsAsync.when(
                    data: (events) {
                      if (events.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 24.0),
                          child: Text(
                            "Você ainda não cadastrou nenhum evento.",
                            style: TextStyle(fontFamily: Fontes.raleway),
                          ),
                        );
                      }

                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: events.map((event) => CardsEventosInstituicaoWidget(event: event)).toList(),
                        ),
                      );
                    },
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (error, _) => Text(
                      'Erro ao carregar eventos: $error',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Adicionados recentemente",
                    style: TextStyle(
                      fontFamily: Fontes.raleway,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [CardsRecentesInstituicao()],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Botao(), // Botão para criar novo evento
                ],
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Erro de autenticação: $error')),
    );
  }
}
