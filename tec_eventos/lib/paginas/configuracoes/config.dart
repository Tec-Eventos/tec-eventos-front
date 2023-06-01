import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tec_eventos/cores.dart';

class configuration_page extends StatelessWidget {
  const configuration_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 23),
        scrollDirection: Axis.vertical, children: [

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
          color: Cores.Cinza_mais_escuro,
          fontWeight: FontWeight.w600,
        ),
      ),


       Config_Geral(icone: Icons.lock_outlined, opcao: "Privacidade"),
      Config_Geral(icone: Icons.person_outline, opcao: "Perfil"),
      Config_Geral(icone: Icons.notifications_none_outlined, opcao: "Notificações"),
      Config_Geral(icone: Icons.exit_to_app_outlined, opcao: "Sair"),
      Config_Geral(icone: Icons.person_off_outlined, opcao: "Deletar conta"),



      const SizedBox(height: 50),
      Text(
        "FEEDBACK",
        style: GoogleFonts.inter(
          fontSize: 20,
          color: Cores.Cinza_mais_escuro,
          fontWeight: FontWeight.w600,
        ),
      ),


      Config_Geral(icone: Icons.report_outlined, opcao: "Reportar algum erro"),
      Config_Geral(icone: Icons.feedback_outlined, opcao: "Enviar feedback"),

    ]
    );
  }
}


class Config_Geral extends StatefulWidget {
  Config_Geral({Key? key, required this.icone, required this.opcao}) : super(key: key);

   String opcao;
   IconData icone;


  @override
  State<Config_Geral> createState() => _Config_GeralState();
}

class _Config_GeralState extends State<Config_Geral> {
  @override
  Widget build(BuildContext context) {
    return

    Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(),
          shape: Border(
            bottom: BorderSide(
              color: Cores.Cinza_mais_claro,
              width: 1.0,
          ),
          ),
          titleAlignment: ListTileTitleAlignment.center,
          leading: Icon(widget.icone, color: Cores.Preto, size: 20),
          title: Text(widget.opcao, style: GoogleFonts.raleway(fontWeight: FontWeight.w600, fontSize: 16),),

          trailing: Icon(Icons.arrow_forward_ios, color: Cores.Preto, size: 12),
        ),

      ],
    );
  }
}
