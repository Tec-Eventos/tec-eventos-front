import 'package:flutter/material.dart';
import 'package:tec_eventos/widgets/Cards/cardEventosParaVoce/card_eventos_para_voce.dart';
import 'package:tec_eventos/widgets/InstituicaoSugerida/instituicao_sugerida.dart';
import 'package:tec_eventos/widgets/Perfil_user/menu_perfil/favoritos.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';

class EventosPage extends StatefulWidget {
  const EventosPage({Key? key}) : super(key: key);

  @override
  State<EventosPage> createState() => _EventosPageState();
}

class _EventosPageState extends State<EventosPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 23),
      scrollDirection: Axis.vertical,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InstituicaoSugerida(imagem: "assets/unimarImagem.png"),
                  InstituicaoSugerida(imagem: "assets/unimarImagem.png"),
                ],
              ),
            ),
            const SizedBox(height: 70),
            Text("Eventos para você",
                style: TextStyle(
                    fontFamily: Fontes.ralewayBold,
                    fontSize: 22,
                    color: Cores.preto)),

            //Card dos Eventos para você

            const RowCardEventosParaVoce(),

            const SizedBox(height: 70),
            Text("Sugestões",
                style: TextStyle(
                    fontFamily: Fontes.ralewayBold,
                    fontSize: 22,
                    color: Cores.preto)),

            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Favoritos(
                      imgEvento: "assets/evento1.png",
                      imgOrg: "assets/UnivemIMG.png"),
                  Favoritos(
                      imgEvento: "assets/evento1.png",
                      imgOrg: "assets/UnivemIMG.png"),
                  Favoritos(
                      imgEvento: "assets/evento1.png",
                      imgOrg: "assets/UnivemIMG.png"),
                  Favoritos(
                      imgEvento: "assets/evento1.png",
                      imgOrg: "assets/UnivemIMG.png"),
                  Favoritos(
                      imgEvento: "assets/evento1.png",
                      imgOrg: "assets/UnivemIMG.png"),
                  Favoritos(
                      imgEvento: "assets/evento1.png",
                      imgOrg: "assets/UnivemIMG.png"),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
