import 'package:tec_eventos/features/payment/domain/entities/merchant_account.dart';
import 'package:tec_eventos/features/payment/domain/repositories/payment_repository.dart';

class SaveMerchantAccountUseCase {
  final IPaymentRepository _repository;

  SaveMerchantAccountUseCase(this._repository);

  Future<void> execute(int cdInstituicao, MerchantAccount account) async {
    return await _repository.saveMerchantAccount(cdInstituicao, account);
  }
}
