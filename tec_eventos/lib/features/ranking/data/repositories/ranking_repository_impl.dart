import 'package:tec_eventos/features/ranking/domain/entities/ranking_user.dart';
import 'package:tec_eventos/features/ranking/domain/repositories/ranking_repository.dart';

/// Implementação concreta do repositório de ranking.
///
/// Fornece dados simulados ordenados correspondentes à especificação visual original do app.
class RankingRepositoryImpl implements IRankingRepository {
  final List<RankingUser> _mockRanking = [
    const RankingUser(
      id: '1',
      name: 'GABRIEL MORAIS FELIX',
      profession: 'Desempregado',
      points: 50,
      position: 1,
      goldMedals: 10,
      silverMedals: 10,
      bronzeMedals: 10,
      otherMedals: 20,
      avatarUrl: 'assets/imgPerfil.png',
    ),
    const RankingUser(
      id: '2',
      name: 'RODINEI DA SILVA',
      profession: 'Desempregado',
      points: 40,
      position: 2,
      goldMedals: 10,
      silverMedals: 10,
      bronzeMedals: 10,
      otherMedals: 10,
      avatarUrl: 'assets/imgPerfil.png',
    ),
    const RankingUser(
      id: '3',
      name: 'LOROSVALDO DE ALMEIDA',
      profession: 'Desempregado',
      points: 30,
      position: 3,
      goldMedals: 10,
      silverMedals: 10,
      bronzeMedals: 10,
      otherMedals: 0,
      avatarUrl: 'assets/imgPerfil.png',
    ),
  ];

  @override
  Future<List<RankingUser>> getRanking() async {
    // Simula um atraso de rede
    await Future.delayed(const Duration(milliseconds: 300));
    return List.unmodifiable(_mockRanking);
  }
}
