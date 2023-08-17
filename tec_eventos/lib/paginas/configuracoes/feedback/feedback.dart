import 'package:flutter/material.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';

class FeedBackPage extends StatelessWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        bottom: PreferredSize(
            child: Text(
              "Configurações",
              textAlign: TextAlign.left,
            ),
            preferredSize: Size.square(50)),
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 23),
          scrollDirection: Axis.vertical,
          children: [
            Text(
              "Configurações",
              style: TextStyle(
                fontFamily: Fontes.raleway,
                fontWeight: FontWeight.w600,
                color: Cores.preto,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Text("GERAL",
                style: TextStyle(
                    fontSize: 20,
                    color: Cores.cinzaMaisEscuro,
                    fontWeight: FontWeight.w600)),
            const ConfigGeral(icone: Icons.lock_outlined, opcao: "Privacidade"),
          ]),
    );
  }
}

class ConfigGeral extends StatefulWidget {
  const ConfigGeral({Key? key, required this.icone, required this.opcao})
      : super(key: key);

  final String opcao;
  final IconData icone;

  @override
  State<ConfigGeral> createState() => _ConfigGeralState();
}

class _ConfigGeralState extends State<ConfigGeral> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(),
          shape: Border(
            bottom: BorderSide(
              color: Cores.cinzaMaisClaro,
              width: 1.0,
            ),
          ),
          titleAlignment: ListTileTitleAlignment.center,
          leading: Icon(widget.icone, color: Cores.preto, size: 20),
          title: Text(widget.opcao,
              style: TextStyle(
                  fontFamily: Fontes.raleway,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Cores.preto)),
          trailing: Icon(Icons.arrow_forward_ios, color: Cores.preto, size: 12),
        ),
      ],
    );
  }
}
