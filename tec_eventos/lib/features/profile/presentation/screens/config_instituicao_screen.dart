import 'package:flutter/material.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/core/theme/fontes.dart';
import 'package:tec_eventos/pages/all_pages.dart';
import 'package:tec_eventos/pages/paginas_globais/configuracoes/feedback/feedback.dart';
import 'package:tec_eventos/pages/paginas_globais/configuracoes/privacidade/privacidade.dart';
import 'package:tec_eventos/pages/paginas_instituicao/page_configurar_pagamento/page_configurar_pagamento.dart';
import 'package:tec_eventos/features/profile/presentation/screens/profile_screen.dart';
import 'package:tec_eventos/widgets/configOptions/config_with_navigator.dart';
import 'package:tec_eventos/widgets/configOptions/config_with_showdialog.dart';

/// Tela de configurações gerais para o perfil da Instituição.
///
/// Permite acessar privacidade, editar perfil, ver notificações, configurar formas de pagamento, reportar erros ou deslogar.
class PageConfiguracaoInstituicao extends StatelessWidget {
  /// Construtor padrão da tela de configurações da instituição.
  const PageConfiguracaoInstituicao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 23),
      scrollDirection: Axis.vertical,
      children: [
        const Text(
          "Configurações",
          style: TextStyle(
            fontFamily: Fontes.raleway,
            fontWeight: FontWeight.w600,
            color: Cores.preto,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        Text(
          "GERAL",
          style: TextStyle(
            fontSize: 20,
            color: Cores.cinzaMaisEscuro,
            fontWeight: FontWeight.w600,
          ),
        ),
        const ConfigGeralWithNavigator(
          icone: Icons.lock_outlined,
          opcao: "Privacidade",
          pagina: PrivacidadePage(),
        ),
        const ConfigGeralWithNavigator(
          icone: Icons.person_outline,
          opcao: "Perfil",
          pagina: ProfileScreen(),
        ),
        ConfigGeralWithNavigator(
          icone: Icons.notifications_none_outlined,
          opcao: "Notificações",
          pagina: AllPages(paginaAtual: 3),
        ),
        const ConfigGeralWithShowDialogExitAccount(
          opcao: "Sair",
          icone: Icons.exit_to_app_outlined,
        ),
        const ConfigGeralWithShowDialogDeleteAccount(
          opcao: "Deletar conta",
          icone: Icons.person_off_outlined,
        ),
        const SizedBox(height: 50),
        Text(
          "FEEDBACK",
          style: TextStyle(
            fontSize: 20,
            color: Cores.cinzaMaisEscuro,
            fontWeight: FontWeight.w600,
          ),
        ),
        const ConfigGeralWithNavigator(
          icone: Icons.report_outlined,
          opcao: "Reportar algum erro",
          pagina: FeedBackPage(),
        ),
        const ConfigGeralWithNavigator(
          icone: Icons.feedback_outlined,
          opcao: "Enviar feedback",
          pagina: FeedBackPage(),
        ),
        const SizedBox(height: 50),
        Text(
          "PAGAMENTO",
          style: TextStyle(
            fontSize: 20,
            color: Cores.cinzaMaisEscuro,
            fontWeight: FontWeight.w600,
          ),
        ),
        const ConfigGeralWithNavigator(
          icone: Icons.wallet,
          opcao: "Configurar pagamento",
          pagina: PageConfigurarPagamento(),
        ),
      ],
    );
  }
}
