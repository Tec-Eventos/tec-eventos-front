import 'package:tec_eventos/features/payment/domain/entities/merchant_account.dart';
import 'package:tec_eventos/features/payment/domain/repositories/payment_repository.dart';

class GetMerchantAccountUseCase {
  final IPaymentRepository _repository;

  GetMerchantAccountUseCase(this._repository);

  Future<MerchantAccount> execute(int cdInstituicao) async {
    return await _repository.getMerchantAccount(cdInstituicao);
  }
}
