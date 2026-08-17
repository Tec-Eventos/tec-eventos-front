import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tec_eventos/core/network/http_client.dart';

part 'http_client_provider.g.dart';

/// Provider que expõe a instância única configurada de [IHttpClient] utilizando Dio.
@riverpod
IHttpClient httpClient(Ref ref) {
  return DioClient(Dio());
}
