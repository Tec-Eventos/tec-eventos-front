import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/all_pages.dart';
import 'package:tec_eventos/pages/paginas_aluno/eventos_inscritos/eventos_inscritos.dart';
import 'package:tec_eventos/pages/paginas_aluno/perfil/perfil.dart';

class DrawerPages extends StatefulWidget {
  const DrawerPages({Key? key}) : super(key: key);

  @override
  State<DrawerPages> createState() => _DrawerPagesState();
}

class _DrawerPagesState extends State<DrawerPages> {
  int seguindo = 115;
  int seguidores = 2000;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(40.0),
        topRight: Radius.circular(40.0),
      )),
      elevation: 0,
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 260,

            //widget para o cabeçalho do Menu/Drawer
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                ),
                color: Colors.white,
                //   border: Border.all(
                //     color: Colors.white
                // ),
              ),
              currentAccountPictureSize: const Size(83, 83),
              currentAccountPicture: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const Perfil(),
                          type: PageTransitionType.rightToLeft));
                },

                //imagem do perfil
                child: const CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage(
                    'assets/imgPerfil.png',
                  ),
                ),
              ),

              //nome do usuário
              accountName: Text(
                'Gabriel',
                style: TextStyle(
                    fontFamily: Fontes.raleway,
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
                          style: TextStyle(
                              fontFamily: Fontes.raleway, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Text("${seguindo} seguindo",
                              style: TextStyle(
                                  fontFamily: Fontes.raleway,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start),
                          const VerticalDivider(),
                          Text(
                            "${seguidores} seguidores",
                            style: TextStyle(
                                fontFamily: Fontes.raleway,
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
              //item das medalhas
              const MenuOptionsAssetIcon(
                  icone: "assets/Icons/medalhas.png",
                  opcao: "Medalhas",
                  pagina: 2),

              //item dos eventos que o usuário participou
              ListTile(
                leading: const Icon(Icons.confirmation_num_outlined,
                    color: Colors.black),
                title: Text("Meus Eventos",
                    style: TextStyle(fontFamily: Fontes.inter, fontSize: 12)),
                trailing:
                    const Icon(Icons.arrow_forward_ios_outlined, size: 12),
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const EventosInscritos(),
                          type: PageTransitionType.rightToLeft));
                },
              ),

              //item das configurações
              const MenuOptionsAssetIcon(
                icone: "assets/Icons/configuracao.png",
                opcao: "Configurações",
                pagina: 4,
              ),

              //item dos eventos favoritados
              const MenuOptions(
                  icone: Icons.favorite_border, opcao: "Favoritos", pagina: 0),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.brightness_6_outlined,
                    color: Colors.black),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Modo Escuro",
                        style:
                            TextStyle(fontFamily: Fontes.inter, fontSize: 12)),
                    SizedBox(
                      height: 40,
                      child: LiteRollingSwitch(
                        width: 80,
                        value: true,
                        textOn: "",
                        textOff: "",
                        colorOn: Cores.azulClaro,
                        colorOff: Cores.azulCinzento,
                        iconOn: Icons.dark_mode_outlined,
                        iconOff: Icons.sunny,
                        textSize: 12,
                        onChanged: (bool state) {},
                        onDoubleTap: () {},
                        onTap: () {},
                        onSwipe: () {},
                      ),
                    )
                  ],
                ),
                onTap: () {},
              ),
              ListTile(
                leading:
                    const Icon(Icons.exit_to_app_outlined, color: Colors.black),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sair",
                        style:
                            TextStyle(fontFamily: Fontes.inter, fontSize: 12)),
                  ],
                ),
                onTap: () {
                  confirmacao(context);
                },
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 17, top: 70),
            alignment: Alignment.bottomLeft,
            height: 43,
            child: Image.asset("assets/t!e_logo.png"),
          ),
        ],
      ),
    );
  }
}

//opções do Drawer, só que com os icones padrões do flutter
class MenuOptions extends StatelessWidget {
  const MenuOptions(
      {Key? key,
      required this.icone,
      required this.opcao,
      required this.pagina})
      : super(key: key);

  final IconData icone;
  final String opcao;
  final int pagina;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icone, color: Colors.black),
      title:
          Text(opcao, style: TextStyle(fontFamily: Fontes.inter, fontSize: 12)),
      trailing: const Icon(Icons.arrow_forward_ios_outlined, size: 12),
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: AllPages(paginaAtual: pagina),
                type: PageTransitionType.rightToLeft));
      },
    );
  }
}

//opções do Drawer, só que com os icones de acordo com imagem
class MenuOptionsAssetIcon extends StatelessWidget {
  const MenuOptionsAssetIcon(
      {Key? key,
      required this.icone,
      required this.opcao,
      required this.pagina})
      : super(key: key);
  final String icone;
  final String opcao;
  final int pagina;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ImageIcon(AssetImage(icone), color: Cores.preto),
      title:
          Text(opcao, style: TextStyle(fontFamily: Fontes.inter, fontSize: 12)),
      trailing: const Icon(Icons.arrow_forward_ios_outlined, size: 12),
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: AllPages(paginaAtual: pagina),
                type: PageTransitionType.rightToLeft));
      },
    );
  }
}

//SHOW DIALOG PARA SAIR DO APLICATIVO
confirmacao(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text("Deseja sair do app?",
              style: TextStyle(
                  fontFamily: Fontes.inter,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          content: Text("Ao clicar em sim, você sairá do nosso aplicativo.",
              style: TextStyle(
                fontFamily: Fontes.inter,
                fontSize: 15,
              )),
          actions: [
            TextButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: Text("SIM",
                    style: TextStyle(
                        fontFamily: Fontes.inter,
                        fontWeight: FontWeight.bold,
                        color: Cores.azul42A5F5))),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(context);
                },
                child: Text("NÃO",
                    style: TextStyle(
                        fontFamily: Fontes.inter,
                        fontWeight: FontWeight.bold,
                        color: Cores.azul42A5F5))),
          ],
        );
      });
}
