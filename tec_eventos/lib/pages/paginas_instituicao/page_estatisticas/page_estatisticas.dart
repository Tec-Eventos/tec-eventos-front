import 'package:flutter/material.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/core/theme/fontes.dart';

/// Tela de Estatísticas da Instituição.
///
/// Apresenta dados consolidados sobre a adesão, presença e satisfação geral dos alunos
/// em relação aos eventos promovidos pela instituição.
class PageEstatisticas extends StatelessWidget {
  /// Construtor padrão da tela de estatísticas.
  const PageEstatisticas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.branco,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.bar_chart_outlined,
              size: 80,
              color: Cores.azul42A5F5,
            ),
            SizedBox(height: 20),
            Text(
              "Estatísticas dos Eventos",
              style: TextStyle(
                fontFamily: Fontes.ralewayBold,
                fontSize: 22,
                color: Cores.preto,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Em breve: gráficos de presença e engajamento.",
              style: TextStyle(
                fontFamily: Fontes.raleway,
                fontSize: 14,
                color: Cores.cinza6A6666,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
