import 'package:tec_eventos/features/payment/domain/entities/payment_method.dart';
import 'package:tec_eventos/features/payment/domain/entities/merchant_account.dart';

/// Contrato para o repositório de pagamentos.
abstract class IPaymentRepository {
  /// Obtém os cartões/métodos de pagamento salvos do aluno.
  Future<List<PaymentMethod>> getSavedPaymentMethods();

  /// Adiciona um novo cartão de crédito.
  Future<void> addCreditCard({
    required String cardHolder,
    required String cardNumber,
    required String expiryDate,
    required String cvv,
  });

  /// Obtém a conta de recebimento configurada pela escola.
  Future<MerchantAccount> getMerchantAccount(int cdInstituicao);

  /// Salva ou edita a conta de recebimento configurada pela escola.
  Future<void> saveMerchantAccount(int cdInstituicao, MerchantAccount account);
}
