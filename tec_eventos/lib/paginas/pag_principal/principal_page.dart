import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tec_eventos/componentes/Appbar/appbar.dart';
import 'package:tec_eventos/componentes/Drawer/drawer.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/paginas/perfil/perfil.dart';



class PrincipalPage extends StatelessWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer:
      //Drawer,ou seja, o menu que aparece quando clica no botão
      DrawerPages(),

      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
          [
            //appbar, ou seja, parte superior
            AppBarPages(),
          ],

          //aqui é o corpo da página, ou seja,
        // onde vai ficar o conteúdo dela, deixe ela dentro de um ListView com o Axis.vertical.
          body: ListView(
            scrollDirection: Axis.vertical,
          ),
        ),


    );
  }
}
