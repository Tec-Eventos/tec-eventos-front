// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:tec_eventos/cores.dart';
// import 'package:tec_eventos/paginas/pag_principal/principal_page.dart';
//
//
// class FiltragemEventos extends StatefulWidget {
//   FiltragemEventos({Key? key,
//
//     required this.palestrasBool,
//     required this.compBool,
//     required this.bootcampBool,
//     required this.icon,
//     required this.optionTrue}) : super(key: key);
//
//
//
//
//   bool palestrasBool, compBool, bootcampBool, optionTrue;
//   IconData icon;
//   @override
//   State<FiltragemEventos> createState() => _FiltragemEventosState();
// }
//
//
// bool palestras = true;
// bool competicoes = false;
// bool bootcamp = false;
//
// class _FiltragemEventosState extends State<FiltragemEventos> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 5.0),
//       child: GestureDetector(
//         onTap: () {
//           setState(() {
//             palestras = widget.palestrasBool;
//             competicoes = widget.compBool;
//             bootcamp = widget.bootcampBool;
//           });
//         },
//         child: Column(children: [
//           AnimatedContainer(
//             duration: const Duration(milliseconds: 300),
//             width: widget.optionTrue ? 120 : 50,
//             height: 50,
//             decoration: BoxDecoration(
//               borderRadius: widget.optionTrue
//                   ? BorderRadius.circular(10.0)
//                   : BorderRadius.circular(50.0),
//               border: Border.all(
//                   color: widget.optionTrue ? Colors.transparent : Cores.Azul42A5F5),
//
//
//               //cor de fundo
//               color: widget.optionTrue ? Cores.Azul42A5F5 : Colors.transparent,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//
//                 //icone
//                 Icon(
//                   widget.icon,
//                   color: widget.optionTrue ? Cores.Branco : Cores.Azul42A5F5,
//                 ),
//
//                 Padding(
//                   padding: widget.optionTrue
//                       ? const EdgeInsets.symmetric(horizontal: 10)
//                       : const EdgeInsets.all(0),
//                   child: Text(
//                     widget.optionTrue ? "Palestras" : "",
//                     style:
//                     GoogleFonts.raleway(fontSize: 12, color: Cores.Branco),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
