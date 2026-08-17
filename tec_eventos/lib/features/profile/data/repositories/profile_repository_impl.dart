import 'package:shared_preferences/shared_preferences.dart';
import 'package:tec_eventos/features/profile/domain/entities/user_profile.dart';
import 'package:tec_eventos/features/profile/domain/repositories/profile_repository.dart';

/// Implementação concreta do repositório de perfil.
///
/// Salva e recupera as informações locais do usuário ativamente usando [SharedPreferences],
/// de forma que as edições persistam entre sessões do aplicativo.
class ProfileRepositoryImpl implements IProfileRepository {
  @override
  Future<UserProfile> getProfile() async {
    final prefs = await SharedPreferences.getInstance();

    // Se as chaves estiverem nulas (primeira execução), retorna os valores mockados anteriores do layout
    final name = prefs.getString('pref_profile_name') ?? 'Gabriel Felix';
    final email = prefs.getString('pref_profile_email') ?? 'gabriel123@etec.com';
    final phone = prefs.getString('pref_profile_phone') ?? '+55 (14) 997684312';
    final code = prefs.getString('pref_profile_code') ?? '21091';
    final inst = prefs.getString('pref_profile_inst') ?? 'Etec Antonio Devisate';
    final city = prefs.getString('pref_profile_city') ?? 'Marília, SP';
    final profession = prefs.getString('pref_profile_profession') ?? 'Desempregado';
    final avatar = prefs.getString('pref_profile_avatar') ?? 'assets/imgPerfil.png';
    final following = prefs.getInt('pref_profile_following') ?? 1000;
    final followers = prefs.getInt('pref_profile_followers') ?? 1000;

    return UserProfile(
      name: name,
      email: email,
      phone: phone,
      identificationCode: code,
      institutionName: inst,
      city: city,
      profession: profession,
      avatarUrl: avatar,
      followingCount: following,
      followersCount: followers,
    );
  }

  @override
  Future<void> updateProfile(UserProfile profile) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('pref_profile_name', profile.name);
    await prefs.setString('pref_profile_email', profile.email);
    await prefs.setString('pref_profile_phone', profile.phone);
    await prefs.setString('pref_profile_code', profile.identificationCode);
    await prefs.setString('pref_profile_inst', profile.institutionName);
    await prefs.setString('pref_profile_city', profile.city);
    await prefs.setString('pref_profile_profession', profile.profession);
    await prefs.setString('pref_profile_avatar', profile.avatarUrl);
    await prefs.setInt('pref_profile_following', profile.followingCount);
    await prefs.setInt('pref_profile_followers', profile.followersCount);
  }
}
