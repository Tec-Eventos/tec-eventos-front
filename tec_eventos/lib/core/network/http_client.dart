import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tec_eventos/core/errors/failures.dart';

/// Contrato para o cliente HTTP global da aplicação.
///
/// Define as assinaturas das principais operações de rede.
abstract class IHttpClient {
  /// Realiza uma requisição GET.
  ///
  /// Recebe um [path] relativo e [queryParameters] adicionais.
  /// Retorna o corpo da resposta decodificado.
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters});

  /// Realiza uma requisição POST.
  ///
  /// Recebe um [path] relativo e o [data] da requisição.
  /// Retorna o corpo da resposta decodificado.
  Future<dynamic> post(String path, {dynamic data});

  /// Realiza uma requisição PUT.
  ///
  /// Recebe um [path] relativo e o [data] da requisição.
  /// Retorna o corpo da resposta decodificado.
  Future<dynamic> put(String path, {dynamic data});

  /// Realiza uma requisição DELETE.
  ///
  /// Recebe um [path] relativo e o [data] opcional da requisição.
  /// Retorna o corpo da resposta decodificado.
  Future<dynamic> delete(String path, {dynamic data});

  /// Realiza uma requisição POST Multipart (envio de formulários com arquivos/imagens).
  ///
  /// Recebe um [path] relativo, os campos de texto no mapa [fields] e os arquivos
  /// representados por objetos [File] mapeados por suas respectivas chaves em [files].
  /// Retorna o corpo da resposta decodificado.
  Future<dynamic> postMultipart(
    String path, {
    required Map<String, dynamic> fields,
    required Map<String, File> files,
  });
}

/// Implementação concreta do contrato [IHttpClient] utilizando a biblioteca Dio.
///
/// Centraliza a configuração de timeout, baseUrl e faz o mapeamento
/// automático de exceções de rede [DioException] para exceções de negócio [Failure].
class DioClient implements IHttpClient {
  final Dio _dio;

  /// Cria uma nova instância de [DioClient] injetando a dependência do [Dio].
  DioClient(this._dio) {
    _dio.options.baseUrl = 'https://api-tec-eventos-i6hr.onrender.com';
    _dio.options.connectTimeout = const Duration(seconds: 15);
    _dio.options.receiveTimeout = const Duration(seconds: 15);
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  @override
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<dynamic> post(String path, {dynamic data}) async {
    try {
      final response = await _dio.post(path, data: data);
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<dynamic> put(String path, {dynamic data}) async {
    try {
      final response = await _dio.put(path, data: data);
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<dynamic> delete(String path, {dynamic data}) async {
    try {
      final response = await _dio.delete(path, data: data);
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<dynamic> postMultipart(
    String path, {
    required Map<String, dynamic> fields,
    required Map<String, File> files,
  }) async {
    try {
      final Map<String, dynamic> formDataMap = {...fields};

      // Adiciona cada arquivo ao FormData
      for (final entry in files.entries) {
        final file = entry.value;
        final filename = file.path.split('/').last;
        formDataMap[entry.key] = await MultipartFile.fromFile(
          file.path,
          filename: filename,
        );
      }

      final formData = FormData.fromMap(formDataMap);

      final response = await _dio.post(
        path,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// Trata a exceção [DioException] e a converte em uma subclasse correspondente de [Failure].
  Failure _handleDioError(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionError) {
      return NetworkFailure();
    }

    final response = error.response;
    if (response != null) {
      final statusCode = response.statusCode;
      final responseData = response.data;
      String message = '';

      if (responseData is Map) {
        if (responseData.containsKey('message')) {
          message = responseData['message'].toString();
        } else if (responseData.containsKey('error')) {
          message = responseData['error'].toString();
        }
      }

      switch (statusCode) {
        case 400:
        case 422:
          return ValidationFailure(
            message.isNotEmpty ? message : 'Dados de entrada inválidos ou inconsistentes.',
          );
        case 401:
        case 403:
          return UnauthorizedFailure(
            message.isNotEmpty ? message : 'Sessão expirada ou acesso não autorizado.',
          );
        case 404:
          return NotFoundFailure(
            message.isNotEmpty ? message : 'O recurso solicitado não foi encontrado.',
          );
        case 500:
        case 502:
        case 503:
          return ServerFailure();
        default:
          return UnknownFailure(
            message.isNotEmpty ? message : 'Ocorreu um erro inesperado ($statusCode).',
          );
      }
    }

    return UnknownFailure(
      error.message ?? 'Ocorreu um erro de comunicação com o servidor.',
    );
  }
}
