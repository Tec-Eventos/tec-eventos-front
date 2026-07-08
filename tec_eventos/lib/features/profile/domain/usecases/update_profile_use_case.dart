import 'package:tec_eventos/features/profile/domain/entities/user_profile.dart';
import 'package:tec_eventos/features/profile/domain/repositories/profile_repository.dart';

/// Caso de uso encarregado de salvar as atualizações do perfil do usuário.
class UpdateProfileUseCase {
  final IProfileRepository _repository;

  /// Inicializa o caso de uso injetando o repositório correspondente.
  UpdateProfileUseCase(this._repository);

  /// Executa a gravação do perfil modificado.
  ///
  /// Recebe o [profile] modificado. Pode lançar uma [Failure] em caso de erro.
  Future<void> execute(UserProfile profile) async {
    return await _repository.updateProfile(profile);
  }
}
