import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/core/theme/fontes.dart';
import 'package:tec_eventos/features/ranking/domain/entities/ranking_user.dart';

/// Card expansível para exibir dados e medalhas de um usuário do ranking.
///
/// Exibe a posição, pontos totais e expande para detalhar as contagens de medalhas.
class RankingUserTile extends StatelessWidget {
  /// O usuário a ser renderizado.
  final RankingUser user;

  /// Construtor padrão recebendo o usuário obrigatório.
  const RankingUserTile({Key? key, required this.user}) : super(key: key);

  /// Retorna a cor correspondente à medalha da colocação do usuário.
  Color _getPositionColor(int position) {
    switch (position) {
      case 1:
        return Cores.amarelo; // Ouro
      case 2:
        return Cores.cinza;   // Prata
      case 3:
        return Cores.bronze;  // Bronze
      default:
        return Cores.azul45B0F0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final positionColor = _getPositionColor(user.position);

    return ExpansionTileCard(
      baseColor: Cores.branco,
      key: GlobalKey(),
      leading: CircleAvatar(
        backgroundImage: AssetImage(user.avatarUrl),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              user.name,
              style: const TextStyle(
                fontFamily: Fontes.raleway,
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Cores.preto,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Icon(
            Icons.arrow_drop_down,
            size: 25,
          ),
          const SizedBox(width: 8),
          Container(
            width: 3,
            height: 24,
            color: positionColor,
          )
        ],
      ),
      subtitle: Text(
        user.profession,
        style: const TextStyle(
          fontFamily: Fontes.raleway,
          fontWeight: FontWeight.w300,
          fontSize: 13,
          color: Cores.preto,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.workspace_premium_outlined, color: Cores.preto),
          Text(
            user.points.toString(),
            style: const TextStyle(
              fontFamily: Fontes.inter,
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Cores.preto,
            ),
          )
        ],
      ),
      children: <Widget>[
        const Divider(
          thickness: 1.0,
          height: 1.0,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 12.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Medalhas de Ouro
                _buildMedalCounter(Icons.workspace_premium_outlined, Cores.amarelo, user.goldMedals),
                // Medalhas de Prata
                _buildMedalCounter(Icons.workspace_premium_outlined, Cores.cinza, user.silverMedals),
                // Medalhas de Bronze
                _buildMedalCounter(Icons.workspace_premium_outlined, Cores.bronze, user.bronzeMedals),
                // Outras Medalhas
                _buildMedalCounter(Icons.workspace_premium_outlined, Cores.azul45B0F0, user.otherMedals),
              ],
            ),
          ),
        ),
        const Divider(
          thickness: 0.5,
          height: 1.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Posição:',
                style: TextStyle(
                  fontFamily: Fontes.raleway,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                user.positionDescription,
                style: TextStyle(
                  fontFamily: Fontes.raleway,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: positionColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMedalCounter(IconData icon, Color color, int count) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 4),
        Text(
          count.toString(),
          style: const TextStyle(
            fontFamily: Fontes.inter,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
