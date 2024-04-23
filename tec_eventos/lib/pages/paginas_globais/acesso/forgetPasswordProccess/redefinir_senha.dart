// import 'package:flutter/material.dart';
// import 'package:tec_eventos/cores.dart';
// import 'package:tec_eventos/fontes.dart';


// class RedefinaSuaSenha extends StatefulWidget {
//   const RedefinaSuaSenha({Key? key}) : super(key: key);

//   @override
//   _RedefinaSuaSenhaState createState() => _RedefinaSuaSenhaState();
// }

// class _RedefinaSuaSenhaState extends State<RedefinaSuaSenha> {
//   int verSenha = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//       Text(
//         "Redefina sua senha",
//         style: TextStyle(
//           fontFamily: Fontes.inter,
//           fontSize: 23,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//       const SizedBox(height: 20),
//       Text(
//         'Informe a nova senha abaixo',
//         style: TextStyle(
//           fontFamily: Fontes.inter,
//           fontSize: 16,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10),
//         child: Container(
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(30),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey[300]!,
//                   offset: const Offset(10, 10),
//                   blurRadius: 6,
//                   spreadRadius: -5,
//                 )
//               ]),
//           child: TextFormField(
//             decoration: const InputDecoration(
//               suffixIcon: Icon(Icons.visibility_off_outlined),
//               isDense: true,
//               hintText: "*********",
//               hintStyle: TextStyle(color: Color(0xffA69F9F)),
//               border: InputBorder.none,
//               contentPadding:
//                   EdgeInsets.only(top: 18.0, right: 20, bottom: 18.0, left: 40),
//             ),
//             obscureText: verSenha == 0 ? true : false,
//           ),
//         ),
//       ),
//       const SizedBox(height: 20),
//       Text(
//         'Confirme a nova senha',
//         style: TextStyle(
//           fontFamily: Fontes.inter,
//           fontSize: 16,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10),
//         child: Container(
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(30),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey[300]!,
//                   offset: const Offset(10, 10),
//                   blurRadius: 6,
//                   spreadRadius: -5,
//                 )
//               ]),
//           child: TextFormField(
//             obscureText: true,
//             decoration: const InputDecoration(
//               suffixIcon: Icon(Icons.visibility_off_outlined),
//               isDense: true,
//               hintText: "*********",
//               hintStyle: TextStyle(color: Color(0xffA69F9F)),
//               border: InputBorder.none,
//               contentPadding:
//                   EdgeInsets.only(top: 18.0, right: 20, bottom: 18.0, left: 40),
//             ),
//           ),
//         ),
//       ),
//       const SizedBox(height: 20),
//       GestureDetector(
//         onTap: () {
//           showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   shape: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                   title: Text("Senha redefinida!",
//                       style: TextStyle(
//                           fontFamily: Fontes.inter,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500)),
//                   actions: [
//                     TextButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: Text("OK",
//                             style: TextStyle(
//                                 fontFamily: Fontes.inter,
//                                 fontWeight: FontWeight.bold,
//                                 color: Cores.azul42A5F5))),
//                   ],
//                 );
//               });
//         },
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30),
//           child: Container(
//             width: 282,
//             height: 52,
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [
//                   Cores.azul47BBEC,
//                   Cores.azul42A5F5,
//                 ], begin: Alignment.topLeft, end: Alignment.bottomRight),
//                 borderRadius: BorderRadius.circular(20)),
//             child: Center(
//               child: Text("Redefinir a senha",
//                   style: TextStyle(
//                       fontSize: 28,
//                       fontFamily: Fontes.inter,
//                       color: Cores.branco,
//                       fontWeight: FontWeight.w500)),
//             ),
//           ),
//         ),
//       ),
//     ]);
//   }
// }
