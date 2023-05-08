import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tec_eventos/componentes/Appbar/appbar.dart';
import 'package:tec_eventos/componentes/Drawer/drawer.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/paginas/perfil/perfil.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

bool palestras = true;
bool competicoes = false;
bool bootcamp = false;

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer:
          //Drawer,ou seja, o menu que aparece quando clica no botão
          DrawerPages(),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          //appbar, ou seja, parte superior
          AppBarPages(),
        ],

        //aqui é o corpo da página, ou seja,

        // onde vai ficar o conteúdo dela, deixe ela dentro de um ListView com o Axis.vertical.
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FiltragemEventos(
                    false,
                    !competicoes,
                    false,
                    Icon(Icons.school_outlined, color: Cores.Branco),
                    competicoes),

                FiltragemEventos(
                    !palestras,
                    false,
                    false,
                    Icon(Icons.compost_rounded, color: Cores.Branco),
                    palestras)
              ],
            ),
          ],
        ),
      ),
    );
  }

  FiltragemEventos(bool palestrasBool, bool compBool, bool bootcampBool,
      Icon icon, bool optionTrue) {
    return GestureDetector(
      onTap: () {
        setState(() {
          palestras = palestrasBool;
          competicoes = compBool;
          bootcamp = bootcampBool;
        });
      },

        child: Column(children: [

          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: optionTrue ? 120 : MediaQuery.of(context).size.width / 8,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              
              color: optionTrue
                  ? Cores.Azul42A5F5
                  :  Cores.AzulEscuroPerfilOption,
            ),

            child: Row(
              children: [
                icon,
                Text(
                    optionTrue ? "Palestras" : "",
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(
                  fontSize: 10.0
                ),),
              ],
            ),

          ),
        ]),
    );
  }
}
