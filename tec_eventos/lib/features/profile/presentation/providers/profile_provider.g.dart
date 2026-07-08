// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider que injeta a implementação concreta do repositório de perfil.

@ProviderFor(profileRepository)
final profileRepositoryProvider = ProfileRepositoryProvider._();

/// Provider que injeta a implementação concreta do repositório de perfil.

final class ProfileRepositoryProvider extends $FunctionalProvider<
    IProfileRepository,
    IProfileRepository,
    IProfileRepository> with $Provider<IProfileRepository> {
  /// Provider que injeta a implementação concreta do repositório de perfil.
  ProfileRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'profileRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$profileRepositoryHash();

  @$internal
  @override
  $ProviderElement<IProfileRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IProfileRepository create(Ref ref) {
    return profileRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IProfileRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IProfileRepository>(value),
    );
  }
}

String _$profileRepositoryHash() => r'0f3588b31ed99c16ae678822a2e07dff5304251c';

/// Provider que fornece o caso de uso [GetProfileUseCase].

@ProviderFor(getProfileUseCase)
final getProfileUseCaseProvider = GetProfileUseCaseProvider._();

/// Provider que fornece o caso de uso [GetProfileUseCase].

final class GetProfileUseCaseProvider extends $FunctionalProvider<
    GetProfileUseCase,
    GetProfileUseCase,
    GetProfileUseCase> with $Provider<GetProfileUseCase> {
  /// Provider que fornece o caso de uso [GetProfileUseCase].
  GetProfileUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getProfileUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getProfileUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetProfileUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetProfileUseCase create(Ref ref) {
    return getProfileUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProfileUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProfileUseCase>(value),
    );
  }
}

String _$getProfileUseCaseHash() => r'3dc53432c8b476e9520cb695693e9f15b1dd0bed';

/// Provider que fornece o caso de uso [UpdateProfileUseCase].

@ProviderFor(updateProfileUseCase)
final updateProfileUseCaseProvider = UpdateProfileUseCaseProvider._();

/// Provider que fornece o caso de uso [UpdateProfileUseCase].

final class UpdateProfileUseCaseProvider extends $FunctionalProvider<
    UpdateProfileUseCase,
    UpdateProfileUseCase,
    UpdateProfileUseCase> with $Provider<UpdateProfileUseCase> {
  /// Provider que fornece o caso de uso [UpdateProfileUseCase].
  UpdateProfileUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'updateProfileUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$updateProfileUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdateProfileUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UpdateProfileUseCase create(Ref ref) {
    return updateProfileUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateProfileUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateProfileUseCase>(value),
    );
  }
}

String _$updateProfileUseCaseHash() =>
    r'23b9454718c5abd5c4c7aadf6c402a4285d2d94a';

/// Notifier que expõe e gerencia o estado assíncrono do perfil de usuário ativo.

@ProviderFor(Profile)
final profileProvider = ProfileProvider._();

/// Notifier que expõe e gerencia o estado assíncrono do perfil de usuário ativo.
final class ProfileProvider
    extends $AsyncNotifierProvider<Profile, UserProfile> {
  /// Notifier que expõe e gerencia o estado assíncrono do perfil de usuário ativo.
  ProfileProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'profileProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$profileHash();

  @$internal
  @override
  Profile create() => Profile();
}

String _$profileHash() => r'ef4abe83adc90a89775e230dae2b22a080965213';

/// Notifier que expõe e gerencia o estado assíncrono do perfil de usuário ativo.

abstract class _$Profile extends $AsyncNotifier<UserProfile> {
  FutureOr<UserProfile> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<UserProfile>, UserProfile>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<UserProfile>, UserProfile>,
        AsyncValue<UserProfile>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
