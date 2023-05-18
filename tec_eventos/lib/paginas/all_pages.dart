import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/componentes/Appbar/appbar.dart';
import 'package:tec_eventos/componentes/Drawer/drawer.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/paginas/pag_eventos/eventos_page.dart';
import 'package:tec_eventos/paginas/pag_principal/principal_page.dart';

class AllPages extends StatefulWidget {
  const AllPages({Key? key}) : super(key: key);

  @override
  State<AllPages> createState() => _AllPagesState();
}

class _AllPagesState extends State<AllPages> {
  late PageController _pageController;
  int paginaAtual = 0;

  //controle das páginas
  @override
  void initState() {
    _pageController = PageController(initialPage: paginaAtual);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        drawer:
            //Drawer,ou seja, o menu que aparece quando clica no botão
            const DrawerPages(),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            //appbar, ou seja, parte superior
            const AppBarPages(),
          ],
          //aqui é o corpo da página, ou seja,
          //onde vai ficar o conteúdo dela, deixe ela dentro de um ListView com o Axis.vertical.
          body: PageView.builder(
              itemCount: lista_pages.length,
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  paginaAtual = index;
                });
              },
              itemBuilder: (context, index) =>
                  Paginas(paginas: lista_pages[index])),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(displayWidth / 30),

          height: displayWidth * .155,
          decoration: BoxDecoration(
            color: Cores.Branco,
            boxShadow: [
              BoxShadow(
                color: Cores.Preto.withOpacity(.1),
                blurRadius: 30,
                offset: Offset(0, 10),
              )
            ],
            borderRadius: BorderRadius.circular(50),
          ),
          child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        paginaAtual = index;
                        HapticFeedback.lightImpact();
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Stack(
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: index == paginaAtual
                              ? displayWidth * .32
                              : displayWidth * .18,
                          alignment: Alignment.center,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.fastLinearToSlowEaseIn,
                            height:
                                index == paginaAtual ? displayWidth * .12 : 0,
                            width:
                                index == paginaAtual ? displayWidth * .32 : 0,
                            decoration: BoxDecoration(
                                color: index == paginaAtual
                                    ? Colors.blue
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: index == paginaAtual
                              ? displayWidth * .31
                              : displayWidth * .18,
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    width: index == paginaAtual
                                        ? displayWidth * .13 : 0,
                                  ),
                                  AnimatedOpacity(
                                    opacity: index == paginaAtual ? 1 : 0,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    child: Text(index == paginaAtual
                                        ? '${nomesPages[index]}'
                                        : '',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),

                                ],
                              ),

                              Row(
                                children: [
                                  AnimatedContainer(duration: Duration(milliseconds: 300),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  width: index == paginaAtual ? displayWidth * .03 : 20),

                                  Icon(
                                    iconesPages[index],
                                    size: displayWidth * .076,
                                    color: index == paginaAtual ? Colors.green : Colors.red,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
          // child: ListView.builder(
          //     itemCount: 5,
          //     scrollDirection: Axis.horizontal,
          //     padding: EdgeInsets.symmetric(horizontal: 10),
          //     itemBuilder: (context, index) =>
          //         InkWell(
          //           onTap: () {
          //             setState(() {
          //               paginaAtual = index;
          //               HapticFeedback.lightImpact();
          //             }
          //             );
          //           },
          //           splashColor: Colors.transparent,
          //           highlightColor: Colors.transparent,
          //           child: Stack(
          //             children: [
          //               AnimatedContainer(
          //                 duration: Duration(seconds: 1),
          //                 curve: Curves.fastLinearToSlowEaseIn,
          //                 width: index == paginaAtual ? displayWidth * .30 : displayWidth * .10,
          //                 alignment: Alignment.center,
          //                 height: 60,
          //
          //                 child: AnimatedContainer(
          //                   duration: Duration(seconds: 1),
          //                   curve: Curves.fastLinearToSlowEaseIn,
          //                   height: index == paginaAtual ? displayWidth * .10 : 0,
          //                   width: index == paginaAtual ? displayWidth * .30 : 0,
          //
          //                   decoration: BoxDecoration(
          //                       color: index == paginaAtual
          //                           ? Colors.blue.withOpacity(.2) : Colors.transparent,
          //                       borderRadius: BorderRadius.circular(50)),
          //                 ),
          //               ),
          //               AnimatedContainer(
          //                 duration: Duration(seconds: 1),
          //                 curve: Curves.fastLinearToSlowEaseIn,
          //                 width: index == paginaAtual ? displayWidth * .31 : displayWidth * .10,
          //                 alignment: Alignment.center,
          //                 child: Stack(
          //                   children: [
          //                     Row(
          //                       children: [
          //                         AnimatedContainer(
          //                           duration: Duration(seconds: 1),
          //                           curve: Curves.fastLinearToSlowEaseIn,
          //                           width: index == paginaAtual ? displayWidth * .13 : 0,
          //                         ),
          //                         AnimatedOpacity(
          //                           opacity: index == paginaAtual ? 1 : 0,
          //                           duration: Duration(seconds: 1),
          //                           curve: Curves.fastLinearToSlowEaseIn,
          //                           child: Text(index == paginaAtual
          //                               ? '${nomesPages[index]}'
          //                               : '',
          //                             style: const TextStyle(
          //                               color: Colors.blue,
          //                               fontWeight: FontWeight.w600,
          //                               fontSize: 12,
          //                             ),
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //
          //                     Row(
          //                       children: [
          //                         AnimatedContainer(
          //                           duration: Duration(seconds: 1),
          //                           curve: Curves.fastLinearToSlowEaseIn,
          //                           width: index == paginaAtual ? displayWidth / 25 : 28,
          //                         ),
          //                         Icon(iconesPages[index],
          //                           size: 20,
          //                           color: index == paginaAtual
          //                               ? Colors.blue
          //                               : Colors.transparent,)
          //                       ],
          //                     )
          //
          //
          //                   ],
          //                 ),
          //               )
          //             ],
          //           ),
          //         )),
        ));
  }
}

List<String> nomesPages = [
  'Início',
  'Eventos',
  'Medalhas',
  'Notificações',
  'Configurações',
];

//
// ImageIcon(
//   const AssetImage("assets/Icons/home.png")),
// Icon(Icons.confirmation_num_outlined,),
// ImageIcon(
//   const AssetImage("assets/Icons/medalhas.png"),),
//
// Icon(Icons.notifications_none_outlined,),
// ImageIcon(
//   const AssetImage("assets/Icons/configuracao.png"),
// ),

List<Widget> lista_pages = [
  PrincipalPage(),
  EventosPage(),
];

List<IconData> iconesPages = [
  Icons.notifications_none_outlined,
  Icons.ac_unit_rounded,
  Icons.access_alarm_outlined,
  Icons.accessible_forward_outlined,
];

class Paginas extends StatefulWidget {
  const Paginas({Key? key, required this.paginas}) : super(key: key);

  final Widget paginas;

  @override
  State<Paginas> createState() => _PaginasState();
}

class _PaginasState extends State<Paginas> {
  @override
  Widget build(BuildContext context) {
    return widget.paginas;
  }
}

// //Indicador de qual etapa o usuário está
// class Icone extends StatelessWidget {
//   Icone({
//     Key? key,
//     this.isActive = false,
//     required this.icone,
//   }) : super(key: key);
//
//   final bool isActive;
//   final IconData icone;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 30,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//
//             child: Icon(
//               icone,
//               color: isActive ? Cores.Azul42A5F5 : Colors.black,
//               size: 25,
//             ),
//
//           AnimatedContainer(
//             duration: Duration(milliseconds: 100),
//             height: isActive ? 2 : 0,
//             width: isActive ? 9 : 0,
//             decoration: BoxDecoration(
//               color: isActive ? Cores.Azul42A5F5 : Colors.transparent,
//               borderRadius: BorderRadius.all(Radius.circular(5)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class IconeAssetIcon extends StatelessWidget {
//   const IconeAssetIcon({
//     Key? key,
//     this.isActive = false,
//     required this.icone,
//   }) : super(key: key);
//
//   final bool isActive;
//   final String icone;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 30,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           ImageIcon(
//             AssetImage(icone),
//             color: isActive ? Cores.Azul42A5F5 : Colors.black,
//           ),
//           AnimatedContainer(
//             duration: Duration(milliseconds: 100),
//             height: isActive ? 2 : 0,
//             width: isActive ? 9 : 0,
//             decoration: BoxDecoration(
//               color: isActive ? Cores.Azul42A5F5 : Colors.transparent,
//               borderRadius: BorderRadius.all(Radius.circular(5)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
