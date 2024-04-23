import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:ticket_widget/ticket_widget.dart';


class TicketIngresso extends StatelessWidget {
  const TicketIngresso({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 347,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Ingresso - Ticket",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: Fontes.ralewayBold,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Cores.preto),
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 8,
                    offset: const Offset(0, 6),
                    color: Cores.cinzaD8D7D7)
              ]),
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
                          //imagem da organização do evento
                          Image.asset(
                            "assets/UnivemImagem.png",
                            width: 108,
                            height: 36,
                          ),

                          const SizedBox(height: 10),

                          //nome do usuário
                          Text(
                            "Gabriel Felix",
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: Fontes.ralewayBold,
                              color: Cores.preto,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          //Sua característica
                          Text(
                            "Aluno",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: Fontes.inter,
                                color: Cores.preto,
                                fontWeight: FontWeight.w200,
                                fontStyle: FontStyle.normal),
                          ),

                          Expanded(
                            child: SizedBox(
                              height: 24,
                              child: LayoutBuilder(
                                builder: (BuildContext context,
                                    BoxConstraints constraints) {
                                  return Flex(
                                    direction: Axis.horizontal,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        15,
                                        (index) => SizedBox(
                                              width: 14,
                                              height: 3,
                                              child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      color:
                                                          Cores.cinzaACB0B6)),
                                            )),
                                  );
                                },
                              ),
                            ),
                          ),

                          BarcodeWidget(
                            barcode: Barcode.code128(),
                            data:
                                "https://www.instagram.com/fgabrielmorais/?hl=pt-br",
                            drawText: false,
                            width: 238,
                            height: 48,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.file_download_outlined,
                      size: 25, color: Cores.azul1565C0),
                  Text("Baixar ticket",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: Fontes.ralewayBold,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Cores.azul1565C0)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
