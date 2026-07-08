/// Representa uma notificação do sistema relacionada a interações entre usuários.
///
/// Contém dados de perfil do usuário que interagiu, a mensagem de interação
/// e o estado atual de relacionamento ("Seguindo" ou "Não Seguindo").
class AppNotification {
  /// Identificador único da notificação.
  final String id;

  /// Caminho do asset ou URL da foto de perfil do usuário.
  final String avatarUrl;

  /// Nome de exibição do usuário.
  final String userName;

  /// Subtítulo ou profissão/descrição do usuário.
  final String subtitle;

  /// Indica se o usuário atual está seguindo de volta o usuário da notificação.
  final bool isFollowing;

  /// Agrupamento temporal da notificação (ex: 'Este mês', 'Mês anterior').
  final String dateGroup;

  /// Construtor padrão para inicializar os atributos da notificação.
  const AppNotification({
    required this.id,
    required this.avatarUrl,
    required this.userName,
    required this.subtitle,
    required this.isFollowing,
    required this.dateGroup,
  });

  /// Retorna uma cópia desta notificação com alguns campos atualizados.
  ///
  /// Útil para a imutabilidade do estado no Riverpod.
  AppNotification copyWith({
    String? id,
    String? avatarUrl,
    String? userName,
    String? subtitle,
    bool? isFollowing,
    String? dateGroup,
  }) {
    return AppNotification(
      id: id ?? this.id,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      userName: userName ?? this.userName,
      subtitle: subtitle ?? this.subtitle,
      isFollowing: isFollowing ?? this.isFollowing,
      dateGroup: dateGroup ?? this.dateGroup,
    );
  }
}
