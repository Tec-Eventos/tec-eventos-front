import 'package:flutter/material.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';

class PrivacidadePage extends StatelessWidget {
  const PrivacidadePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Cores.azulBebe,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Cores.preto,
            )),
        title: Text(
          "Configurações",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontFamily: Fontes.raleway,
              fontSize: 24,
              color: Cores.preto,
              fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.square(70),
          child: Container(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Privacidade",
              style: TextStyle(
                  fontFamily: Fontes.raleway,
                  fontSize: 24,
                  color: Cores.preto,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 23),
          scrollDirection: Axis.vertical,
          children: [
            Text(
              "Dados pessoais",
              style: TextStyle(
                  fontFamily: Fontes.raleway,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Cores.preto),
            ),
            const SizedBox(height: 30),

            //opções Dados Pessoais

            const PrivacidadeOptions(
                nameOption: "Foto de perfil", permissionOption: "Ninguém"),

            Divider(height: 5, color: Cores.preto),

            const PrivacidadeOptions(
                nameOption: "Minhas medalhas", permissionOption: "Todos"),

            Divider(height: 5, color: Cores.preto),

            const SizedBox(height: 20),

            Container(
              height: 7,
              width: double.infinity,
              color: Cores.azulBebe,
            ),
            const SizedBox(height: 20),

            Text(
              "Eventos",
              style: TextStyle(
                  fontFamily: Fontes.raleway,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Cores.preto),
            ),
            const SizedBox(height: 10),

            //Opção dos Eventos
            const PrivacidadeOptions(
                nameOption: "Eventos em que eu marquei presença",
                permissionOption: "Todos"),

            Divider(height: 10, color: Cores.preto),

            const PrivacidadeOptions(
                nameOption: "Minhas curtidas",
                permissionOption: "Apenas seguidores"),
          ]),
    );
  }
}

class PrivacidadeOptions extends StatelessWidget {
  const PrivacidadeOptions(
      {Key? key, required this.nameOption, required this.permissionOption})
      : super(key: key);

  final String nameOption, permissionOption;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          nameOption,
          style: TextStyle(
              fontFamily: Fontes.raleway,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Cores.preto),
        ),
        subtitle: Text(
          permissionOption,
          style: TextStyle(
              fontFamily: Fontes.raleway, fontSize: 13, color: Cores.preto),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Cores.cinza8A8A8A,
        ));
  }
}
