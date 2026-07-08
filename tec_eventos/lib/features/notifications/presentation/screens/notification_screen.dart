import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tec_eventos/core/theme/fontes.dart';
import 'package:tec_eventos/features/notifications/domain/entities/app_notification.dart';
import 'package:tec_eventos/features/notifications/presentation/providers/notifications_provider.dart';
import 'package:tec_eventos/features/notifications/presentation/widgets/notification_tile.dart';

/// Tela principal de exibição das notificações de interações e relacionamentos.
///
/// Consome os dados de forma assíncrona do [notificationsProvider]
/// e lida de forma nativa com estados de Carregamento, Erro e Sucesso.
class NotificationScreen extends ConsumerWidget {
  /// Construtor padrão da tela de notificações.
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationsProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: state.when(
        data: (notifications) {
          if (notifications.isEmpty) {
            return const Center(
              child: Text(
                'Nenhuma notificação recebida.',
                style: TextStyle(
                  fontFamily: Fontes.raleway,
                  fontSize: 16,
                ),
              ),
            );
          }

          // Agrupa as notificações dinamicamente com base no grupo temporal (ex: 'Este mês')
          final Map<String, List<AppNotification>> groupedNotifications = {};
          for (final item in notifications) {
            groupedNotifications.putIfAbsent(item.dateGroup, () => []).add(item);
          }

          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 23),
            children: [
              const Text(
                "Notificações",
                style: TextStyle(
                  fontFamily: Fontes.raleway,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ...groupedNotifications.entries.expand((entry) {
                final groupName = entry.key;
                final items = entry.value;

                return [
                  Text(
                    groupName,
                    style: const TextStyle(
                      fontFamily: Fontes.raleway,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ...items.map((notification) => Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: NotificationTile(notification: notification),
                      )),
                  const SizedBox(height: 30),
                ];
              }),
            ],
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 48,
                ),
                const SizedBox(height: 16),
                Text(
                  'Não foi possível carregar as notificações:\n$error',
                  style: const TextStyle(
                    fontFamily: Fontes.raleway,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => ref.invalidate(notificationsProvider),
                  child: const Text('Tentar Novamente'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
