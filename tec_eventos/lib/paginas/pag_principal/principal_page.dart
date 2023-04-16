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
      drawer: const Drawer(
        width: 300,
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.only(

            bottomRight: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          )
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        child: DrawerPages(),
      ),


      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) =>
    [
      AppBarPages(),
    ],
      body: ListView(),
      ),

    );
  }
}
