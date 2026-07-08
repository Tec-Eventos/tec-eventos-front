import 'package:tec_eventos/features/profile/domain/entities/user_profile.dart';

/// Contrato para o repositório de gerenciamento do perfil do usuário.
///
/// Define as assinaturas das operações de leitura e gravação das informações cadastrais do perfil.
abstract class IProfileRepository {
  /// Recupera as informações de perfil salvas localmente ou vindas do servidor.
  ///
  /// Pode lançar uma [Failure] em caso de inconsistência de dados.
  Future<UserProfile> getProfile();

  /// Grava as novas informações atualizadas do perfil do usuário.
  ///
  /// Recebe a entidade [profile] contendo os dados a serem salvos.
  /// Pode lançar uma [Failure] em caso de erro na gravação.
  Future<void> updateProfile(UserProfile profile);
}
