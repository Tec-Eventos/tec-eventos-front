import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tec_eventos/features/profile/domain/entities/user_profile.dart';
import 'package:tec_eventos/features/profile/domain/repositories/profile_repository.dart';
import 'package:tec_eventos/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:tec_eventos/features/profile/domain/usecases/get_profile_use_case.dart';
import 'package:tec_eventos/features/profile/domain/usecases/update_profile_use_case.dart';

part 'profile_provider.g.dart';

/// Provider que injeta a implementação concreta do repositório de perfil.
@riverpod
IProfileRepository profileRepository(Ref ref) {
  return ProfileRepositoryImpl();
}

/// Provider que fornece o caso de uso [GetProfileUseCase].
@riverpod
GetProfileUseCase getProfileUseCase(Ref ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return GetProfileUseCase(repository);
}

/// Provider que fornece o caso de uso [UpdateProfileUseCase].
@riverpod
UpdateProfileUseCase updateProfileUseCase(Ref ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return UpdateProfileUseCase(repository);
}

/// Notifier que expõe e gerencia o estado assíncrono do perfil de usuário ativo.
@riverpod
class Profile extends _$Profile {
  @override
  FutureOr<UserProfile> build() async {
    final useCase = ref.watch(getProfileUseCaseProvider);
    return await useCase.execute();
  }

  /// Salva as edições feitas no perfil de usuário e atualiza o estado atual.
  Future<void> saveProfile(UserProfile updatedProfile) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final useCase = ref.read(updateProfileUseCaseProvider);
      await useCase.execute(updatedProfile);
      return updatedProfile;
    });
  }
}
