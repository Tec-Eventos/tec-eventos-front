import 'package:flutter/material.dart';
import 'package:tec_eventos/widgets/Cards/eventos_em_alta/cards_eventos_alta.dart';
import 'package:tec_eventos/widgets/Cards/eventos_inscritos/cards_eventos_inscritos.dart';
import 'package:tec_eventos/widgets/Cards/eventos_recomendados/cards_recomendados.dart';
import 'package:tec_eventos/widgets/InstituicaoSugerida/instituicao_sugerida.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/core/theme/fontes.dart';

/// Página inicial de visualização do Aluno/Estudante.
///
/// Exibe os eventos nos quais o aluno está inscrito, os eventos em alta
/// e as recomendações de eventos personalizadas, além de sugerir instituições parceiras.
class PrincipalPage extends StatelessWidget {
  /// Construtor padrão da página principal.
  const PrincipalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 23),
      scrollDirection: Axis.vertical,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),

            Text(
              "Eventos que você está inscrito",
              style: const TextStyle(
                fontFamily: Fontes.raleway,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Cores.preto,
              ),
            ),
            const SizedBox(height: 10),

            // Carrossel dos eventos que o usuário vai participar, mostrando os dias que faltam
            const RowCardEventosInscritos(),

            const SizedBox(height: 50),

            Text(
              "Eventos em alta",
              style: const TextStyle(
                fontFamily: Fontes.raleway,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Cores.preto,
              ),
            ),
            const SizedBox(height: 10),

            // Carrossel dos eventos que as pessoas mais fizeram inscrições
            const RowEventosEmAlta(),

            const SizedBox(height: 50),

            Text(
              "Recomendados para você",
              style: const TextStyle(
                fontFamily: Fontes.raleway,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Cores.preto,
              ),
            ),
            const SizedBox(height: 10),

            // Carrossel dos cards recomendados para o aluno
            const RowEventosRecomendados(),

            const SizedBox(height: 50),

            Text(
              "Algumas instituições",
              style: const TextStyle(
                fontFamily: Fontes.raleway,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Cores.preto,
              ),
            ),
            const SizedBox(height: 10),

            // Imagens das instituições parceiras sugeridas
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InstituicaoSugerida(imagem: "assets/unimarImagem.png"),
                  InstituicaoSugerida(imagem: "assets/unimarImagem.png"),
                  InstituicaoSugerida(imagem: "assets/unimarImagem.png"),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
