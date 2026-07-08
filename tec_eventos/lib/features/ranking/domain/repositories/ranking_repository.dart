import 'package:tec_eventos/features/ranking/domain/entities/ranking_user.dart';

/// Contrato para o repositório de ranking de usuários.
///
/// Define as operações para busca dos melhores colocados na plataforma.
abstract class IRankingRepository {
  /// Obtém a lista ordenada de usuários no ranking.
  ///
  /// Pode lançar uma [Failure] em caso de erro na comunicação.
  Future<List<RankingUser>> getRanking();
}
