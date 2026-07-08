// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider que fornece o repositório de autenticação.

@ProviderFor(authRepository)
final authRepositoryProvider = AuthRepositoryProvider._();

/// Provider que fornece o repositório de autenticação.

final class AuthRepositoryProvider extends $FunctionalProvider<IAuthRepository,
    IAuthRepository, IAuthRepository> with $Provider<IAuthRepository> {
  /// Provider que fornece o repositório de autenticação.
  AuthRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'authRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<IAuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IAuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IAuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IAuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'e7e1f95db2df4dce5b0ad08fcf1f0455efb64c05';

/// Provider para o caso de uso [LoginAlunoUseCase].

@ProviderFor(loginAlunoUseCase)
final loginAlunoUseCaseProvider = LoginAlunoUseCaseProvider._();

/// Provider para o caso de uso [LoginAlunoUseCase].

final class LoginAlunoUseCaseProvider extends $FunctionalProvider<
    LoginAlunoUseCase,
    LoginAlunoUseCase,
    LoginAlunoUseCase> with $Provider<LoginAlunoUseCase> {
  /// Provider para o caso de uso [LoginAlunoUseCase].
  LoginAlunoUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'loginAlunoUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$loginAlunoUseCaseHash();

  @$internal
  @override
  $ProviderElement<LoginAlunoUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginAlunoUseCase create(Ref ref) {
    return loginAlunoUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginAlunoUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginAlunoUseCase>(value),
    );
  }
}

String _$loginAlunoUseCaseHash() => r'd3a3aabb1ec3baffb8211ed8527c9dea55d342de';

/// Provider para o caso de uso [LoginInstituicaoUseCase].

@ProviderFor(loginInstituicaoUseCase)
final loginInstituicaoUseCaseProvider = LoginInstituicaoUseCaseProvider._();

/// Provider para o caso de uso [LoginInstituicaoUseCase].

final class LoginInstituicaoUseCaseProvider extends $FunctionalProvider<
    LoginInstituicaoUseCase,
    LoginInstituicaoUseCase,
    LoginInstituicaoUseCase> with $Provider<LoginInstituicaoUseCase> {
  /// Provider para o caso de uso [LoginInstituicaoUseCase].
  LoginInstituicaoUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'loginInstituicaoUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$loginInstituicaoUseCaseHash();

  @$internal
  @override
  $ProviderElement<LoginInstituicaoUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginInstituicaoUseCase create(Ref ref) {
    return loginInstituicaoUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginInstituicaoUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginInstituicaoUseCase>(value),
    );
  }
}

String _$loginInstituicaoUseCaseHash() =>
    r'd9f100f8a3c657e8ca973e15a1db8cc164be58f7';

/// Provider para o caso de uso [RegisterAlunoUseCase].

@ProviderFor(registerAlunoUseCase)
final registerAlunoUseCaseProvider = RegisterAlunoUseCaseProvider._();

/// Provider para o caso de uso [RegisterAlunoUseCase].

final class RegisterAlunoUseCaseProvider extends $FunctionalProvider<
    RegisterAlunoUseCase,
    RegisterAlunoUseCase,
    RegisterAlunoUseCase> with $Provider<RegisterAlunoUseCase> {
  /// Provider para o caso de uso [RegisterAlunoUseCase].
  RegisterAlunoUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'registerAlunoUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$registerAlunoUseCaseHash();

  @$internal
  @override
  $ProviderElement<RegisterAlunoUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RegisterAlunoUseCase create(Ref ref) {
    return registerAlunoUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RegisterAlunoUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RegisterAlunoUseCase>(value),
    );
  }
}

String _$registerAlunoUseCaseHash() =>
    r'e81635cfab028659941cb51fe7c5218222a67eea';

/// Provider para o caso de uso [RegisterInstituicaoUseCase].

@ProviderFor(registerInstituicaoUseCase)
final registerInstituicaoUseCaseProvider =
    RegisterInstituicaoUseCaseProvider._();

/// Provider para o caso de uso [RegisterInstituicaoUseCase].

final class RegisterInstituicaoUseCaseProvider extends $FunctionalProvider<
    RegisterInstituicaoUseCase,
    RegisterInstituicaoUseCase,
    RegisterInstituicaoUseCase> with $Provider<RegisterInstituicaoUseCase> {
  /// Provider para o caso de uso [RegisterInstituicaoUseCase].
  RegisterInstituicaoUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'registerInstituicaoUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$registerInstituicaoUseCaseHash();

  @$internal
  @override
  $ProviderElement<RegisterInstituicaoUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RegisterInstituicaoUseCase create(Ref ref) {
    return registerInstituicaoUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RegisterInstituicaoUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RegisterInstituicaoUseCase>(value),
    );
  }
}

String _$registerInstituicaoUseCaseHash() =>
    r'191d4631390b52b839c7dec390d5fe31cbb1223f';

/// Provider para o caso de uso [LogoutUseCase].

@ProviderFor(logoutUseCase)
final logoutUseCaseProvider = LogoutUseCaseProvider._();

/// Provider para o caso de uso [LogoutUseCase].

final class LogoutUseCaseProvider
    extends $FunctionalProvider<LogoutUseCase, LogoutUseCase, LogoutUseCase>
    with $Provider<LogoutUseCase> {
  /// Provider para o caso de uso [LogoutUseCase].
  LogoutUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'logoutUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$logoutUseCaseHash();

  @$internal
  @override
  $ProviderElement<LogoutUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LogoutUseCase create(Ref ref) {
    return logoutUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LogoutUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LogoutUseCase>(value),
    );
  }
}

String _$logoutUseCaseHash() => r'67224f00aebb158eab2aba2c4398e98150dd958c';

/// Notifier do Riverpod que gerencia o estado da sessão de autenticação ativa.
///
/// Encapsula métodos de login, logout e sincronização reativa com as telas do app.

@ProviderFor(Auth)
final authProvider = AuthProvider._();

/// Notifier do Riverpod que gerencia o estado da sessão de autenticação ativa.
///
/// Encapsula métodos de login, logout e sincronização reativa com as telas do app.
final class AuthProvider extends $AsyncNotifierProvider<Auth, AuthState?> {
  /// Notifier do Riverpod que gerencia o estado da sessão de autenticação ativa.
  ///
  /// Encapsula métodos de login, logout e sincronização reativa com as telas do app.
  AuthProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'authProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$authHash();

  @$internal
  @override
  Auth create() => Auth();
}

String _$authHash() => r'49d7d9b29064c5ffcd35246f673e859ab40aa23a';

/// Notifier do Riverpod que gerencia o estado da sessão de autenticação ativa.
///
/// Encapsula métodos de login, logout e sincronização reativa com as telas do app.

abstract class _$Auth extends $AsyncNotifier<AuthState?> {
  FutureOr<AuthState?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AuthState?>, AuthState?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<AuthState?>, AuthState?>,
        AsyncValue<AuthState?>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
