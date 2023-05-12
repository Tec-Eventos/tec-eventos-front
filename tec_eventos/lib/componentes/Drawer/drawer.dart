import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:page_transition/page_transition.dart';
import 'package:switch_button/switch_button.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/paginas/pag_principal/principal_page.dart';
import 'package:tec_eventos/paginas/perfil/perfil.dart';

class DrawerPages extends StatefulWidget {
  const DrawerPages({Key? key}) : super(key: key);

  @override
  State<DrawerPages> createState() => _DrawerPagesState();
}

class _DrawerPagesState extends State<DrawerPages> {
  int seguindo = 115;
  int seguidores = 2000;
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(40.0),
        topRight: Radius.circular(40.0),
      )),
      elevation: 0,
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 230,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                ),
                color: Colors.white,
                //   border: Border.all(
                //     color: Colors.white
                // ),
              ),
              currentAccountPictureSize: Size(83, 83),
              currentAccountPicture: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: Perfil(),
                          type: PageTransitionType.rightToLeft));

                },

                //imagem do perfil
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage(
                    'assets/imgPerfil.png',
                  ),
                ),
              ),

              //nome do usuário
              accountName: Text(
                'Gabriel',
                style: GoogleFonts.raleway(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),


              //profissão do usuário, seus seguidores e quem ele está seguindo
              accountEmail: Padding(
                padding: const EdgeInsets.only(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Desempregado",
                          style: GoogleFonts.raleway(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Text("${seguindo} seguindo",
                              style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start),
                          VerticalDivider(),
                          Text(
                            "${seguidores} seguidores",
                            style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

              Column(
                 children: [

                   const MenuOptions(icone: Icons.workspace_premium_outlined, opcao: "Medalhas", nomePage: Perfil()),
                   const MenuOptions(icone: Icons.workspace_premium_outlined, opcao: "Eventos", nomePage: Perfil()),
                   const MenuOptions(icone: Icons.settings, opcao: "Configurações", nomePage: Perfil()),
                   const MenuOptions(icone: Icons.favorite, opcao: "Favoritos", nomePage: Perfil()),

                 ],
               ),

          SizedBox(
                  height: 130,
                ),

                Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.brightness_6_outlined, color: Colors.black),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Modo Escuro", style: GoogleFonts.inter(fontSize: 12)),
                          LiteRollingSwitch(
                            width: 120,
                            value: true,
                            textOn: "",
                            textOff: "",
                            colorOn: Cores.AzulClaro,
                            colorOff: Cores.AzulCinzento,
                            iconOn: Icons.dark_mode_outlined,
                            iconOff: Icons.sunny,
                            textSize: 12,
                            onChanged: (bool state) {},
                            onDoubleTap: () {},
                            onTap: () {},
                            onSwipe: () {},
                          )
                        ],
                      ),
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(builder: (_) =>),
                        // );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.exit_to_app_outlined, color: Colors.black),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [ Text("Sair", style: GoogleFonts.inter(fontSize: 12)),],
                      ),
                      onTap: () {
                        confirmacao(context);
                      },
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(left: 17, top: 25),
                  alignment: Alignment.bottomLeft,
                  height: 43,
                  child: Image.asset("assets/t!e_logo.png"),
                ),
              ],
            ),
    );
  }
}


class MenuOptions extends StatelessWidget {
  const MenuOptions({Key? key, required this.icone, required this.opcao, required this.nomePage}) : super(key: key);

  final IconData icone;
  final String opcao;
  final Widget nomePage;

  @override
  Widget build(BuildContext context) {
    return   ListTile(
      leading: Icon(
        icone, color: Colors.black
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(opcao, style: GoogleFonts.inter(fontSize: 12)),
          Icon(Icons.arrow_forward_ios_outlined, size: 12),
        ],
      ),
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: nomePage,
                type: PageTransitionType.rightToLeft));
      },
    );
  }
}



confirmacao(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text(
            "Deseja sair do app?",
            style:
                GoogleFonts.inter(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          content: Text(
            "Ao clicar em sim, você sairá do nosso aplicativo.",
            style: GoogleFonts.inter(
              fontSize: 15.0,
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: Text(
                  "SIM",
                  style: GoogleFonts.inter(
                      color: Cores.Azul42A5F5, fontWeight: FontWeight.bold),
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(context);
                },
                child: Text(
                  "NÃO",
                  style: GoogleFonts.inter(
                      color: Cores.Azul42A5F5, fontWeight: FontWeight.bold),
                )),
          ],
        );
      });
}
