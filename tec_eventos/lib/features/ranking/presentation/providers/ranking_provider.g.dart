// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider que injeta a implementação concreta do repositório de ranking.

@ProviderFor(rankingRepository)
final rankingRepositoryProvider = RankingRepositoryProvider._();

/// Provider que injeta a implementação concreta do repositório de ranking.

final class RankingRepositoryProvider extends $FunctionalProvider<
    IRankingRepository,
    IRankingRepository,
    IRankingRepository> with $Provider<IRankingRepository> {
  /// Provider que injeta a implementação concreta do repositório de ranking.
  RankingRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'rankingRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$rankingRepositoryHash();

  @$internal
  @override
  $ProviderElement<IRankingRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IRankingRepository create(Ref ref) {
    return rankingRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IRankingRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IRankingRepository>(value),
    );
  }
}

String _$rankingRepositoryHash() => r'c6447b7e6a4c388c712a6b1f3cdb63e8d9cb9865';

/// Provider que injeta o caso de uso [GetRankingUseCase].

@ProviderFor(getRankingUseCase)
final getRankingUseCaseProvider = GetRankingUseCaseProvider._();

/// Provider que injeta o caso de uso [GetRankingUseCase].

final class GetRankingUseCaseProvider extends $FunctionalProvider<
    GetRankingUseCase,
    GetRankingUseCase,
    GetRankingUseCase> with $Provider<GetRankingUseCase> {
  /// Provider que injeta o caso de uso [GetRankingUseCase].
  GetRankingUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getRankingUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getRankingUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetRankingUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetRankingUseCase create(Ref ref) {
    return getRankingUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetRankingUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetRankingUseCase>(value),
    );
  }
}

String _$getRankingUseCaseHash() => r'f832a0eb15eeaa4497a94fb2fa29e8616fca67c8';

/// Provider auto-gerado que expõe a lista de usuários ranqueados consultada assincronamente.

@ProviderFor(rankingList)
final rankingListProvider = RankingListProvider._();

/// Provider auto-gerado que expõe a lista de usuários ranqueados consultada assincronamente.

final class RankingListProvider extends $FunctionalProvider<
        AsyncValue<List<RankingUser>>,
        List<RankingUser>,
        FutureOr<List<RankingUser>>>
    with
        $FutureModifier<List<RankingUser>>,
        $FutureProvider<List<RankingUser>> {
  /// Provider auto-gerado que expõe a lista de usuários ranqueados consultada assincronamente.
  RankingListProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'rankingListProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$rankingListHash();

  @$internal
  @override
  $FutureProviderElement<List<RankingUser>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<RankingUser>> create(Ref ref) {
    return rankingList(ref);
  }
}

String _$rankingListHash() => r'8f1fc6f0c0ff6897ce3d08d4c7d1839a8db4f2f9';
