import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tec_eventos/core/auth/auth_state.dart';
import 'package:tec_eventos/core/network/http_client_provider.dart';
import 'package:tec_eventos/features/auth/domain/repositories/auth_repository.dart';
import 'package:tec_eventos/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:tec_eventos/features/auth/domain/usecases/login_aluno_use_case.dart';
import 'package:tec_eventos/features/auth/domain/usecases/login_instituicao_use_case.dart';
import 'package:tec_eventos/features/auth/domain/usecases/register_aluno_use_case.dart';
import 'package:tec_eventos/features/auth/domain/usecases/register_instituicao_use_case.dart';
import 'package:tec_eventos/features/auth/domain/usecases/logout_use_case.dart';

part 'auth_provider.g.dart';

/// Provider que fornece o repositório de autenticação.
@riverpod
IAuthRepository authRepository(Ref ref) {
  final httpClient = ref.watch(httpClientProvider);
  return AuthRepositoryImpl(httpClient);
}

/// Provider para o caso de uso [LoginAlunoUseCase].
@riverpod
LoginAlunoUseCase loginAlunoUseCase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginAlunoUseCase(repository);
}

/// Provider para o caso de uso [LoginInstituicaoUseCase].
@riverpod
LoginInstituicaoUseCase loginInstituicaoUseCase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginInstituicaoUseCase(repository);
}

/// Provider para o caso de uso [RegisterAlunoUseCase].
@riverpod
RegisterAlunoUseCase registerAlunoUseCase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return RegisterAlunoUseCase(repository);
}

/// Provider para o caso de uso [RegisterInstituicaoUseCase].
@riverpod
RegisterInstituicaoUseCase registerInstituicaoUseCase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return RegisterInstituicaoUseCase(repository);
}

/// Provider para o caso de uso [LogoutUseCase].
@riverpod
LogoutUseCase logoutUseCase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LogoutUseCase(repository);
}

/// Notifier do Riverpod que gerencia o estado da sessão de autenticação ativa.
///
/// Encapsula métodos de login, logout e sincronização reativa com as telas do app.
@riverpod
class Auth extends _$Auth {
  @override
  FutureOr<AuthState?> build() async {
    final prefs = await SharedPreferences.getInstance();
    final userType = prefs.getString('userType') ?? 'None';

    if (userType == 'Aluno') {
      return AuthState(
        name: prefs.getString('nome'),
        email: prefs.getString('email'),
        rm: prefs.getInt('rm_aluno'),
        userType: 'Aluno',
      );
    } else if (userType == 'Instituição') {
      return AuthState(
        name: prefs.getString('nome'),
        email: prefs.getString('email'),
        cdEscolar: prefs.getInt('cd_escolar'),
        userType: 'Instituição',
      );
    }

    return AuthState.empty();
  }

  /// Realiza o login do aluno, atualizando o estado do provider.
  Future<void> loginAluno({
    required String nome,
    required String email,
    required int rm,
    required String senha,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final useCase = ref.read(loginAlunoUseCaseProvider);
      return await useCase.execute(
        nome: nome,
        email: email,
        rm: rm,
        senha: senha,
      );
    });
  }

  /// Realiza o login da instituição, atualizando o estado do provider.
  Future<void> loginInstituicao({
    required String instituicao,
    required String email,
    required int cdEscolar,
    required String senha,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final useCase = ref.read(loginInstituicaoUseCaseProvider);
      return await useCase.execute(
        instituicao: instituicao,
        email: email,
        cdEscolar: cdEscolar,
        senha: senha,
      );
    });
  }

  /// Desloga o usuário atual da plataforma.
  Future<void> logout() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final useCase = ref.read(logoutUseCaseProvider);
      await useCase.execute();
      return AuthState.empty();
    });
  }

  /// Atualiza o estado da sessão ativa salvando as informações localmente no [SharedPreferences].
  ///
  /// É chamado na transição quando há alteração nos dados do usuário autenticado.
  Future<void> updateSession(AuthState newState) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userType', newState.userType);

    if (newState.name != null) await prefs.setString('nome', newState.name!);
    if (newState.email != null) await prefs.setString('email', newState.email!);
    if (newState.rm != null) await prefs.setInt('rm_aluno', newState.rm!);
    if (newState.cdEscolar != null) await prefs.setInt('cd_escolar', newState.cdEscolar!);

    // Invalida e reconstrói o provider para notificar todos os listeners com os novos valores
    ref.invalidateSelf();
  }
}
