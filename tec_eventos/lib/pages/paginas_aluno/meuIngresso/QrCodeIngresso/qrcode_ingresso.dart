import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';

class QrCodeIngresso extends StatelessWidget {
  const QrCodeIngresso({super.key, this.valorQrCode});

  final String? valorQrCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(color: Cores.branco, boxShadow: [
        BoxShadow(
            color: Cores.cinzaD8D7D7, blurRadius: 4, offset: const Offset(0, 4)
            // Shadow position
            ),
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Ingresso - QRcode",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: Fontes.ralewayBold,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Cores.preto),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nome do aluno",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: Fontes.ralewayBold,
                        color: Cores.preto,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    //Sua característica
                    Text(
                      "Aluno",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: Fontes.inter,
                          color: Cores.preto,
                          fontWeight: FontWeight.w200,
                          fontStyle: FontStyle.normal),
                    ),

                    Image.asset(
                      "assets/UnivemImagem.png",
                      width: 108,
                      height: 36,
                    ),
                  ],
                ),
                BarcodeWidget(
                  barcode: Barcode.qrCode(),
                  data: valorQrCode!,
                  drawText: false,
                  width: 90,
                  height: 85,
                )
              ],
            ),
            // GestureDetector(
            //   onTap: () {},
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Icon(Icons.file_download_outlined,
            //           size: 25, color: Cores.azul1565C0),
            //       Text("Baixar QrCode",
            //           textAlign: TextAlign.center,
            //           style: TextStyle(
            //               fontFamily: Fontes.ralewayBold,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 22,
            //               color: Cores.azul1565C0)),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
