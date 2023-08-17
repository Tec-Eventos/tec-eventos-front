import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/paginas/configuracoes/feedback/feedback.dart';

class ConfigurationPage extends StatelessWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

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
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Text("GERAL",
              style: TextStyle(
                  fontSize: 20,
                  color: Cores.cinzaMaisEscuro,
                  fontWeight: FontWeight.w600)),
          const ConfigGeral(
              icone: Icons.lock_outlined,
              opcao: "Privacidade",
              pagina: FeedBackPage()),
          const ConfigGeral(
              icone: Icons.person_outline,
              opcao: "Perfil",
              pagina: FeedBackPage()),
          const ConfigGeral(
              icone: Icons.notifications_none_outlined,
              opcao: "Notificações",
              pagina: FeedBackPage()),
          const ConfigGeral(
              icone: Icons.exit_to_app_outlined,
              opcao: "Sair",
              pagina: FeedBackPage()),
          const ConfigGeral(
              icone: Icons.person_off_outlined,
              opcao: "Deletar conta",
              pagina: FeedBackPage()),
          const SizedBox(height: 50),
          Text("FEEDBACK",
              style: TextStyle(
                  fontFamily: Fontes.inter,
                  color: Cores.cinzaMaisEscuro,
                  fontWeight: FontWeight.w600)),
          const ConfigGeral(
              icone: Icons.report_outlined,
              opcao: "Reportar algum erro",
              pagina: FeedBackPage()),
          const ConfigGeral(
              icone: Icons.feedback_outlined,
              opcao: "Enviar feedback",
              pagina: FeedBackPage()),
        ]);
  }
}

class ConfigGeral extends StatefulWidget {
  const ConfigGeral(
      {Key? key,
      required this.icone,
      required this.opcao,
      required this.pagina})
      : super(key: key);

  final String opcao;
  final IconData icone;
  final Widget pagina;
  @override
  State<ConfigGeral> createState() => _ConfigGeralState();
}

class _ConfigGeralState extends State<ConfigGeral> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    child: widget.pagina,
                    type: PageTransitionType.rightToLeft));
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
        ),
      ],
    );
  }
}
