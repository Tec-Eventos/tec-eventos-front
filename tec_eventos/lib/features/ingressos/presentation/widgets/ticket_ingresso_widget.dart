import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/core/theme/fontes.dart';
import 'package:tec_eventos/features/ingressos/domain/entities/ticket.dart';
import 'package:ticket_widget/ticket_widget.dart';

/// Exibe o ticket detalhado do ingresso do evento com código de barras.
class TicketIngressoWidget extends StatelessWidget {
  /// O ingresso correspondente a ser exibido.
  final Ticket ticket;

  /// Construtor padrão.
  const TicketIngressoWidget({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 347,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Cores.branco,
        boxShadow: const [
          BoxShadow(
            color: Cores.cinzaD8D7D7,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Ingresso - Ticket",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: Fontes.ralewayBold,
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Cores.preto,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    offset: Offset(0, 6),
                    color: Cores.cinzaD8D7D7,
                  )
                ],
              ),
              child: TicketWidget(
                color: Cores.branco,
                width: 276,
                height: 191,
                isCornerRounded: true,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            ticket.organizerLogoUrl,
                            width: 108,
                            height: 36,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            ticket.userName,
                            style: const TextStyle(
                              fontSize: 22,
                              fontFamily: Fontes.ralewayBold,
                              color: Cores.preto,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ticket.userRole,
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: Fontes.inter,
                              color: Cores.preto,
                              fontWeight: FontWeight.w200,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 24,
                              child: LayoutBuilder(
                                builder: (BuildContext context, BoxConstraints constraints) {
                                  return Flex(
                                    direction: Axis.horizontal,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                      15,
                                      (index) => const SizedBox(
                                        width: 14,
                                        height: 3,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(7)),
                                            color: Cores.cinzaACB0B6,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          BarcodeWidget(
                            barcode: Barcode.code128(),
                            data: ticket.barcodeData,
                            drawText: false,
                            width: 238,
                            height: 48,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Baixando Ticket...')),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.file_download_outlined, size: 25, color: Cores.azul1565C0),
                  const SizedBox(width: 4),
                  const Text(
                    "Baixar ticket",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: Fontes.ralewayBold,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Cores.azul1565C0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
