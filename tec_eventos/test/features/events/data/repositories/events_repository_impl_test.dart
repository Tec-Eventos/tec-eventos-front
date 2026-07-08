import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tec_eventos/core/network/http_client.dart';
import 'package:tec_eventos/features/events/data/repositories/events_repository_impl.dart';

class MockHttpClient extends Mock implements IHttpClient {}

void main() {
  late MockHttpClient mockHttpClient;
  late EventsRepositoryImpl repository;

  setUp(() {
    mockHttpClient = MockHttpClient();
    repository = EventsRepositoryImpl(mockHttpClient);
  });

  group('getAlunoEvents', () {
    test('deve obter os eventos sugeridos para o aluno com sucesso da API', () async {
      // Arrange
      final responseBody = {
        'data': [
          {
            'cd_evento': 1,
            'nome_evento': 'Encontro de TI',
            'cd_instituicao': 10,
            'data_evento': '2026-10-28',
            'horario': '19:30',
            'quantidade_ingressos': 150,
            'descricao': 'Palestra de Tecnologia',
            'cep_evento': '17500000',
            'preco': 0.0,
            'senha_evento': '',
            'instituicao': 'Etec',
            'tipo_instituicao': 'Escola',
            'imagem_evento': 'img.png',
            'logo_evento': 'logo.png',
          }
        ]
      };

      when(() => mockHttpClient.get(any())).thenAnswer((_) async => responseBody);

      // Act
      final result = await repository.getAlunoEvents(21091);

      // Assert
      expect(result.length, 1);
      expect(result[0].nomeEvento, 'Encontro de TI');
      expect(result[0].cdEvento, 1);
      verify(() => mockHttpClient.get('/aluno/events/21091')).called(1);
    });
  });
}
