import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tec_eventos/features/ingressos/domain/entities/ticket.dart';
import 'package:tec_eventos/features/ingressos/domain/repositories/tickets_repository.dart';
import 'package:tec_eventos/features/ingressos/domain/usecases/get_tickets_use_case.dart';

class MockTicketsRepository extends Mock implements ITicketsRepository {}

void main() {
  late MockTicketsRepository mockRepository;
  late GetTicketsUseCase useCase;

  setUp(() {
    mockRepository = MockTicketsRepository();
    useCase = GetTicketsUseCase(mockRepository);
  });

  const tTicket = Ticket(
    id: '1',
    userName: 'Gabriel Felix',
    userRole: 'Aluno',
    eventName: 'V Encontro de Tecnologia',
    organizerLogoUrl: 'assets/UnivemImagem.png',
    eventDate: '28 de Outubro às 19:30',
    barcodeData: 'TICKET-1234',
    qrcodeData: 'PRESENCA-1234',
  );

  test('deve obter os ingressos personalizados com dados do usuario do repositorio com sucesso', () async {
    // Arrange
    when(() => mockRepository.getTickets(
          userName: any(named: 'userName'),
          userRole: any(named: 'userRole'),
        )).thenAnswer((_) async => [tTicket]);

    // Act
    final result = await useCase.execute(
      userName: 'Gabriel Felix',
      userRole: 'Aluno',
    );

    // Assert
    expect(result, [tTicket]);
    verify(() => mockRepository.getTickets(
          userName: 'Gabriel Felix',
          userRole: 'Aluno',
        )).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
