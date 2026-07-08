// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider que expõe a implementação concreta do repositório de pagamentos.

@ProviderFor(paymentRepository)
final paymentRepositoryProvider = PaymentRepositoryProvider._();

/// Provider que expõe a implementação concreta do repositório de pagamentos.

final class PaymentRepositoryProvider extends $FunctionalProvider<
    IPaymentRepository,
    IPaymentRepository,
    IPaymentRepository> with $Provider<IPaymentRepository> {
  /// Provider que expõe a implementação concreta do repositório de pagamentos.
  PaymentRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'paymentRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$paymentRepositoryHash();

  @$internal
  @override
  $ProviderElement<IPaymentRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IPaymentRepository create(Ref ref) {
    return paymentRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IPaymentRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IPaymentRepository>(value),
    );
  }
}

String _$paymentRepositoryHash() => r'0f14670b8c3a01e20b4b3b60e97abea7a68f879f';

/// Provider para o caso de uso [GetSavedPaymentMethodsUseCase].

@ProviderFor(getSavedPaymentMethodsUseCase)
final getSavedPaymentMethodsUseCaseProvider =
    GetSavedPaymentMethodsUseCaseProvider._();

/// Provider para o caso de uso [GetSavedPaymentMethodsUseCase].

final class GetSavedPaymentMethodsUseCaseProvider extends $FunctionalProvider<
        GetSavedPaymentMethodsUseCase,
        GetSavedPaymentMethodsUseCase,
        GetSavedPaymentMethodsUseCase>
    with $Provider<GetSavedPaymentMethodsUseCase> {
  /// Provider para o caso de uso [GetSavedPaymentMethodsUseCase].
  GetSavedPaymentMethodsUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getSavedPaymentMethodsUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getSavedPaymentMethodsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetSavedPaymentMethodsUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetSavedPaymentMethodsUseCase create(Ref ref) {
    return getSavedPaymentMethodsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetSavedPaymentMethodsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<GetSavedPaymentMethodsUseCase>(value),
    );
  }
}

String _$getSavedPaymentMethodsUseCaseHash() =>
    r'ec3551e48f400b13be8b637ef733d85f48276ec8';

/// Provider para o caso de uso [AddCreditCardUseCase].

@ProviderFor(addCreditCardUseCase)
final addCreditCardUseCaseProvider = AddCreditCardUseCaseProvider._();

/// Provider para o caso de uso [AddCreditCardUseCase].

final class AddCreditCardUseCaseProvider extends $FunctionalProvider<
    AddCreditCardUseCase,
    AddCreditCardUseCase,
    AddCreditCardUseCase> with $Provider<AddCreditCardUseCase> {
  /// Provider para o caso de uso [AddCreditCardUseCase].
  AddCreditCardUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'addCreditCardUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$addCreditCardUseCaseHash();

  @$internal
  @override
  $ProviderElement<AddCreditCardUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AddCreditCardUseCase create(Ref ref) {
    return addCreditCardUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddCreditCardUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddCreditCardUseCase>(value),
    );
  }
}

String _$addCreditCardUseCaseHash() =>
    r'3466d7790af771743a7a3bb4317281b811644d61';

/// Provider para o caso de uso [GetMerchantAccountUseCase].

@ProviderFor(getMerchantAccountUseCase)
final getMerchantAccountUseCaseProvider = GetMerchantAccountUseCaseProvider._();

/// Provider para o caso de uso [GetMerchantAccountUseCase].

final class GetMerchantAccountUseCaseProvider extends $FunctionalProvider<
    GetMerchantAccountUseCase,
    GetMerchantAccountUseCase,
    GetMerchantAccountUseCase> with $Provider<GetMerchantAccountUseCase> {
  /// Provider para o caso de uso [GetMerchantAccountUseCase].
  GetMerchantAccountUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getMerchantAccountUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getMerchantAccountUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetMerchantAccountUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetMerchantAccountUseCase create(Ref ref) {
    return getMerchantAccountUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetMerchantAccountUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetMerchantAccountUseCase>(value),
    );
  }
}

String _$getMerchantAccountUseCaseHash() =>
    r'70350d04d4f7048af95d5f0c686753d0ef0eb291';

/// Provider para o caso de uso [SaveMerchantAccountUseCase].

@ProviderFor(saveMerchantAccountUseCase)
final saveMerchantAccountUseCaseProvider =
    SaveMerchantAccountUseCaseProvider._();

/// Provider para o caso de uso [SaveMerchantAccountUseCase].

final class SaveMerchantAccountUseCaseProvider extends $FunctionalProvider<
    SaveMerchantAccountUseCase,
    SaveMerchantAccountUseCase,
    SaveMerchantAccountUseCase> with $Provider<SaveMerchantAccountUseCase> {
  /// Provider para o caso de uso [SaveMerchantAccountUseCase].
  SaveMerchantAccountUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'saveMerchantAccountUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$saveMerchantAccountUseCaseHash();

  @$internal
  @override
  $ProviderElement<SaveMerchantAccountUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SaveMerchantAccountUseCase create(Ref ref) {
    return saveMerchantAccountUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SaveMerchantAccountUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SaveMerchantAccountUseCase>(value),
    );
  }
}

String _$saveMerchantAccountUseCaseHash() =>
    r'9e8bc3d6a952e7f78ba6a8efa2ba2fc6473c703f';

/// Provider reativo para listar os cartões salvos do aluno.

@ProviderFor(SavedPaymentMethodsList)
final savedPaymentMethodsListProvider = SavedPaymentMethodsListProvider._();

/// Provider reativo para listar os cartões salvos do aluno.
final class SavedPaymentMethodsListProvider extends $AsyncNotifierProvider<
    SavedPaymentMethodsList, List<PaymentMethod>> {
  /// Provider reativo para listar os cartões salvos do aluno.
  SavedPaymentMethodsListProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'savedPaymentMethodsListProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$savedPaymentMethodsListHash();

  @$internal
  @override
  SavedPaymentMethodsList create() => SavedPaymentMethodsList();
}

String _$savedPaymentMethodsListHash() =>
    r'66138acf6e3014de20c6e1cd9975867b0aba24fb';

/// Provider reativo para listar os cartões salvos do aluno.

abstract class _$SavedPaymentMethodsList
    extends $AsyncNotifier<List<PaymentMethod>> {
  FutureOr<List<PaymentMethod>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<PaymentMethod>>, List<PaymentMethod>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<PaymentMethod>>, List<PaymentMethod>>,
        AsyncValue<List<PaymentMethod>>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

/// Notifier que gerencia e carrega a configuração da conta bancária da Instituição autenticada.

@ProviderFor(MerchantAccountState)
final merchantAccountStateProvider = MerchantAccountStateProvider._();

/// Notifier que gerencia e carrega a configuração da conta bancária da Instituição autenticada.
final class MerchantAccountStateProvider
    extends $AsyncNotifierProvider<MerchantAccountState, MerchantAccount> {
  /// Notifier que gerencia e carrega a configuração da conta bancária da Instituição autenticada.
  MerchantAccountStateProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'merchantAccountStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$merchantAccountStateHash();

  @$internal
  @override
  MerchantAccountState create() => MerchantAccountState();
}

String _$merchantAccountStateHash() =>
    r'fcc8bee4acba968cd3bab26f0c1f5d375d3e234e';

/// Notifier que gerencia e carrega a configuração da conta bancária da Instituição autenticada.

abstract class _$MerchantAccountState extends $AsyncNotifier<MerchantAccount> {
  FutureOr<MerchantAccount> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<MerchantAccount>, MerchantAccount>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<MerchantAccount>, MerchantAccount>,
        AsyncValue<MerchantAccount>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
