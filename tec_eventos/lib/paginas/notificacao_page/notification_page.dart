import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tec_eventos/cores.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}




class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 23),
        scrollDirection: Axis.vertical, children: [
      Text(
        "Notificações",
        style: GoogleFonts.raleway(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),

    const SizedBox(height: 30),

      data('Este mês'),

      const SizedBox(height: 30),

      const Seguir(imagem: 'assets/imgPerfil.png', nomeUser: 'Gabriel', profissao: "Desempregado"),
      const Seguir(imagem: 'assets/imgPerfil.png', nomeUser: 'Rodinei', profissao: "Desempregado"),
      const Seguir(imagem: 'assets/imgPerfil.png', nomeUser: 'Chamego', profissao: "Desempregado"),
      const Seguir(imagem: 'assets/imgPerfil.png', nomeUser: 'Lorosvaldo', profissao: "Desempregado"),
      const Seguir(imagem: 'assets/imgPerfil.png', nomeUser: 'Gabriel', profissao: "Desempregado"),

      const SizedBox(height: 30),
      data('Mês anterior'),

      const Seguir(imagem: 'assets/imgPerfil.png', nomeUser: 'Gabriel', profissao: "Desempregado"),
      const Seguir(imagem: 'assets/imgPerfil.png', nomeUser: 'Phineas', profissao: "Desempregado"),
      const Seguir(imagem: 'assets/imgPerfil.png', nomeUser: 'Ferp', profissao: "Desempregado"),
      const Seguir(imagem: 'assets/imgPerfil.png', nomeUser: 'Gabriel', profissao: "Desempregado"),
      const Seguir(imagem: 'assets/imgPerfil.png', nomeUser: 'Gabriel', profissao: "Desempregado"),



    ]);
  }
}


data(String dias){
  return  Text(
    dias,
    style: GoogleFonts.raleway(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    )
  );
}




class Seguir extends StatefulWidget {
  const Seguir({Key? key, required this.imagem, required this.nomeUser, required this.profissao}) : super(key: key);

  final String imagem, nomeUser, profissao;


  @override
  State<Seguir> createState() => _SeguirState();
}

bool seguir = true;


class _SeguirState extends State<Seguir> {
  @override
  Widget build(BuildContext context) {
    return   ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
      horizontalTitleGap: 0,
      titleAlignment: ListTileTitleAlignment.bottom,

      leading: CircleAvatar(
        radius: 50.0,
        child: Image.asset(
         widget.imagem,
        ),
      ),

      title: Text("${widget.nomeUser} começou a seguir você", style: GoogleFonts.raleway(fontSize: 13)),



      subtitle: Text(widget.profissao, style: GoogleFonts.raleway(fontSize: 10, fontWeight: FontWeight.bold)),

      trailing: ElevatedButton(
        onPressed: () {
          setState(() {
            seguir = !seguir;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: seguir ? Cores.azul47BBEC : Cores.preto,
          padding:
          const EdgeInsets.symmetric(horizontal: 10),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
        ),
        child: Text(
          seguir ? 'Seguir' : 'Seguindo',
          style: GoogleFonts.raleway(
            fontSize: seguir ? 16 : 12,
            fontWeight: FontWeight.bold,
          ),

        ),
      ),
    );
  }
}




