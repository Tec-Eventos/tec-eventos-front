import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tec_eventos/core/auth/auth_provider.dart';
import 'package:tec_eventos/features/payment/domain/entities/payment_method.dart';
import 'package:tec_eventos/features/payment/domain/entities/merchant_account.dart';
import 'package:tec_eventos/features/payment/domain/repositories/payment_repository.dart';
import 'package:tec_eventos/features/payment/data/repositories/payment_repository_impl.dart';
import 'package:tec_eventos/features/payment/domain/usecases/get_saved_payment_methods_use_case.dart';
import 'package:tec_eventos/features/payment/domain/usecases/add_credit_card_use_case.dart';
import 'package:tec_eventos/features/payment/domain/usecases/get_merchant_account_use_case.dart';
import 'package:tec_eventos/features/payment/domain/usecases/save_merchant_account_use_case.dart';

part 'payment_provider.g.dart';

/// Provider que expõe a implementação concreta do repositório de pagamentos.
@riverpod
IPaymentRepository paymentRepository(Ref ref) {
  return PaymentRepositoryImpl();
}

/// Provider para o caso de uso [GetSavedPaymentMethodsUseCase].
@riverpod
GetSavedPaymentMethodsUseCase getSavedPaymentMethodsUseCase(Ref ref) {
  final repository = ref.watch(paymentRepositoryProvider);
  return GetSavedPaymentMethodsUseCase(repository);
}

/// Provider para o caso de uso [AddCreditCardUseCase].
@riverpod
AddCreditCardUseCase addCreditCardUseCase(Ref ref) {
  final repository = ref.watch(paymentRepositoryProvider);
  return AddCreditCardUseCase(repository);
}

/// Provider para o caso de uso [GetMerchantAccountUseCase].
@riverpod
GetMerchantAccountUseCase getMerchantAccountUseCase(Ref ref) {
  final repository = ref.watch(paymentRepositoryProvider);
  return GetMerchantAccountUseCase(repository);
}

/// Provider para o caso de uso [SaveMerchantAccountUseCase].
@riverpod
SaveMerchantAccountUseCase saveMerchantAccountUseCase(Ref ref) {
  final repository = ref.watch(paymentRepositoryProvider);
  return SaveMerchantAccountUseCase(repository);
}

/// Provider reativo para listar os cartões salvos do aluno.
@riverpod
class SavedPaymentMethodsList extends _$SavedPaymentMethodsList {
  @override
  FutureOr<List<PaymentMethod>> build() async {
    final useCase = ref.watch(getSavedPaymentMethodsUseCaseProvider);
    return await useCase.execute();
  }

  /// Adiciona um novo cartão de crédito e recarrega a lista.
  Future<void> addCard({
    required String cardHolder,
    required String cardNumber,
    required String expiryDate,
    required String cvv,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final useCase = ref.read(addCreditCardUseCaseProvider);
      await useCase.execute(
        cardHolder: cardHolder,
        cardNumber: cardNumber,
        expiryDate: expiryDate,
        cvv: cvv,
      );
      final listUseCase = ref.read(getSavedPaymentMethodsUseCaseProvider);
      return await listUseCase.execute();
    });
  }
}

/// Notifier que gerencia e carrega a configuração da conta bancária da Instituição autenticada.
@riverpod
class MerchantAccountState extends _$MerchantAccountState {
  @override
  FutureOr<MerchantAccount> build() async {
    final authStateAsync = ref.watch(authProvider);
    final auth = authStateAsync.value;
    if (auth == null || !auth.isAuthenticated) {
      return MerchantAccount.empty();
    }

    final useCase = ref.watch(getMerchantAccountUseCaseProvider);
    return await useCase.execute(auth.cdEscolar ?? 0);
  }

  /// Salva as configurações bancárias na persistência e invalida o estado local.
  Future<void> saveAccount(MerchantAccount newAccount) async {
    final auth = ref.read(authProvider).value;
    if (auth == null || !auth.isAuthenticated) return;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final useCase = ref.read(saveMerchantAccountUseCaseProvider);
      await useCase.execute(auth.cdEscolar ?? 0, newAccount);
      return newAccount;
    });
  }
}
