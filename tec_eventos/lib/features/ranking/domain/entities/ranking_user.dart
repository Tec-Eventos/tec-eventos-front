/// Representa um usuário posicionado no ranking de medalhas e pontos do aplicativo.
///
/// Agrupa os dados de pontuação geral, posição no ranking, contagem individual
/// de medalhas por tipo (ouro, prata, bronze e adicionais) e dados básicos de perfil.
class RankingUser {
  /// Identificador único do usuário no ranking.
  final String id;

  /// Nome completo ou de exibição do usuário.
  final String name;

  /// Profissão ou descrição secundária de perfil.
  final String profession;

  /// Pontuação acumulada do usuário.
  final int points;

  /// Posição numérica no ranking (ex: 1 para 1º Lugar, 2 para 2º Lugar).
  final int position;

  /// Contagem de medalhas de ouro (1º lugar em eventos).
  final int goldMedals;

  /// Contagem de medalhas de prata (2º lugar em eventos).
  final int silverMedals;

  /// Contagem de medalhas de bronze (3º lugar em eventos).
  final int bronzeMedals;

  /// Contagem de medalhas adicionais ou de participação.
  final int otherMedals;

  /// Caminho do asset ou URL da imagem de perfil.
  final String avatarUrl;

  /// Construtor padrão da entidade de usuário do ranking.
  const RankingUser({
    required this.id,
    required this.name,
    required this.profession,
    required this.points,
    required this.position,
    required this.goldMedals,
    required this.silverMedals,
    required this.bronzeMedals,
    required this.otherMedals,
    required this.avatarUrl,
  });

  /// Descrição formatada da colocação do usuário (ex: '1° Lugar').
  String get positionDescription => '$position° Lugar';
}
