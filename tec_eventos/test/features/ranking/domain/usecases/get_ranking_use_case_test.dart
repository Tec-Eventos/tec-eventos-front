import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tec_eventos/features/ranking/domain/entities/ranking_user.dart';
import 'package:tec_eventos/features/ranking/domain/repositories/ranking_repository.dart';
import 'package:tec_eventos/features/ranking/domain/usecases/get_ranking_use_case.dart';

class MockRankingRepository extends Mock implements IRankingRepository {}

void main() {
  late MockRankingRepository mockRepository;
  late GetRankingUseCase useCase;

  setUp(() {
    mockRepository = MockRankingRepository();
    useCase = GetRankingUseCase(mockRepository);
  });

  final tRanking = [
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
  ];

  test('deve retornar a lista de ranking do repositorio com sucesso', () async {
    // Arrange
    when(() => mockRepository.getRanking()).thenAnswer((_) async => tRanking);

    // Act
    final result = await useCase.execute();

    // Assert
    expect(result, tRanking);
    verify(() => mockRepository.getRanking()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
