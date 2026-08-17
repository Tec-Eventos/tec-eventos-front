import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tec_eventos/features/payment/data/repositories/payment_repository_impl.dart';
import 'package:tec_eventos/features/payment/domain/entities/merchant_account.dart';

void main() {
  late PaymentRepositoryImpl repository;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    repository = PaymentRepositoryImpl();
  });

  group('PaymentRepositoryImpl', () {
    test('deve retornar metodos padrao caso nao haja nenhum salvo no SharedPreferences', () async {
      final methods = await repository.getSavedPaymentMethods();
      expect(methods, isNotEmpty);
      expect(methods.length, 2);
      expect(methods[0].name, 'MasterCard');
    });

    test('deve salvar e carregar dados da conta de recebimento da instituicao com sucesso', () async {
      const cdInstituicao = 2109;
      const account = MerchantAccount(
        titular: 'Escola Etec',
        cpfCnpj: '12.345.678/0001-90',
        banco: 'Banco do Brasil',
        tipoConta: 'Corrente',
        agencia: '1234',
        conta: '56789-0',
      );

      await repository.saveMerchantAccount(cdInstituicao, account);
      final retrieved = await repository.getMerchantAccount(cdInstituicao);

      expect(retrieved.titular, 'Escola Etec');
      expect(retrieved.agencia, '1234');
      expect(retrieved.conta, '56789-0');
      expect(retrieved.tipoConta, 'Corrente');
    });
  });
}
