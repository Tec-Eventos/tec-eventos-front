import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tec_eventos/features/ranking/domain/entities/ranking_user.dart';
import 'package:tec_eventos/features/ranking/domain/repositories/ranking_repository.dart';
import 'package:tec_eventos/features/ranking/data/repositories/ranking_repository_impl.dart';
import 'package:tec_eventos/features/ranking/domain/usecases/get_ranking_use_case.dart';

part 'ranking_provider.g.dart';

/// Provider que injeta a implementação concreta do repositório de ranking.
@riverpod
IRankingRepository rankingRepository(Ref ref) {
  return RankingRepositoryImpl();
}

/// Provider que injeta o caso de uso [GetRankingUseCase].
@riverpod
GetRankingUseCase getRankingUseCase(Ref ref) {
  final repository = ref.watch(rankingRepositoryProvider);
  return GetRankingUseCase(repository);
}

/// Provider auto-gerado que expõe a lista de usuários ranqueados consultada assincronamente.
@riverpod
FutureOr<List<RankingUser>> rankingList(Ref ref) async {
  final useCase = ref.watch(getRankingUseCaseProvider);
  return await useCase.execute();
}
