import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tec_eventos/features/payment/domain/entities/payment_method.dart';
import 'package:tec_eventos/features/payment/domain/repositories/payment_repository.dart';
import 'package:tec_eventos/features/payment/domain/usecases/get_saved_payment_methods_use_case.dart';

class MockPaymentRepository extends Mock implements IPaymentRepository {}

void main() {
  late MockPaymentRepository mockRepository;
  late GetSavedPaymentMethodsUseCase useCase;

  setUp(() {
    mockRepository = MockPaymentRepository();
    useCase = GetSavedPaymentMethodsUseCase(mockRepository);
  });

  const tMethod = PaymentMethod(
    id: '1',
    name: 'NuBank',
    lastFourDigits: '1234',
    type: PaymentMethodType.credit,
  );

  test('deve obter a lista de metodos de pagamento do repositorio com sucesso', () async {
    // Arrange
    when(() => mockRepository.getSavedPaymentMethods()).thenAnswer((_) async => [tMethod]);

    // Act
    final result = await useCase.execute();

    // Assert
    expect(result, [tMethod]);
    verify(() => mockRepository.getSavedPaymentMethods()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
