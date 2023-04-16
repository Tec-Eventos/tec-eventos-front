import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: Cores.Branco,
      expandedHeight: 65,

      title: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height / 20,
          width: MediaQuery.of(context).size.width / 1.5,

          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              isDense: true,

              suffixIcon: const Icon(
                Icons.search,
                color: Colors.amber,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.greenAccent, width: 1.0),
                borderRadius: BorderRadius.circular(30),
              ),


              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.greenAccent, width: 1.0),
                borderRadius: BorderRadius.circular(30.0),
              ),

              hintText: "Pesquise eventos do seu interesse",
              hintStyle: GoogleFonts.raleway(fontSize: 12, textStyle: TextStyle())
              ,
            ),
          ),
        ),
      ),


      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_) => Perfil()));
          },
          icon: const Icon(Icons.account_circle_outlined,
              color: Colors.black),
        )
      ],

    );
  }
}

