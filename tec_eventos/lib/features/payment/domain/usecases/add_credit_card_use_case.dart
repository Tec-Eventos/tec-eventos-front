import 'package:tec_eventos/features/payment/domain/repositories/payment_repository.dart';

class AddCreditCardUseCase {
  final IPaymentRepository _repository;

  AddCreditCardUseCase(this._repository);

  Future<void> execute({
    required String cardHolder,
    required String cardNumber,
    required String expiryDate,
    required String cvv,
  }) async {
    return await _repository.addCreditCard(
      cardHolder: cardHolder,
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cvv: cvv,
    );
  }
}
