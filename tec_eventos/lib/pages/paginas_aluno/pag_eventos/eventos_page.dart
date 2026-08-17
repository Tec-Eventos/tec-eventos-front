import 'package:flutter/material.dart';
import 'package:tec_eventos/widgets/Cards/cardEventosParaVoce/card_eventos_para_voce.dart';
import 'package:tec_eventos/widgets/InstituicaoSugerida/instituicao_sugerida.dart';
import 'package:tec_eventos/widgets/Perfil_user/menu_perfil/favoritos.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/core/theme/fontes.dart';

/// Página de exploração de eventos e busca do Aluno.
///
/// Exibe instituições sugeridas na parte superior, a lista de eventos voltados
/// ao aluno e sugestões de eventos favoritados no formato de lista horizontal.
class EventosPage extends StatelessWidget {
  /// Construtor padrão da página de eventos.
  const EventosPage({Key? key}) : super(key: key);

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
            Text(
              "Eventos para você",
              style: const TextStyle(
                fontFamily: Fontes.ralewayBold,
                fontSize: 22,
                color: Cores.preto,
              ),
            ),
            const SizedBox(height: 10),

            // Exibe a linha de eventos para você
            const RowCardEventosParaVoce(),

            const SizedBox(height: 70),
            Text(
              "Sugestões",
              style: const TextStyle(
                fontFamily: Fontes.ralewayBold,
                fontSize: 22,
                color: Cores.preto,
              ),
            ),
            const SizedBox(height: 10),

            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Favoritos(
                    imgEvento: "assets/evento1.png",
                    imgOrg: "assets/UnivemIMG.png",
                  ),
                  Favoritos(
                    imgEvento: "assets/evento1.png",
                    imgOrg: "assets/UnivemIMG.png",
                  ),
                  Favoritos(
                    imgEvento: "assets/evento1.png",
                    imgOrg: "assets/UnivemIMG.png",
                  ),
                  Favoritos(
                    imgEvento: "assets/evento1.png",
                    imgOrg: "assets/UnivemIMG.png",
                  ),
                  Favoritos(
                    imgEvento: "assets/evento1.png",
                    imgOrg: "assets/UnivemIMG.png",
                  ),
                  Favoritos(
                    imgEvento: "assets/evento1.png",
                    imgOrg: "assets/UnivemIMG.png",
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
