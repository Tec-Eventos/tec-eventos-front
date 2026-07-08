import 'package:flutter_test/flutter_test.dart';
import 'package:tec_eventos/features/ranking/data/repositories/ranking_repository_impl.dart';

void main() {
  late RankingRepositoryImpl repository;

  setUp(() {
    repository = RankingRepositoryImpl();
  });

  test('deve retornar a lista de alunos ranqueados simulados com sucesso', () async {
    // Act
    final result = await repository.getRanking();

    // Assert
    expect(result, isNotEmpty);
    expect(result.length, 3);
    
    expect(result[0].name, 'GABRIEL MORAIS FELIX');
    expect(result[0].position, 1);
    expect(result[0].points, 50);

    expect(result[1].name, 'RODINEI DA SILVA');
    expect(result[1].position, 2);
    expect(result[1].points, 40);

    expect(result[2].name, 'LOROSVALDO DE ALMEIDA');
    expect(result[2].position, 3);
    expect(result[2].points, 30);
  });
}
