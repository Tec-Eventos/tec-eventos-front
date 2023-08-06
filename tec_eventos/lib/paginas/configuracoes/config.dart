import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tec_eventos/cores.dart';

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
            style: GoogleFonts.raleway(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Text(
            "GERAL",
            style: GoogleFonts.inter(
              fontSize: 20,
              color: Cores.cinzaMaisEscuro,
              fontWeight: FontWeight.w600,
            ),
          ),
          const ConfigGeral(icone: Icons.lock_outlined, opcao: "Privacidade"),
          const ConfigGeral(icone: Icons.person_outline, opcao: "Perfil"),
          const ConfigGeral(
              icone: Icons.notifications_none_outlined, opcao: "Notificações"),
          const ConfigGeral(icone: Icons.exit_to_app_outlined, opcao: "Sair"),
          const ConfigGeral(
              icone: Icons.person_off_outlined, opcao: "Deletar conta"),
          const SizedBox(height: 50),
          Text(
            "FEEDBACK",
            style: GoogleFonts.inter(
              fontSize: 20,
              color: Cores.cinzaMaisEscuro,
              fontWeight: FontWeight.w600,
            ),
          ),
          const ConfigGeral(
              icone: Icons.report_outlined, opcao: "Reportar algum erro"),
          const ConfigGeral(
              icone: Icons.feedback_outlined, opcao: "Enviar feedback"),
        ]);
  }
}

class ConfigGeral extends StatefulWidget {
  const ConfigGeral({Key? key, required this.icone, required this.opcao})
      : super(key: key);

  final String opcao;
  final IconData icone;

  @override
  State<ConfigGeral> createState() => _ConfigGeralState();
}

class _ConfigGeralState extends State<ConfigGeral> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(),
          shape: Border(
            bottom: BorderSide(
              color: Cores.cinzaMaisClaro,
              width: 1.0,
            ),
          ),
          titleAlignment: ListTileTitleAlignment.center,
          leading: Icon(widget.icone, color: Cores.preto, size: 20),
          title: Text(
            widget.opcao,
            style:
                GoogleFonts.raleway(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Cores.preto, size: 12),
        ),
      ],
    );
  }
}
