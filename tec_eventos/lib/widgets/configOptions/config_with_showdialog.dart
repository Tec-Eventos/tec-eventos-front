import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tec_eventos/core/auth/auth_provider.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/splash/splash.dart';

/// Opção de configuração para deslogar da conta ativa.
///
/// Apresenta um diálogo de confirmação e limpa a sessão utilizando o [authProvider].
class ConfigGeralWithShowDialogExitAccount extends ConsumerWidget {
  /// Construtor padrão.
  const ConfigGeralWithShowDialogExitAccount({
    Key? key,
    required this.opcao,
    required this.icone,
  }) : super(key: key);

  /// Nome da opção a ser exibida no ListTile.
  final String opcao;

  /// Ícone que representa a opção.
  final IconData icone;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              title: const Text(
                "Deseja sair da sua conta?",
                style: TextStyle(
                  fontFamily: Fontes.inter,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: const Text(
                "Ao clicar em sim, você sairá da sua conta.",
                style: TextStyle(
                  fontFamily: Fontes.inter,
                  fontSize: 15,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    await ref.read(authProvider.notifier).logout();
                    if (context.mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Splash()),
                      );
                    }
                  },
                  child: Text(
                    "SIM",
                    style: TextStyle(
                      fontFamily: Fontes.inter,
                      fontWeight: FontWeight.bold,
                      color: Cores.azul42A5F5,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "NÃO",
                    style: TextStyle(
                      fontFamily: Fontes.inter,
                      fontWeight: FontWeight.bold,
                      color: Cores.azul42A5F5,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      contentPadding: const EdgeInsets.symmetric(),
      shape: Border(
        bottom: BorderSide(
          color: Cores.cinzaMaisClaro,
          width: 1.0,
        ),
      ),
      titleAlignment: ListTileTitleAlignment.center,
      leading: Icon(icone, color: Cores.preto, size: 20),
      title: Text(
        opcao,
        style: const TextStyle(
          fontFamily: Fontes.raleway,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Cores.preto,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Cores.preto, size: 12),
    );
  }
}

/// Opção de configuração para deletar a conta ativa.
///
/// Apresenta um diálogo de confirmação de exclusão permanente de conta.
class ConfigGeralWithShowDialogDeleteAccount extends StatelessWidget {
  /// Construtor padrão.
  const ConfigGeralWithShowDialogDeleteAccount({
    Key? key,
    required this.opcao,
    required this.icone,
  }) : super(key: key);

  /// Nome da opção a ser exibida no ListTile.
  final String opcao;

  /// Ícone que representa a opção.
  final IconData icone;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              title: const Text(
                "Deseja mesmo deletar a conta? ",
                style: TextStyle(
                  fontFamily: Fontes.inter,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: const Text(
                "Ao clicar em sim, você terá seu usuário permanentemente suspenso.",
                style: TextStyle(
                  fontFamily: Fontes.inter,
                  fontSize: 15,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Text(
                    "SIM",
                    style: TextStyle(
                      fontFamily: Fontes.inter,
                      fontWeight: FontWeight.bold,
                      color: Cores.azul42A5F5,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "NÃO",
                    style: TextStyle(
                      fontFamily: Fontes.inter,
                      fontWeight: FontWeight.bold,
                      color: Cores.azul42A5F5,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      contentPadding: const EdgeInsets.symmetric(),
      shape: Border(
        bottom: BorderSide(
          color: Cores.cinzaMaisClaro,
          width: 1.0,
        ),
      ),
      titleAlignment: ListTileTitleAlignment.center,
      leading: Icon(icone, color: Cores.preto, size: 20),
      title: Text(
        opcao,
        style: const TextStyle(
          fontFamily: Fontes.raleway,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Cores.preto,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Cores.preto, size: 12),
    );
  }
}
