import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/all_pages.dart';
import 'package:tec_eventos/paginas_aluno/configuracoes/feedback/feedback.dart';
import 'package:tec_eventos/paginas_aluno/configuracoes/privacidade/privacidade.dart';
import 'package:tec_eventos/paginas_aluno/perfil/perfil.dart';

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
          const ConfigGeralWithNavigator(
              icone: Icons.lock_outlined,
              opcao: "Privacidade",
              pagina: PrivacidadePage()),
          const ConfigGeralWithNavigator(
            icone: Icons.person_outline,
            opcao: "Perfil",
            pagina: Perfil(),
          ),
          ConfigGeralWithNavigator(
            icone: Icons.notifications_none_outlined,
            opcao: "Notificações",
            pagina: AllPages(paginaAtual: 3),
          ),
          const ConfigGeralWithShowDialogExitApp(
              opcao: "Sair", icone: Icons.exit_to_app_outlined),
          const ConfigGeralWithShowDialogDeleteAccount(
              opcao: "Deletar conta", icone: Icons.person_off_outlined),
          const SizedBox(height: 50),
          Text("FEEDBACK",
              style: TextStyle(
                  fontSize: 20,
                  color: Cores.cinzaMaisEscuro,
                  fontWeight: FontWeight.w600)),
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
        ]);
  }
}

class ConfigGeralWithNavigator extends StatefulWidget {
  const ConfigGeralWithNavigator(
      {Key? key,
      required this.icone,
      required this.opcao,
      required this.pagina})
      : super(key: key);

  final String opcao;
  final IconData icone;
  final Widget pagina;
  @override
  State<ConfigGeralWithNavigator> createState() =>
      _ConfigGeralWithNavigatorState();
}

class _ConfigGeralWithNavigatorState extends State<ConfigGeralWithNavigator> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: widget.pagina, type: PageTransitionType.bottomToTop));
      },
      contentPadding: const EdgeInsets.symmetric(),
      shape: Border(
        bottom: BorderSide(
          color: Cores.cinzaMaisClaro,
          width: 1.0,
        ),
      ),
      titleAlignment: ListTileTitleAlignment.center,
      leading: Icon(widget.icone, color: Cores.preto, size: 20),
      title: Text(widget.opcao,
          style: TextStyle(
              fontFamily: Fontes.raleway,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Cores.preto)),
      trailing: Icon(Icons.arrow_forward_ios, color: Cores.preto, size: 12),
    );
  }
}

class ConfigGeralWithShowDialogExitApp extends StatefulWidget {
  const ConfigGeralWithShowDialogExitApp(
      {Key? key, required this.opcao, required this.icone})
      : super(key: key);

  final String opcao;
  final IconData icone;

  @override
  _ConfigGeralWithShowDialogExitAppState createState() =>
      _ConfigGeralWithShowDialogExitAppState();
}

class _ConfigGeralWithShowDialogExitAppState
    extends State<ConfigGeralWithShowDialogExitApp> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                title: Text("Deseja sair do app?",
                    style: TextStyle(
                        fontFamily: Fontes.inter,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                content:
                    Text("Ao clicar em sim, você sairá do nosso aplicativo.",
                        style: TextStyle(
                          fontFamily: Fontes.inter,
                          fontSize: 15,
                        )),
                actions: [
                  TextButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: Text("SIM",
                          style: TextStyle(
                              fontFamily: Fontes.inter,
                              fontWeight: FontWeight.bold,
                              color: Cores.azul42A5F5))),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(context);
                      },
                      child: Text("NÃO",
                          style: TextStyle(
                              fontFamily: Fontes.inter,
                              fontWeight: FontWeight.bold,
                              color: Cores.azul42A5F5))),
                ],
              );
            });
      },
      contentPadding: const EdgeInsets.symmetric(),
      shape: Border(
        bottom: BorderSide(
          color: Cores.cinzaMaisClaro,
          width: 1.0,
        ),
      ),
      titleAlignment: ListTileTitleAlignment.center,
      leading: Icon(widget.icone, color: Cores.preto, size: 20),
      title: Text(widget.opcao,
          style: TextStyle(
              fontFamily: Fontes.raleway,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Cores.preto)),
      trailing: Icon(Icons.arrow_forward_ios, color: Cores.preto, size: 12),
    );
  }
}

class ConfigGeralWithShowDialogDeleteAccount extends StatefulWidget {
  const ConfigGeralWithShowDialogDeleteAccount(
      {Key? key, required this.opcao, required this.icone})
      : super(key: key);

  final String opcao;
  final IconData icone;
  @override
  _ConfigGeralWithShowDialogDeleteAccountState createState() =>
      _ConfigGeralWithShowDialogDeleteAccountState();
}

class _ConfigGeralWithShowDialogDeleteAccountState
    extends State<ConfigGeralWithShowDialogDeleteAccount> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                title: Text("Deseja mesmo deletar a conta? ",
                    style: TextStyle(
                        fontFamily: Fontes.inter,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                content: Text(
                    "Ao clicar em sim, você terá seu usuário permanentemente suspenso.",
                    style: TextStyle(
                      fontFamily: Fontes.inter,
                      fontSize: 15,
                    )),
                actions: [
                  TextButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: Text("SIM",
                          style: TextStyle(
                              fontFamily: Fontes.inter,
                              fontWeight: FontWeight.bold,
                              color: Cores.azul42A5F5))),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(context);
                      },
                      child: Text("NÃO",
                          style: TextStyle(
                              fontFamily: Fontes.inter,
                              fontWeight: FontWeight.bold,
                              color: Cores.azul42A5F5))),
                ],
              );
            });
      },
      contentPadding: const EdgeInsets.symmetric(),
      shape: Border(
        bottom: BorderSide(
          color: Cores.cinzaMaisClaro,
          width: 1.0,
        ),
      ),
      titleAlignment: ListTileTitleAlignment.center,
      leading: Icon(widget.icone, color: Cores.preto, size: 20),
      title: Text(widget.opcao,
          style: TextStyle(
              fontFamily: Fontes.raleway,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Cores.preto)),
      trailing: Icon(Icons.arrow_forward_ios, color: Cores.preto, size: 12),
    );
  }
}
