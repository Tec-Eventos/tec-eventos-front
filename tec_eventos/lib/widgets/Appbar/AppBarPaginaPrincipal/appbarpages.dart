import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/paginas_aluno/perfil/perfil.dart';

class AppBarPages extends StatelessWidget {
  const AppBarPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      floating: true,
      snap: true,
      centerTitle: true,
      backgroundColor: Cores.branco,
      expandedHeight: 35,
      leading: Builder(
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Image.asset("assets/Icons/menuicon.png"),
          );
        },
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: SizedBox(
          height: 40,
          child: TextFormField(
            decoration: InputDecoration(
              isDense: true,
              suffixIcon: Icon(
                Icons.search,
                color: Cores.preto,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
              filled: true,
              fillColor: Cores.brancoCinzento,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Cores.branco, width: 1.0),
                borderRadius: BorderRadius.circular(30),
              ),
              labelStyle: TextStyle(fontFamily: Fontes.raleway, fontSize: 12),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Cores.branco, width: 1.0),
                borderRadius: BorderRadius.circular(30.0),
              ),
              hintText: "Pesquise eventos do seu interesse",
              hintStyle: TextStyle(fontFamily: Fontes.raleway, fontSize: 12),
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
                    child: const Perfil(),
                    type: PageTransitionType.rightToLeft));
          },
          icon: Icon(Icons.account_circle_outlined,
              size: 31.0, color: Cores.preto),
        )
      ],
    );
  }
}
