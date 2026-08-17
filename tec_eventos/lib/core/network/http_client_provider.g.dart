// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider que expõe a instância única configurada de [IHttpClient] utilizando Dio.

@ProviderFor(httpClient)
final httpClientProvider = HttpClientProvider._();

/// Provider que expõe a instância única configurada de [IHttpClient] utilizando Dio.

final class HttpClientProvider
    extends $FunctionalProvider<IHttpClient, IHttpClient, IHttpClient>
    with $Provider<IHttpClient> {
  /// Provider que expõe a instância única configurada de [IHttpClient] utilizando Dio.
  HttpClientProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'httpClientProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$httpClientHash();

  @$internal
  @override
  $ProviderElement<IHttpClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IHttpClient create(Ref ref) {
    return httpClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IHttpClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IHttpClient>(value),
    );
  }
}

String _$httpClientHash() => r'3b0305be21b669b068c894f4baca2fe0368b9b53';
