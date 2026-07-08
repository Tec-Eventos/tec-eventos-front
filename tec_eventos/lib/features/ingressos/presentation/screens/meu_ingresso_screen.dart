import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/core/theme/fontes.dart';
import 'package:tec_eventos/features/ingressos/presentation/providers/tickets_provider.dart';
import 'package:tec_eventos/features/ingressos/presentation/widgets/qrcode_ingresso_widget.dart';
import 'package:tec_eventos/features/ingressos/presentation/widgets/ticket_ingresso_widget.dart';

/// Tela "Meu Ingresso" do Aluno.
///
/// Exibe os ingressos adquiridos pelo usuário reativamente, detalhando
/// as informações em formato de Ticket (código de barras) e QR Code.
class MeuIngressoScreen extends ConsumerWidget {
  /// Construtor padrão da tela.
  const MeuIngressoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketsAsync = ref.watch(ticketsListProvider);

    return Scaffold(
      backgroundColor: Cores.branco,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Cores.branco,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Cores.preto,
            size: 20,
          ),
        ),
        title: const Text(
          "Meu Ingresso",
          style: TextStyle(
            fontFamily: Fontes.ralewayBold,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Cores.preto,
          ),
        ),
      ),
      body: ticketsAsync.when(
        data: (tickets) {
          if (tickets.isEmpty) {
            return const Center(
              child: Text(
                'Você não possui nenhum ingresso ativo.',
                style: TextStyle(
                  fontFamily: Fontes.raleway,
                  fontSize: 16,
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                final ticket = tickets[index];
                return Column(
                  children: [
                    const SizedBox(height: 12),
                    TicketIngressoWidget(ticket: ticket),
                    const SizedBox(height: 12),
                    QrCodeIngressoWidget(ticket: ticket),
                    const SizedBox(height: 24),
                  ],
                );
              },
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'Erro ao carregar ingressos: $error',
              style: const TextStyle(
                fontFamily: Fontes.raleway,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
