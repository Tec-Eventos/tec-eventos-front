// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:tec_eventos/cores.dart';
//
// class configuration_page extends StatelessWidget {
//   const configuration_page({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: NestedScrollView(
//           floatHeaderSlivers: true,
//           headerSliverBuilder: (context, innerBoxIsScrolled) => [],
//           body: SliverAppBar(
//             floating: false,
//             backgroundColor: Cores.AzulBebe,
//             expandedHeight: 85,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(40),
//                     bottomRight: Radius.circular(40))),
//             leading: IconButton(
//               icon: const Icon(
//                 Icons.arrow_back_ios,
//                 color: Colors.black,
//                 size: 18,
//               ),
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     PageTransition(
//                         child: AllPages(),
//                         type: PageTransitionType.leftToRight));
//               },
//             ),
//
//             actions: [
//               Builder(
//                 builder: (BuildContext context) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: GestureDetector(
//                       onTap: () {
//                         Scaffold.of(context).openDrawer();
//                       },
//                       child: Image.asset(
//                         "assets/Icons/menuicon.png",
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ],
//
//             //inicio das informações do usuário
//             bottom: PreferredSize(
//               preferredSize: Size.square(250),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   //descrição do perfil dentro do PrefferedSize
//                   CircleAvatar(
//                     radius: 50.0,
//                     backgroundImage: AssetImage("assets/imgPerfil.png"),
//                   ),
//
//                   SizedBox(height: MediaQuery.of(context).size.height / 50),
//                   Text(
//                     "Gabriel Felix",
//                     style: GoogleFonts.raleway(
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//
//                   SizedBox(height: MediaQuery.of(context).size.height / 50),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Column(
//                         children: [
//                           Text(
//                             "1000",
//                             style: GoogleFonts.raleway(
//                               fontSize: 12.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             "Seguindo",
//                             style: GoogleFonts.raleway(
//                               fontSize: 12.0,
//                             ),
//                           ),
//                         ],
//                       ),
//                       VerticalDivider(
//                         color: Colors.amber,
//                       ),
//                       Column(
//                         children: [
//                           Text(
//                             "1000",
//                             style: GoogleFonts.raleway(
//                               fontSize: 12.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             "Seguidores",
//                             style: GoogleFonts.raleway(
//                               fontSize: 12.0,
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//
//                   SizedBox(height: MediaQuery.of(context).size.height / 50),
//
//                   Text(
//                     "Desempregado",
//                     style: GoogleFonts.raleway(
//                       fontSize: 13.0,
//                     ),
//                   ),
//
//                   SizedBox(height: MediaQuery.of(context).size.height / 200),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.location_on_outlined),
//                       Text(
//                         "Marília-SP",
//                         style: GoogleFonts.raleway(
//                           fontSize: 13.0,
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   SizedBox(height: MediaQuery.of(context).size.height / 30),
//                 ],
//               ),
//             ),
//           );),
//     );
//   }
// }
