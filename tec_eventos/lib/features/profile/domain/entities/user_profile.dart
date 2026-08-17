/// Representa o perfil de usuário unificado para Aluno ou Instituição.
///
/// Encapsula dados cadastrais de contato, localização e informações
/// de engajamento social (seguidores/seguindo).
class UserProfile {
  /// Nome de exibição do usuário.
  final String name;

  /// E-mail cadastrado.
  final String email;

  /// Número de telefone/celular para contato.
  final String phone;

  /// Registro de Matrícula (Aluno) ou Código Escolar (Instituição).
  final String identificationCode;

  /// Nome da instituição escolar vinculada (ex: Etec).
  final String institutionName;

  /// Cidade e Estado de residência/atuação (ex: 'Marília, SP').
  final String city;

  /// Profissão, cargo ou descrição curta de atuação (ex: 'Estudante').
  final String profession;

  /// Caminho local ou URL da foto de perfil.
  final String avatarUrl;

  /// Quantidade de usuários que este perfil está seguindo.
  final int followingCount;

  /// Quantidade de seguidores deste perfil.
  final int followersCount;

  /// Construtor padrão da entidade de perfil do usuário.
  const UserProfile({
    required this.name,
    required this.email,
    required this.phone,
    required this.identificationCode,
    required this.institutionName,
    required this.city,
    required this.profession,
    required this.avatarUrl,
    required this.followingCount,
    required this.followersCount,
  });

  /// Cria uma cópia deste perfil com atributos atualizados.
  ///
  /// Mantém a imutabilidade do estado do perfil.
  UserProfile copyWith({
    String? name,
    String? email,
    String? phone,
    String? identificationCode,
    String? institutionName,
    String? city,
    String? profession,
    String? avatarUrl,
    int? followingCount,
    int? followersCount,
  }) {
    return UserProfile(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      identificationCode: identificationCode ?? this.identificationCode,
      institutionName: institutionName ?? this.institutionName,
      city: city ?? this.city,
      profession: profession ?? this.profession,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      followingCount: followingCount ?? this.followingCount,
      followersCount: followersCount ?? this.followersCount,
    );
  }
}
