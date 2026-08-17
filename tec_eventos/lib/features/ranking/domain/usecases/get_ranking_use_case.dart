import 'package:tec_eventos/features/ranking/domain/entities/ranking_user.dart';
import 'package:tec_eventos/features/ranking/domain/repositories/ranking_repository.dart';

/// Caso de uso responsável por obter os dados de ranking de usuários.
class GetRankingUseCase {
  final IRankingRepository _repository;

  /// Construtor padrão recebendo a dependência do repositório.
  GetRankingUseCase(this._repository);

  /// Executa a consulta ao repositório para obter os usuários ranqueados.
  ///
  /// Retorna uma lista de [RankingUser] ou lança um [Failure].
  Future<List<RankingUser>> execute() async {
    return await _repository.getRanking();
  }
}
