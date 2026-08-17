import 'package:tec_eventos/features/payment/domain/entities/payment_method.dart';
import 'package:tec_eventos/features/payment/domain/repositories/payment_repository.dart';

class GetSavedPaymentMethodsUseCase {
  final IPaymentRepository _repository;

  GetSavedPaymentMethodsUseCase(this._repository);

  Future<List<PaymentMethod>> execute() async {
    return await _repository.getSavedPaymentMethods();
  }
}
