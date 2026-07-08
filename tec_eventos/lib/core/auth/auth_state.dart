/// Representa o estado de autenticação unificado e persistido da sessão atual.
///
/// Encapsula os dados do usuário conectado, seja ele um Aluno ou uma Instituição.
class AuthState {
  /// Nome do usuário (Nome do Aluno ou Nome da Instituição).
  final String? name;

  /// E-mail cadastrado do usuário.
  final String? email;

  /// Registro de Matrícula (RM) do Aluno. Nulo se o usuário logado for uma Instituição.
  final int? rm;

  /// Código Escolar identificador da Instituição. Nulo se o usuário logado for um Aluno.
  final int? cdEscolar;

  /// Tipo de usuário ativo na sessão atual ('Aluno', 'Instituição' ou 'None').
  final String userType;

  /// Construtor principal para definição do estado de sessão.
  AuthState({
    this.name,
    this.email,
    this.rm,
    this.cdEscolar,
    required this.userType,
  });

  /// Construtor de estado vazio para indicar ausência de login.
  factory AuthState.empty() => AuthState(userType: 'None');

  /// Verifica se o usuário atual é do tipo Aluno.
  bool get isAluno => userType == 'Aluno';

  /// Verifica se o usuário atual é do tipo Instituição.
  bool get isInstituicao => userType == 'Instituição';

  /// Verifica se há um usuário autenticado ativo.
  bool get isAuthenticated => userType != 'None';
}
