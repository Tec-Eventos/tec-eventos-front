// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider que injeta a implementação concreta do repositório de notificações.

@ProviderFor(notificationsRepository)
final notificationsRepositoryProvider = NotificationsRepositoryProvider._();

/// Provider que injeta a implementação concreta do repositório de notificações.

final class NotificationsRepositoryProvider extends $FunctionalProvider<
    INotificationsRepository,
    INotificationsRepository,
    INotificationsRepository> with $Provider<INotificationsRepository> {
  /// Provider que injeta a implementação concreta do repositório de notificações.
  NotificationsRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'notificationsRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$notificationsRepositoryHash();

  @$internal
  @override
  $ProviderElement<INotificationsRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  INotificationsRepository create(Ref ref) {
    return notificationsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(INotificationsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<INotificationsRepository>(value),
    );
  }
}

String _$notificationsRepositoryHash() =>
    r'bd251696540561eaad33ed6a6c6ebe0ba4e357d5';

/// Provider que injeta o caso de uso [GetNotificationsUseCase].

@ProviderFor(getNotificationsUseCase)
final getNotificationsUseCaseProvider = GetNotificationsUseCaseProvider._();

/// Provider que injeta o caso de uso [GetNotificationsUseCase].

final class GetNotificationsUseCaseProvider extends $FunctionalProvider<
    GetNotificationsUseCase,
    GetNotificationsUseCase,
    GetNotificationsUseCase> with $Provider<GetNotificationsUseCase> {
  /// Provider que injeta o caso de uso [GetNotificationsUseCase].
  GetNotificationsUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getNotificationsUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getNotificationsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetNotificationsUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetNotificationsUseCase create(Ref ref) {
    return getNotificationsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetNotificationsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetNotificationsUseCase>(value),
    );
  }
}

String _$getNotificationsUseCaseHash() =>
    r'b922dc3c29ef21297fca8615a2a10f2ca4a22609';

/// Provider que injeta o caso de uso [ToggleFollowUseCase].

@ProviderFor(toggleFollowUseCase)
final toggleFollowUseCaseProvider = ToggleFollowUseCaseProvider._();

/// Provider que injeta o caso de uso [ToggleFollowUseCase].

final class ToggleFollowUseCaseProvider extends $FunctionalProvider<
    ToggleFollowUseCase,
    ToggleFollowUseCase,
    ToggleFollowUseCase> with $Provider<ToggleFollowUseCase> {
  /// Provider que injeta o caso de uso [ToggleFollowUseCase].
  ToggleFollowUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'toggleFollowUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$toggleFollowUseCaseHash();

  @$internal
  @override
  $ProviderElement<ToggleFollowUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ToggleFollowUseCase create(Ref ref) {
    return toggleFollowUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ToggleFollowUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ToggleFollowUseCase>(value),
    );
  }
}

String _$toggleFollowUseCaseHash() =>
    r'41260406971bbd6fb44f3d459ee67d06ddfe124e';

/// Notifier que gerencia a lista de notificações e as atualizações de estado do relacionamento.

@ProviderFor(Notifications)
final notificationsProvider = NotificationsProvider._();

/// Notifier que gerencia a lista de notificações e as atualizações de estado do relacionamento.
final class NotificationsProvider
    extends $AsyncNotifierProvider<Notifications, List<AppNotification>> {
  /// Notifier que gerencia a lista de notificações e as atualizações de estado do relacionamento.
  NotificationsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'notificationsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$notificationsHash();

  @$internal
  @override
  Notifications create() => Notifications();
}

String _$notificationsHash() => r'49d22154d616b6c463df6dda37e942a1b8963bd1';

/// Notifier que gerencia a lista de notificações e as atualizações de estado do relacionamento.

abstract class _$Notifications extends $AsyncNotifier<List<AppNotification>> {
  FutureOr<List<AppNotification>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref
        as $Ref<AsyncValue<List<AppNotification>>, List<AppNotification>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<AppNotification>>, List<AppNotification>>,
        AsyncValue<List<AppNotification>>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
