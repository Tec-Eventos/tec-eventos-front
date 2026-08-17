// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider que expõe a implementação concreta de [IEventsRepository].

@ProviderFor(eventsRepository)
final eventsRepositoryProvider = EventsRepositoryProvider._();

/// Provider que expõe a implementação concreta de [IEventsRepository].

final class EventsRepositoryProvider extends $FunctionalProvider<
    IEventsRepository,
    IEventsRepository,
    IEventsRepository> with $Provider<IEventsRepository> {
  /// Provider que expõe a implementação concreta de [IEventsRepository].
  EventsRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'eventsRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$eventsRepositoryHash();

  @$internal
  @override
  $ProviderElement<IEventsRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IEventsRepository create(Ref ref) {
    return eventsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IEventsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IEventsRepository>(value),
    );
  }
}

String _$eventsRepositoryHash() => r'e99b3cf9bba5f2c70a32e1c00b536c7a9cdc05e3';

/// Provider para o caso de uso [GetAlunoEventsUseCase].

@ProviderFor(getAlunoEventsUseCase)
final getAlunoEventsUseCaseProvider = GetAlunoEventsUseCaseProvider._();

/// Provider para o caso de uso [GetAlunoEventsUseCase].

final class GetAlunoEventsUseCaseProvider extends $FunctionalProvider<
    GetAlunoEventsUseCase,
    GetAlunoEventsUseCase,
    GetAlunoEventsUseCase> with $Provider<GetAlunoEventsUseCase> {
  /// Provider para o caso de uso [GetAlunoEventsUseCase].
  GetAlunoEventsUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getAlunoEventsUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getAlunoEventsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetAlunoEventsUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetAlunoEventsUseCase create(Ref ref) {
    return getAlunoEventsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetAlunoEventsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetAlunoEventsUseCase>(value),
    );
  }
}

String _$getAlunoEventsUseCaseHash() =>
    r'21e12af64db0fa19845c3580af3e49674ff957bc';

/// Provider para o caso de uso [GetEscolaEventsUseCase].

@ProviderFor(getEscolaEventsUseCase)
final getEscolaEventsUseCaseProvider = GetEscolaEventsUseCaseProvider._();

/// Provider para o caso de uso [GetEscolaEventsUseCase].

final class GetEscolaEventsUseCaseProvider extends $FunctionalProvider<
    GetEscolaEventsUseCase,
    GetEscolaEventsUseCase,
    GetEscolaEventsUseCase> with $Provider<GetEscolaEventsUseCase> {
  /// Provider para o caso de uso [GetEscolaEventsUseCase].
  GetEscolaEventsUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getEscolaEventsUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getEscolaEventsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetEscolaEventsUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetEscolaEventsUseCase create(Ref ref) {
    return getEscolaEventsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetEscolaEventsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetEscolaEventsUseCase>(value),
    );
  }
}

String _$getEscolaEventsUseCaseHash() =>
    r'b6f25b505d688d351439161237b9c4d498771c4c';

/// Provider para o caso de uso [PostEventUseCase].

@ProviderFor(postEventUseCase)
final postEventUseCaseProvider = PostEventUseCaseProvider._();

/// Provider para o caso de uso [PostEventUseCase].

final class PostEventUseCaseProvider extends $FunctionalProvider<
    PostEventUseCase,
    PostEventUseCase,
    PostEventUseCase> with $Provider<PostEventUseCase> {
  /// Provider para o caso de uso [PostEventUseCase].
  PostEventUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'postEventUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$postEventUseCaseHash();

  @$internal
  @override
  $ProviderElement<PostEventUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PostEventUseCase create(Ref ref) {
    return postEventUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostEventUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostEventUseCase>(value),
    );
  }
}

String _$postEventUseCaseHash() => r'e6c433b56c17c3cf5a746baef167d46c81906e98';

/// Provider reativo que expõe a lista de eventos voltados ao Aluno logado.

@ProviderFor(alunoEventsList)
final alunoEventsListProvider = AlunoEventsListProvider._();

/// Provider reativo que expõe a lista de eventos voltados ao Aluno logado.

final class AlunoEventsListProvider extends $FunctionalProvider<
        AsyncValue<List<AppEvent>>, List<AppEvent>, FutureOr<List<AppEvent>>>
    with $FutureModifier<List<AppEvent>>, $FutureProvider<List<AppEvent>> {
  /// Provider reativo que expõe a lista de eventos voltados ao Aluno logado.
  AlunoEventsListProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'alunoEventsListProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$alunoEventsListHash();

  @$internal
  @override
  $FutureProviderElement<List<AppEvent>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<AppEvent>> create(Ref ref) {
    return alunoEventsList(ref);
  }
}

String _$alunoEventsListHash() => r'fc0080958b38a4d919fc2ba6d79bbf1163808fd2';

/// Provider reativo que expõe a lista de eventos cadastrados pela Instituição logada.

@ProviderFor(escolaEventsList)
final escolaEventsListProvider = EscolaEventsListProvider._();

/// Provider reativo que expõe a lista de eventos cadastrados pela Instituição logada.

final class EscolaEventsListProvider extends $FunctionalProvider<
        AsyncValue<List<AppEvent>>, List<AppEvent>, FutureOr<List<AppEvent>>>
    with $FutureModifier<List<AppEvent>>, $FutureProvider<List<AppEvent>> {
  /// Provider reativo que expõe a lista de eventos cadastrados pela Instituição logada.
  EscolaEventsListProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'escolaEventsListProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$escolaEventsListHash();

  @$internal
  @override
  $FutureProviderElement<List<AppEvent>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<AppEvent>> create(Ref ref) {
    return escolaEventsList(ref);
  }
}

String _$escolaEventsListHash() => r'4f53f5ab9faf1360daa48d8f4735637278686c36';

/// Notifier que controla o estado de postagem/criação de um novo evento.

@ProviderFor(CreateEventState)
final createEventStateProvider = CreateEventStateProvider._();

/// Notifier que controla o estado de postagem/criação de um novo evento.
final class CreateEventStateProvider
    extends $AsyncNotifierProvider<CreateEventState, void> {
  /// Notifier que controla o estado de postagem/criação de um novo evento.
  CreateEventStateProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'createEventStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$createEventStateHash();

  @$internal
  @override
  CreateEventState create() => CreateEventState();
}

String _$createEventStateHash() => r'b173d1908e89826f4f573e3319a86669955aeaab';

/// Notifier que controla o estado de postagem/criação de um novo evento.

abstract class _$CreateEventState extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<void>, void>,
        AsyncValue<void>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
