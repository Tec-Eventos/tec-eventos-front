import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/core/theme/fontes.dart';
import 'package:tec_eventos/features/profile/domain/entities/user_profile.dart';
import 'package:tec_eventos/features/profile/presentation/providers/profile_provider.dart';
import 'package:tec_eventos/features/profile/presentation/screens/edit_profile_screen.dart';

/// Exibe o cabeçalho e descrição do perfil do usuário em formato SliverAppBar.
///
/// Consome o [profileProvider] para exibir foto, nome, seguidores, e-mail e localização.
class PerfilDescricao extends ConsumerWidget {
  /// Construtor padrão da descrição do perfil.
  const PerfilDescricao({Key? key}) : super(key: key);

  /// Retorna o [ImageProvider] apropriado baseado no caminho da imagem de avatar.
  ImageProvider _getAvatarImage(String path) {
    if (path.startsWith('assets/')) {
      return AssetImage(path);
    } else {
      return FileImage(File(path));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileProvider);

    return profileState.when(
      data: (profile) => _buildAppBar(context, profile),
      loading: () => const SliverAppBar(
        backgroundColor: Cores.azulBebe,
        expandedHeight: 85,
        bottom: PreferredSize(
          preferredSize: Size.square(250),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      error: (error, _) => SliverAppBar(
        backgroundColor: Cores.azulBebe,
        expandedHeight: 85,
        bottom: PreferredSize(
          preferredSize: const Size.square(250),
          child: Center(
            child: Text('Erro ao carregar dados: $error'),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, UserProfile profile) {
    return SliverAppBar(
      floating: false,
      backgroundColor: Cores.azulBebe,
      expandedHeight: 85,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 18,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Image.asset(
                  "assets/Icons/menuicon.png",
                  height: 20,
                  width: 40,
                ),
              ),
            );
          },
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.square(250),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const EditProfileUser(),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: _getAvatarImage(profile.avatarUrl),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            Text(
              profile.name,
              style: const TextStyle(
                fontFamily: Fontes.raleway,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      profile.followingCount.toString(),
                      style: const TextStyle(
                        fontFamily: Fontes.raleway,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Seguindo",
                      style: TextStyle(
                        fontFamily: Fontes.raleway,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                  child: VerticalDivider(
                    color: Colors.amber,
                    thickness: 1.5,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      profile.followersCount.toString(),
                      style: const TextStyle(
                        fontFamily: Fontes.raleway,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Seguidores",
                      style: TextStyle(
                        fontFamily: Fontes.raleway,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            Text(
              profile.email,
              style: const TextStyle(
                fontFamily: Fontes.raleway,
                fontSize: 13.0,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on_outlined, size: 16),
                const SizedBox(width: 4),
                Text(
                  profile.city,
                  style: const TextStyle(
                    fontFamily: Fontes.raleway,
                    fontSize: 13.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 40),
          ],
        ),
      ),
    );
  }
}
