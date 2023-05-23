import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/componentes/Drawer/drawer.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/paginas/perfil/perfil.dart';

class AppBarPages extends StatefulWidget {
  const AppBarPages({Key? key}) : super(key: key);

  @override
  State<AppBarPages> createState() => _AppBarPagesState();
}

class _AppBarPagesState extends State<AppBarPages> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      backgroundColor: Colors.white,
      expandedHeight: 35,

      leading: Builder(
        builder: (BuildContext context)  {
          return GestureDetector(
              onTap: (){
                Scaffold.of(context).openDrawer();
              },
              child: Image.asset("assets/Icons/menuicon.png"),
          );
        },
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 5),

          child:
          SizedBox(
            height: 40,
            child: TextFormField(


              decoration: InputDecoration(
                isDense: true,

                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                filled: true,
                fillColor: Color(0xffEEEEEE),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffEEEEEE), width: 1.0),
                  borderRadius: BorderRadius.circular(30),
                ),

                labelStyle: GoogleFonts.raleway(fontSize: 12),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffEEEEEE), width: 1.0),
                  borderRadius: BorderRadius.circular(30.0),
                ),

                hintText: "Pesquise eventos do seu interesse",
                hintStyle: GoogleFonts.raleway(fontSize: 12)
                ,
              ),
            ),
          ),
        ),



      actions: [
        IconButton(
          onPressed: () {

            Navigator.push(
            context,
            PageTransition(
                child: Perfil(),
                type: PageTransitionType.rightToLeft));
          },
          icon: const Icon(Icons.account_circle_outlined,
              size: 31.0,
              color: Colors.black),
        )
      ],

    );
  }
}

