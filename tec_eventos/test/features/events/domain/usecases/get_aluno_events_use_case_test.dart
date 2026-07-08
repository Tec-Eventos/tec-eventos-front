import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tec_eventos/features/events/domain/entities/app_event.dart';
import 'package:tec_eventos/features/events/domain/repositories/events_repository.dart';
import 'package:tec_eventos/features/events/domain/usecases/get_aluno_events_use_case.dart';

class MockEventsRepository extends Mock implements IEventsRepository {}

void main() {
  late MockEventsRepository mockRepository;
  late GetAlunoEventsUseCase useCase;

  setUp(() {
    mockRepository = MockEventsRepository();
    useCase = GetAlunoEventsUseCase(mockRepository);
  });

  const tEvent = AppEvent(
    cdEvento: 1,
    nomeEvento: 'Encontro de TI',
    cdInstituicao: 10,
    dataEvento: '2026-10-28',
    horario: '19:30',
    quantidadeIngressos: 150,
    descricao: 'Palestra de Tecnologia',
    cepEvento: '17500000',
    preco: 0.0,
    senhaEvento: '',
    instituicao: 'Etec',
    tipoInstituicao: 'Escola',
    imagemEvento: 'img.png',
    logoEvento: 'logo.png',
  );

  test('deve retornar a lista de eventos sugeridos para o aluno com sucesso', () async {
    // Arrange
    when(() => mockRepository.getAlunoEvents(any())).thenAnswer((_) async => [tEvent]);

    // Act
    final result = await useCase.execute(21091);

    // Assert
    expect(result, [tEvent]);
    verify(() => mockRepository.getAlunoEvents(21091)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
