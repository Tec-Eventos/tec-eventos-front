import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tec_eventos/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:tec_eventos/features/profile/domain/entities/user_profile.dart';

void main() {
  late ProfileRepositoryImpl repository;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    repository = ProfileRepositoryImpl();
  });

  const tProfile = UserProfile(
    name: 'Gabriel Felix Changed',
    email: 'changed@etec.com',
    phone: '12345',
    identificationCode: 'RM - 2222',
    institutionName: 'Etec Centro',
    city: 'Marília, SP',
    profession: 'Estudante',
    avatarUrl: 'assets/other.png',
    followingCount: 120,
    followersCount: 340,
  );

  test('deve retornar os valores padrao do layout na primeira execucao quando SharedPreferences estiver vazio', () async {
    final result = await repository.getProfile();

    expect(result.name, 'Gabriel Felix');
    expect(result.email, 'gabriel123@etec.com');
    expect(result.followersCount, 1000);
  });

  test('deve salvar e carregar os dados de perfil salvos no SharedPreferences com sucesso', () async {
    await repository.updateProfile(tProfile);

    final result = await repository.getProfile();

    expect(result.name, tProfile.name);
    expect(result.email, tProfile.email);
    expect(result.phone, tProfile.phone);
    expect(result.identificationCode, tProfile.identificationCode);
    expect(result.institutionName, tProfile.institutionName);
    expect(result.city, tProfile.city);
    expect(result.profession, tProfile.profession);
    expect(result.avatarUrl, tProfile.avatarUrl);
    expect(result.followingCount, tProfile.followingCount);
    expect(result.followersCount, tProfile.followersCount);
  });
}
