import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/core/theme/fontes.dart';
import 'package:tec_eventos/features/ingressos/domain/entities/ticket.dart';

/// Exibe a porção de QR Code do ingresso.
class QrCodeIngressoWidget extends StatelessWidget {
  /// O ingresso correspondente a ser exibido.
  final Ticket ticket;

  /// Construtor padrão.
  const QrCodeIngressoWidget({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Ingresso - QRcode",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: Fontes.ralewayBold,
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Cores.preto,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ticket.userName,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 17,
                        fontFamily: Fontes.ralewayBold,
                        color: Cores.preto,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ticket.userRole,
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: Fontes.inter,
                        color: Cores.preto,
                        fontWeight: FontWeight.w200,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Image.asset(
                        "assets/t!e_logo.png",
                        width: 108,
                        alignment: Alignment.bottomLeft,
                        height: 36,
                      ),
                    ),
                  ],
                ),
                BarcodeWidget(
                  barcode: Barcode.qrCode(),
                  data: ticket.qrcodeData,
                  drawText: false,
                  width: 90,
                  height: 85,
                )
              ],
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Baixando QR Code...')),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.file_download_outlined, size: 25, color: Cores.azul1565C0),
                  const SizedBox(width: 4),
                  const Text(
                    "Baixar QrCode",
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
