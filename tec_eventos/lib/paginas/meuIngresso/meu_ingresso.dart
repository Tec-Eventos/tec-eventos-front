import 'package:flutter/material.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/paginas/meuIngresso/QrCodeIngresso/qrcode_ingresso.dart';
import 'package:tec_eventos/paginas/meuIngresso/TicketIngresso/ticket_ingresso.dart';

class MeuIngresso extends StatelessWidget {
  const MeuIngresso({super.key});

  @override
  Widget build(BuildContext context) {
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
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Cores.preto,
            size: 20,
          ),
        ),
        title: Text(
          "Meu Ingresso",
          style: TextStyle(
              fontFamily: Fontes.ralewayBold,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Cores.preto),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: const [
            //Ingresso via Ticket
            TicketIngresso(),

            //Ingresso via QrCode
            QrCodeIngresso(),
          ],
        ),
      ),
    );
  }
}
