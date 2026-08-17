import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tec_eventos/core/network/http_client.dart';
import 'package:tec_eventos/features/auth/data/repositories/auth_repository_impl.dart';

class MockHttpClient extends Mock implements IHttpClient {}

void main() {
  late MockHttpClient mockHttpClient;
  late AuthRepositoryImpl repository;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    mockHttpClient = MockHttpClient();
    repository = AuthRepositoryImpl(mockHttpClient);
  });

  group('loginAluno', () {
    const nome = 'Gabriel Felix';
    const email = 'gabriel@gmail.com';
    const rm = 21091;
    const senha = 'password';

    test('deve efetuar login do aluno com sucesso e salvar os dados no SharedPreferences', () async {
      // Arrange
      final responseBody = {'token': 'my_mock_token'};
      when(() => mockHttpClient.post(any(), data: any(named: 'data')))
          .thenAnswer((_) async => responseBody);

      // Act
      final result = await repository.loginAluno(
        nome: nome,
        email: email,
        rm: rm,
        senha: senha,
      );

      // Assert
      expect(result.name, nome);
      expect(result.email, email);
      expect(result.rm, rm);
      expect(result.userType, 'Aluno');

      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('userType'), 'Aluno');
      expect(prefs.getString('nome'), nome);
      expect(prefs.getString('email'), email);
      expect(prefs.getInt('rm_aluno'), rm);
      expect(prefs.getString('token'), 'Token my_mock_token');

      verify(() => mockHttpClient.post('/loginAluno', data: {
        'nome': nome,
        'email': email,
        'rm_aluno': rm,
        'senha': senha,
      })).called(1);
    });
   group('registerAluno', () {
    const cep = '17500-000';

    test('deve registrar cep e cadastrar aluno com sucesso', () async {
      // Arrange
      when(() => mockHttpClient.post(any(), data: any(named: 'data')))
          .thenAnswer((_) async => {});

      // Act
      await repository.registerAluno(
        nome: nome,
        email: email,
        telefone: '(14) 99999-9999',
        cep: cep,
        cdEscolar: 100,
        rm: rm,
        senha: senha,
      );

      // Assert
      verify(() => mockHttpClient.post('/endereco', data: {
        'cep': 17500000,
        'logradouro': '',
        'complemento': '',
        'bairro': '',
        'cidade': '',
        'estado': '',
      })).called(1);

      verify(() => mockHttpClient.post('/aluno', data: {
        'rm_aluno': rm,
        'nome': nome,
        'email': email,
        'telefone': '14999999999',
        'cep_aluno': '17500000',
        'senha': senha,
        'cd_escolar': 100,
      })).called(1);
    });
  });
 });
}
