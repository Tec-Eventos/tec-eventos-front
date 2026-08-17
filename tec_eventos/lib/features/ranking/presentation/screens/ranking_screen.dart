import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/core/theme/fontes.dart';
import 'package:tec_eventos/features/ranking/presentation/providers/ranking_provider.dart';
import 'package:tec_eventos/features/ranking/presentation/widgets/ranking_user_tile.dart';

/// Tela principal de exibição do ranking geral dos alunos.
///
/// Consome assincronamente a lista de usuários do [rankingListProvider]
/// e exibe os itens em formato expansível por meio do [RankingUserTile].
class RankingScreen extends ConsumerWidget {
  /// Construtor padrão da tela de ranking.
  const RankingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(rankingListProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: state.when(
        data: (rankingUsers) {
          if (rankingUsers.isEmpty) {
            return const Center(
              child: Text(
                'Nenhum aluno no ranking até o momento.',
                style: TextStyle(
                  fontFamily: Fontes.raleway,
                  fontSize: 16,
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.workspace_premium_outlined, size: 30),
                        SizedBox(width: 5),
                        Text(
                          "RANKING",
                          style: TextStyle(
                            fontFamily: Fontes.raleway,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 163,
                      height: 2,
                      color: Cores.azulClaro,
                    )
                  ],
                ),
                const SizedBox(height: 20),
                ...rankingUsers.map((user) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: RankingUserTile(user: user),
                    )),
              ],
            ),
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
                  'Não foi possível obter o ranking:\n$error',
                  style: const TextStyle(
                    fontFamily: Fontes.raleway,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => ref.invalidate(rankingListProvider),
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
