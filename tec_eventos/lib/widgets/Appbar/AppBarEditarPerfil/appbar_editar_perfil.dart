import 'package:flutter/material.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';

class AppBarEditarPerfil extends StatelessWidget {
  const AppBarEditarPerfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color(0xffE3F2FD),
      automaticallyImplyLeading: false,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Cores.preto,
          size: 27,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        "Editar Perfil",
        style: TextStyle(
            fontFamily: Fontes.ralewayBold, color: Cores.preto, fontSize: 22),
      ),
      centerTitle: true,
      actions: [
        TextButton(
            onPressed: () {},
            child: Text(
              "SALVAR",
              style: TextStyle(
                  fontFamily: Fontes.raleway,
                  color: Cores.preto,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            ))
      ],
    );
  }
}
