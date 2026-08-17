// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tickets_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider que expõe a implementação do repositório de ingressos.

@ProviderFor(ticketsRepository)
final ticketsRepositoryProvider = TicketsRepositoryProvider._();

/// Provider que expõe a implementação do repositório de ingressos.

final class TicketsRepositoryProvider extends $FunctionalProvider<
    ITicketsRepository,
    ITicketsRepository,
    ITicketsRepository> with $Provider<ITicketsRepository> {
  /// Provider que expõe a implementação do repositório de ingressos.
  TicketsRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'ticketsRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$ticketsRepositoryHash();

  @$internal
  @override
  $ProviderElement<ITicketsRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ITicketsRepository create(Ref ref) {
    return ticketsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ITicketsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ITicketsRepository>(value),
    );
  }
}

String _$ticketsRepositoryHash() => r'263af9930969e882ccb13c035b90dea172cc9fd7';

/// Provider que fornece o caso de uso [GetTicketsUseCase].

@ProviderFor(getTicketsUseCase)
final getTicketsUseCaseProvider = GetTicketsUseCaseProvider._();

/// Provider que fornece o caso de uso [GetTicketsUseCase].

final class GetTicketsUseCaseProvider extends $FunctionalProvider<
    GetTicketsUseCase,
    GetTicketsUseCase,
    GetTicketsUseCase> with $Provider<GetTicketsUseCase> {
  /// Provider que fornece o caso de uso [GetTicketsUseCase].
  GetTicketsUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getTicketsUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getTicketsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetTicketsUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetTicketsUseCase create(Ref ref) {
    return getTicketsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetTicketsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetTicketsUseCase>(value),
    );
  }
}

String _$getTicketsUseCaseHash() => r'49b7dba51c677ed0d88d3bca213974f4e99fd241';

/// Provider auto-gerado que expõe a lista de ingressos do usuário de forma reativa à sessão.

@ProviderFor(ticketsList)
final ticketsListProvider = TicketsListProvider._();

/// Provider auto-gerado que expõe a lista de ingressos do usuário de forma reativa à sessão.

final class TicketsListProvider extends $FunctionalProvider<
        AsyncValue<List<Ticket>>, List<Ticket>, FutureOr<List<Ticket>>>
    with $FutureModifier<List<Ticket>>, $FutureProvider<List<Ticket>> {
  /// Provider auto-gerado que expõe a lista de ingressos do usuário de forma reativa à sessão.
  TicketsListProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'ticketsListProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$ticketsListHash();

  @$internal
  @override
  $FutureProviderElement<List<Ticket>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Ticket>> create(Ref ref) {
    return ticketsList(ref);
  }
}

String _$ticketsListHash() => r'f80f52f34dc977361923a7bce02a5bc0cf91e148';
