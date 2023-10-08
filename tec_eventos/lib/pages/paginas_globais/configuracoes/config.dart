import 'package:flutter/material.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/all_pages.dart';
import 'package:tec_eventos/pages/paginas_globais/configuracoes/feedback/feedback.dart';
import 'package:tec_eventos/pages/paginas_globais/configuracoes/privacidade/privacidade.dart';
import 'package:tec_eventos/pages/paginas_aluno/perfil/perfil.dart';
import 'package:tec_eventos/widgets/configOptions/config_with_navigator.dart';
import 'package:tec_eventos/widgets/configOptions/config_with_showdialog.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  _ConfigurationPageState createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 23),
        scrollDirection: Axis.vertical,
        children: [
          Text(
            "Configurações",
            style: TextStyle(
                fontFamily: Fontes.raleway,
                fontWeight: FontWeight.w600,
                color: Cores.preto,
                fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Text("GERAL",
              style: TextStyle(
                  fontSize: 20,
                  color: Cores.cinzaMaisEscuro,
                  fontWeight: FontWeight.w600)),

          //PRIVACIDADE
          const ConfigGeralWithNavigator(
              icone: Icons.lock_outlined,
              opcao: "Privacidade",
              pagina: PrivacidadePage()),

          //PERFIL DO USUÁRIO
          const ConfigGeralWithNavigator(
            icone: Icons.person_outline,
            opcao: "Perfil",
            pagina: Perfil(),
          ),

          //NOTIFICAÇÕES
          ConfigGeralWithNavigator(
            icone: Icons.notifications_none_outlined,
            opcao: "Notificações",
            pagina: AllPages(paginaAtual: 3),
          ),

          //SAIR
          const ConfigGeralWithShowDialogExitApp(
              opcao: "Sair", icone: Icons.exit_to_app_outlined),

          //DELETAR A CONTA
          const ConfigGeralWithShowDialogDeleteAccount(
              opcao: "Deletar conta", icone: Icons.person_off_outlined),
          const SizedBox(height: 50),
          Text("FEEDBACK",
              style: TextStyle(
                  fontSize: 20,
                  color: Cores.cinzaMaisEscuro,
                  fontWeight: FontWeight.w600)),

          //REPORTAR ALGUM ERRO
          const ConfigGeralWithNavigator(
            icone: Icons.report_outlined,
            opcao: "Reportar algum erro",
            pagina: FeedBackPage(),
          ),

          //ENVIAR UM FEEDBACK
          const ConfigGeralWithNavigator(
            icone: Icons.feedback_outlined,
            opcao: "Enviar feedback",
            pagina: FeedBackPage(),
          ),
        ]);
  }
}
