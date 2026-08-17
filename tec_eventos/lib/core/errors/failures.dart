/// Define a estrutura de falhas (Failures) e exceções tipadas de negócio da aplicação.
///
/// Todas as falhas geradas na camada de dados (Data) devem ser mapeadas para
/// subclasses desta classe base para serem propagadas com segurança até a camada
/// de apresentação.
abstract class Failure implements Exception {
  /// Mensagem amigável descrevendo o erro para o usuário.
  final String message;

  /// Construtor padrão da falha com uma mensagem obrigatória.
  Failure(this.message);

  @override
  String toString() => message;
}

/// Falha indicando problemas de conectividade de rede ou tempo limite esgotado.
class NetworkFailure extends Failure {
  /// Cria uma instância de [NetworkFailure], opcionalmente definindo uma mensagem customizada.
  NetworkFailure([String message = 'Sem conexão com a internet. Verifique sua rede e tente novamente.']) : super(message);
}

/// Falha indicando erros internos ou indisponibilidade no servidor (HTTP 500, 502, etc).
class ServerFailure extends Failure {
  /// Cria uma instância de [ServerFailure], opcionalmente definindo uma mensagem customizada.
  ServerFailure([String message = 'Ocorreu um erro temporário no servidor. Tente novamente mais tarde.']) : super(message);
}

/// Falha indicando problemas de autenticação ou falta de permissão de acesso (HTTP 401, 403).
class UnauthorizedFailure extends Failure {
  /// Cria uma instância de [UnauthorizedFailure], opcionalmente definindo uma mensagem customizada.
  UnauthorizedFailure([String message = 'Sessão expirada ou não autorizada. Por favor, faça login novamente.']) : super(message);
}

/// Falha indicando erro de validação de parâmetros enviados à API ou regras de negócio violadas (HTTP 400, 422).
class ValidationFailure extends Failure {
  /// Cria uma instância de [ValidationFailure] com uma mensagem obrigatória de erro de validação.
  ValidationFailure(String message) : super(message);
}

/// Falha indicando que o recurso solicitado não pôde ser encontrado (HTTP 404).
class NotFoundFailure extends Failure {
  /// Cria uma instância de [NotFoundFailure], opcionalmente definindo uma mensagem customizada.
  NotFoundFailure([String message = 'Recurso não encontrado.']) : super(message);
}

/// Falha curinga para capturar qualquer exceção desconhecida ou não tratada explicitamente.
class UnknownFailure extends Failure {
  /// Cria uma instância de [UnknownFailure] com detalhes do erro inesperado.
  UnknownFailure(String message) : super(message);
}
