import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/core/theme/fontes.dart';
import 'package:tec_eventos/features/notifications/domain/entities/app_notification.dart';
import 'package:tec_eventos/features/notifications/presentation/providers/notifications_provider.dart';

/// Item visual de notificação representando um usuário específico.
///
/// Apresenta foto de perfil, detalhes de interação e um botão interativo
/// para alternar o estado de relacionamento ("Seguir"/"Seguindo") por meio
/// do [notificationsProvider].
class NotificationTile extends ConsumerWidget {
  /// Dados da notificação a serem renderizados.
  final AppNotification notification;

  /// Construtor do item de notificação recebendo a notificação obrigatória.
  const NotificationTile({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFollowing = notification.isFollowing;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
      horizontalTitleGap: 0,
      titleAlignment: ListTileTitleAlignment.bottom,
      leading: CircleAvatar(
        radius: 25.0, // Ajustado para ser mais proporcional ao layout
        backgroundImage: AssetImage(notification.avatarUrl),
      ),
      title: Text(
        "${notification.userName} começou a seguir você",
        style: const TextStyle(
          fontFamily: Fontes.raleway,
          fontSize: 13,
        ),
      ),
      subtitle: Text(
        notification.subtitle,
        style: const TextStyle(
          fontFamily: Fontes.raleway,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: ElevatedButton(
        onPressed: () {
          ref.read(notificationsProvider.notifier).toggleFollow(notification.id);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isFollowing ? Cores.preto : Cores.azul47BBEC,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
        child: Text(
          isFollowing ? 'Seguindo' : 'Seguir',
          style: TextStyle(
            fontFamily: Fontes.raleway,
            fontSize: isFollowing ? 12 : 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
