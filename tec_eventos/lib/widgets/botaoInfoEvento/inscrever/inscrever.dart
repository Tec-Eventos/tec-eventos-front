import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tec_eventos/core/auth/auth_provider.dart';
import 'package:tec_eventos/core/network/http_client_provider.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/core/theme/fontes.dart';

/// Botão de inscrição no Evento.
///
/// Consome o [authProvider] para obter o RM do aluno autenticado
/// e o [httpClientProvider] para realizar a requisição à API.
class Inscrever extends ConsumerWidget {
  final int cdEvento;

  const Inscrever({
    super.key,
    required this.cdEvento,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        await _inscreverAluno(context, ref);
      },
      child: Container(
        height: 64,
        decoration: const BoxDecoration(
          color: Cores.azul42A5F5,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        child: const Center(
          child: Text(
            "Inscrever-se",
            style: TextStyle(
              fontFamily: Fontes.raleway,
              fontSize: 29,
              fontWeight: FontWeight.bold,
              color: Cores.branco,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Future<void> _inscreverAluno(BuildContext context, WidgetRef ref) async {
    final auth = ref.read(authProvider).value;
    if (auth == null || !auth.isAuthenticated) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Faça login para se inscrever no evento.')),
      );
      return;
    }

    final rmAluno = auth.rm;
    if (rmAluno == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Apenas alunos podem se inscrever.')),
      );
      return;
    }

    try {
      final client = ref.read(httpClientProvider);
      await client.post('/inscricaoEvento', data: {
        "cd_evento": cdEvento,
        "rm_aluno": rmAluno,
      });

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Inscrição realizada com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao se inscrever: ${e.toString().replaceAll('Failure: ', '')}'),
            backgroundColor: Cores.vermelho,
          ),
        );
      }
    }
  }
}
