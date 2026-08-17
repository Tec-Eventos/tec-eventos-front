import 'package:shared_preferences/shared_preferences.dart';
import 'package:tec_eventos/core/auth/auth_state.dart';
import 'package:tec_eventos/core/network/http_client.dart';
import 'package:tec_eventos/features/auth/domain/repositories/auth_repository.dart';

/// Implementação concreta do repositório de autenticação.
///
/// Faz as requisições à API utilizando o [IHttpClient] unificado e gerencia
/// a persistência local da sessão de login no [SharedPreferences].
class AuthRepositoryImpl implements IAuthRepository {
  final IHttpClient _httpClient;

  /// Inicializa o repositório injetando o cliente HTTP.
  AuthRepositoryImpl(this._httpClient);

  @override
  Future<AuthState> loginAluno({
    required String nome,
    required String email,
    required int rm,
    required String senha,
  }) async {
    final body = {
      "nome": nome,
      "email": email,
      "rm_aluno": rm,
      "senha": senha,
    };

    final response = await _httpClient.post('/loginAluno', data: body);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userType', 'Aluno');
    await prefs.setString('nome', nome);
    await prefs.setString('email', email);
    await prefs.setInt('rm_aluno', rm);

    if (response is Map && response.containsKey('token')) {
      await prefs.setString('token', "Token ${response['token']}");
    }

    return AuthState(
      name: nome,
      email: email,
      rm: rm,
      userType: 'Aluno',
    );
  }

  @override
  Future<AuthState> loginInstituicao({
    required String instituicao,
    required String email,
    required int cdEscolar,
    required String senha,
  }) async {
    final body = {
      "cd_escolar": cdEscolar,
      "instituicao": instituicao,
      "email": email,
      "senha": senha,
    };

    final response = await _httpClient.post('/loginEscola', data: body);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userType', 'Instituição');
    await prefs.setString('nome', instituicao);
    await prefs.setString('email', email);
    await prefs.setInt('cd_escolar', cdEscolar);

    if (response is Map && response.containsKey('token')) {
      await prefs.setString('token', "Token ${response['token']}");
    }

    return AuthState(
      name: instituicao,
      email: email,
      cdEscolar: cdEscolar,
      userType: 'Instituição',
    );
  }

  @override
  Future<void> registerAluno({
    required String nome,
    required String email,
    required String telefone,
    required String cep,
    required int cdEscolar,
    required int rm,
    required String senha,
  }) async {
    // 1. Cadastra o endereço CEP primeiro no endpoint conforme fluxo legado
    final cepInt = int.tryParse(cep.replaceAll(RegExp(r'\D'), '')) ?? 0;
    final cepBody = {
      "cep": cepInt,
      "logradouro": '',
      "complemento": '',
      "bairro": '',
      "cidade": '',
      "estado": '',
    };
    try {
      await _httpClient.post('/endereco', data: cepBody);
    } catch (_) {
      // Ignora erro se CEP já cadastrado para dar continuidade ao fluxo
    }

    // 2. Cadastra o Aluno na API
    final body = {
      "rm_aluno": rm,
      "nome": nome,
      "email": email,
      "telefone": telefone.replaceAll(RegExp(r'\D'), ''),
      "cep_aluno": cepInt.toString(),
      "senha": senha,
      "cd_escolar": cdEscolar,
    };

    await _httpClient.post('/aluno', data: body);
  }

  @override
  Future<void> registerInstituicao({
    required String instituicao,
    required String email,
    required String telefone,
    required String cep,
    required int cdEscolar,
    required String senha,
  }) async {
    // 1. Cadastra o endereço CEP primeiro no endpoint conforme fluxo legado
    final cepInt = int.tryParse(cep.replaceAll(RegExp(r'\D'), '')) ?? 0;
    final cepBody = {
      "cep": cepInt,
      "logradouro": '',
      "complemento": '',
      "bairro": '',
      "cidade": '',
      "estado": '',
    };
    try {
      await _httpClient.post('/endereco', data: cepBody);
    } catch (_) {
      // Ignora erro se CEP já cadastrado para dar continuidade ao fluxo
    }

    // 2. Cadastra a Instituição na API
    final body = {
      "cd_escolar": cdEscolar,
      "instituicao": instituicao,
      "email": email,
      "telefone": telefone.replaceAll(RegExp(r'\D'), ''),
      "cep_escola": cepInt.toString(),
      "senha": senha,
    };

    await _httpClient.post('/instituicao', data: body);
  }

  @override
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
