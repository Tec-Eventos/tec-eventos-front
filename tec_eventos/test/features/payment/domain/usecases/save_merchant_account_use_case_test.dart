import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tec_eventos/features/payment/domain/entities/merchant_account.dart';
import 'package:tec_eventos/features/payment/domain/repositories/payment_repository.dart';
import 'package:tec_eventos/features/payment/domain/usecases/save_merchant_account_use_case.dart';

class MockPaymentRepository extends Mock implements IPaymentRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(const MerchantAccount(
      titular: '',
      cpfCnpj: '',
      banco: '',
      tipoConta: 'Corrente',
      agencia: '',
      conta: '',
    ));
  });

  late MockPaymentRepository mockRepository;
  late SaveMerchantAccountUseCase useCase;

  setUp(() {
    mockRepository = MockPaymentRepository();
    useCase = SaveMerchantAccountUseCase(mockRepository);
  });

  const tAccount = MerchantAccount(
    titular: 'Escola Etec',
    cpfCnpj: '12.345.678/0001-90',
    banco: 'Banco do Brasil',
    tipoConta: 'Corrente',
    agencia: '1234',
    conta: '56789-0',
  );

  test('deve chamar o repositorio para salvar a conta bancaria da instituicao com sucesso', () async {
    // Arrange
    when(() => mockRepository.saveMerchantAccount(any(), any())).thenAnswer((_) async => {});

    // Act
    await useCase.execute(2109, tAccount);

    // Assert
    verify(() => mockRepository.saveMerchantAccount(2109, tAccount)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
